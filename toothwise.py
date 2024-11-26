import oracledb
import tkinter as tk
import tkinter.messagebox as messagebox
from tkinter import ttk, Label, PhotoImage
import datetime
import config

def format_data(rows):
    for row in rows:
        for key, value in row.items():
            if isinstance(value, datetime.datetime):
                row[key] = value.strftime('%Y-%m-%d')  # Format datetime to only display the date
    return rows

def read_sql(path):
    try:
        with open(path, "r") as file:
            sql_commands = file.read()
        return [command.strip() for command in sql_commands.split(";") if command.strip()]
    except Exception as e:
        print(f"Error reading SQL file: {e}")
        return []

# Function to update query_string based on selected radio button
def update_query_string(selection):
    global query_string
    query_strings = {
        "Patients": "SELECT * FROM patients",
        "Employees": "SELECT * FROM employees",
        "Appointments": "SELECT * FROM appointments",
        "Billing": "SELECT * FROM billing",
        "Medical History": "SELECT * FROM medical_history",
        "Inventory": "SELECT * FROM inventory"
    }
    query_string = query_strings.get(selection, "")
    print(f"Query string updated to: {query_string}")  # For debugging

# Function to execute query and update the Treeview
def execute_query():
    global tree, tree_frame

    # Clear any existing Treeview
    for widget in tree_frame.winfo_children():
        widget.destroy()

    tree_frame.pack_propagate(False)  # Prevent the frame from resizing with its contents
    tree_frame.config(height=400)  # Explicitly set the height

    try:
        # Execute the query
        cursor.execute(query_string)

        columns = [col[0] for col in cursor.description]
        cursor.rowfactory = lambda *args: dict(zip(columns, args))

        data = cursor.fetchall()
        data = format_data(data)

        # Determine column widths dynamically
        column_widths = {}
        for column in columns:
            # Default column width
            column_widths[column] = 100
            for row in data:
                value = str(row[column])
                if len(value) > 10:
                    column_widths[column] = 250
                    break

        # Create a new Treeview widget
        tree = ttk.Treeview(tree_frame, show="headings")
        tree["columns"] = columns

        # Configure Treeview columns
        for column in columns:
            tree.heading(column, text=column)
            tree.column(column, anchor="w", width=column_widths[column])

        # Insert data into the Treeview
        for row in data:
            values = [row[column] for column in columns]
            tree.insert("", "end", values=values)

        # Add the Treeview to the frame
        tree.pack(fill="both", expand=True)

        print("Treeview updated with new query results.")
    except Exception as e:
        if "ORA-00942: table or view does not exist" in str(e):
            messagebox.showinfo("Ok", "Table does not exist. Please press Create Tables.")
        print(f"Error executing query: {e}")

# Function to drop tables
def drop_tables():
    try:
        sql_commands = read_sql("drop_tables.sql")
        for command in sql_commands:
            cursor.execute(command)
        connection.commit()
        messagebox.showinfo("Success", "All Tables have been dropped.")
        print("All tables dropped successfully.")
    except Exception as e:
        if "ORA-00942: table or view does not exist" in str(e):
            messagebox.showinfo("Ok", "You cannot Drop Tables that don't exist.")
        print(f"Error dropping tables: {e}")

# Function to create tables
def create_tables():
    try:
        sql_commands = read_sql("create_tables.sql")
        for command in sql_commands:
            cursor.execute(command)
        connection.commit()
        # Display success message
        messagebox.showinfo("Success", "All Tables have been created.")
        print("Tables created successfully.")
    except Exception as e:
        if "ORA-00955: name is already used by an existing object" in str(e):
            messagebox.showinfo("Ok", "Tables already exist.")
        print(f"Error creating tables: {e}")

# Function to populate tables
def populate_tables():
    try:
        sql_commands = read_sql("populate_tables.sql")
        for command in sql_commands:
            cursor.execute(command)
        connection.commit()
        messagebox.showinfo("Success", "Tables have been populated with Data.")
        print("Tables populated successfully.")
    except Exception as e:
        if "ORA-00001: unique constraint" in str(e):
            messagebox.showinfo("Ok", "Tables already exist.")
        print(f"Error creating tables: {e}")

# Function to handle cleanup when exiting
def on_exit():
    try:
        # Commit any pending transactions
        connection.commit()
        print("Committed any pending transactions.")
        
        # Close the database connection
        connection.close()
        print("Database connection closed.")
    except Exception as e:
        print(f"Error during cleanup: {e}")
    finally:
        # Exit the Tkinter main loop
        r.quit()

def main():
    global r, tree_frame, cursor, connection, query_string

    # Database connection details. Make a config.py file or hardcode these in.
    username = config.USERNAME
    dsn = config.DSN
    password = config.PASSWORD

    connection = oracledb.connect(user=username, password=password, dsn=dsn)
    cursor = connection.cursor()

    # Create the main window
    r = tk.Tk()
    r.title("ToothWise")

    # Load the image (ensure the file path is correct)
    logo = PhotoImage(file="toothwise.png")

    # Create a frame to hold the logo and text
    header_frame = tk.Frame(r)
    header_frame.pack(pady=20)  # Add some padding above the header

    # Add the logo to the header
    logo_label = Label(header_frame, image=logo)
    logo_label.grid(row=0, column=0, padx=10)  # Add padding between image and text

    # Add the text next to the logo
    text_label = Label(header_frame, text="ToothWise", font=("Arial", 24))
    text_label.grid(row=0, column=1)

    # Keep the reference to the image to prevent garbage collection
    logo_label.image = logo

    r.iconphoto(True, logo)

    # Create a frame for the first row of buttons
    button_frame = ttk.Frame(r, padding="10")
    button_frame.pack(side="top", fill="x")

    # Add buttons to the first row
    create_button = ttk.Button(button_frame, text="Create Tables", command=create_tables)
    create_button.pack(side="left", padx=5)

    populate_button = ttk.Button(button_frame, text="Populate Tables", command=populate_tables)
    populate_button.pack(side="left", padx=5)

    drop_button = ttk.Button(button_frame, text="Drop Tables", command=drop_tables)
    drop_button.pack(side="left", padx=5)

    # Exit button with command to execute cleanup and exit
    exit_button = ttk.Button(button_frame, text="Exit", command=on_exit)
    exit_button.pack(side="left", padx=5)

    # Create a frame for the second row (radio buttons and Query button)
    query_frame = ttk.Frame(r, padding="10")
    query_frame.pack(side="top", fill="x")

    # Variable to hold the selected radio button value
    selected_table = tk.StringVar()
    selected_table.set("Patients")  # Default selection
    query_string = "SELECT * FROM patients"  # Initialize to default query

    # Add radio buttons for table selection
    radio_options = ["Patients", "Employees", "Appointments", "Billing", "Medical History", "Inventory"]
    for option in radio_options:
        ttk.Radiobutton(
            query_frame,
            text=option,
            variable=selected_table,
            value=option,
            command=lambda option=option: update_query_string(option)  # Update query_string on selection
        ).pack(side="left", padx=5)

    # Add "Query" button to the right of the radio buttons
    query_button = ttk.Button(query_frame, text="Query", command=execute_query)
    query_button.pack(side="right", padx=5)

    # Create a frame for the Treeview (initially empty)
    tree_frame = ttk.Frame(r, padding="10", width=800, height=400)  # Reserve space for Treeview
    tree_frame.pack(side="top", fill="both", expand=True)

    # Run the Tkinter main loop
    r.mainloop()

if __name__ == "__main__":
    main()
