-- Insert data into the patients table
INSERT INTO patients (patient_id, first_name, last_name, dob, phone_number, medical_history_id)
VALUES (1001, 'John', 'Doe', TO_DATE('1985-02-20', 'YYYY-MM-DD'), '555-1234', 4001);

INSERT INTO patients (patient_id, first_name, last_name, dob, phone_number, medical_history_id)
VALUES (1002, 'Jane', 'Smith', TO_DATE('1990-06-15', 'YYYY-MM-DD'), '555-5678', 4002);

INSERT INTO patients (patient_id, first_name, last_name, dob, phone_number, medical_history_id)
VALUES (1003, 'Mike', 'Johnson', TO_DATE('1982-11-25', 'YYYY-MM-DD'), '555-8912', 4003);

INSERT INTO patients (patient_id, first_name, last_name, dob, phone_number, medical_history_id)
VALUES (1004, 'Alice', 'Brown', TO_DATE('1988-08-10', 'YYYY-MM-DD'), '555-6543', 4004);

INSERT INTO patients (patient_id, first_name, last_name, dob, phone_number, medical_history_id)
VALUES (1005, 'Tom', 'Williams', TO_DATE('1979-03-18', 'YYYY-MM-DD'), '555-7788', 4005);

INSERT INTO patients (patient_id, first_name, last_name, dob, phone_number, medical_history_id)
VALUES (1006, 'Emily', 'Davis', TO_DATE('1995-12-30', 'YYYY-MM-DD'), '555-2468', 4006);

INSERT INTO patients (patient_id, first_name, last_name, dob, phone_number, medical_history_id)
VALUES (1007, 'Robert', 'Taylor', TO_DATE('1967-05-05', 'YYYY-MM-DD'), '555-1357', 4007);

-- Insert data into the employees table
INSERT INTO employees (employee_id, first_name, last_name, position, phone_number)
VALUES (9001, 'Sarah', 'Connor', 'Dentist', '555-1111');

INSERT INTO employees (employee_id, first_name, last_name, position, phone_number)
VALUES (9002, 'Kyle', 'Reese', 'Dental Assistant', '555-2222');

INSERT INTO employees (employee_id, first_name, last_name, position, phone_number)
VALUES (9003, 'Peter', 'Parker', 'Hygienist', '555-3333');

INSERT INTO employees (employee_id, first_name, last_name, position, phone_number)
VALUES (9004, 'Natasha', 'Romanoff', 'Orthodontist', '555-4444');

INSERT INTO employees (employee_id, first_name, last_name, position, phone_number)
VALUES (9005, 'Bruce', 'Wayne', 'Surgeon', '555-5555');

INSERT INTO employees (employee_id, first_name, last_name, position, phone_number)
VALUES (9006, 'Clark', 'Kent', 'Periodontist', '555-6666');

INSERT INTO employees (employee_id, first_name, last_name, position, phone_number)
VALUES (9007, 'Diana', 'Prince', 'Dental Assistant', '555-7777');

-- Insert data into the appointments table
INSERT INTO appointments (appointment_id, patient_id, employee_id, appointment_date, appointment_type, status, equipment)
VALUES (2001, 1001, 9001, TO_DATE('2024-09-20', 'YYYY-MM-DD'), 'Cleaning', 'Completed', 'N95 Mask, Surgical Gloves, Dental Drill');

INSERT INTO appointments (appointment_id, patient_id, employee_id, appointment_date, appointment_type, status, equipment)
VALUES (2002, 1002, 9002, TO_DATE('2024-09-21', 'YYYY-MM-DD'), 'Extraction', 'Scheduled', 'Extraction Tool');

INSERT INTO appointments (appointment_id, patient_id, employee_id, appointment_date, appointment_type, status, equipment)
VALUES (2003, 1003, 9003, TO_DATE('2024-09-22', 'YYYY-MM-DD'), 'Consultation', 'Scheduled', 'X-ray Machine');

INSERT INTO appointments (appointment_id, patient_id, employee_id, appointment_date, appointment_type, status, equipment)
VALUES (2004, 1004, 9004, TO_DATE('2024-09-23', 'YYYY-MM-DD'), 'Braces Adjustment', 'Scheduled', 'Braces Kit');

INSERT INTO appointments (appointment_id, patient_id, employee_id, appointment_date, appointment_type, status, equipment)
VALUES (2005, 1005, 9005, TO_DATE('2024-09-24', 'YYYY-MM-DD'), 'Root Canal', 'Completed', 'Root Canal Drill, Anesthetic');

INSERT INTO appointments (appointment_id, patient_id, employee_id, appointment_date, appointment_type, status, equipment)
VALUES (2006, 1006, 9006, TO_DATE('2024-09-25', 'YYYY-MM-DD'), 'Teeth Whitening', 'Completed', 'Whitening Gel, UV Light');

INSERT INTO appointments (appointment_id, patient_id, employee_id, appointment_date, appointment_type, status, equipment)
VALUES (2007, 1007, 9007, TO_DATE('2024-09-26', 'YYYY-MM-DD'), 'Implant Consultation', 'Scheduled', 'Consultation Kit');

-- Insert data into the inventory table
INSERT INTO inventory (inventory_id, brand, item_name, date_received, expiration_date, appointment_id)
VALUES (1, '3M', 'N95 Mask', TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2025-01-10', 'YYYY-MM-DD'), 2001);

INSERT INTO inventory (inventory_id, brand, item_name, date_received, expiration_date, appointment_id)
VALUES (2, 'Medline', 'Surgical Gloves', TO_DATE('2024-01-12', 'YYYY-MM-DD'), NULL, 2001);

INSERT INTO inventory (inventory_id, brand, item_name, date_received, expiration_date, appointment_id)
VALUES (3, 'Philips', 'Dental Drill', TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2026-02-01', 'YYYY-MM-DD'), 2001);

INSERT INTO inventory (inventory_id, brand, item_name, date_received, expiration_date, appointment_id)
VALUES (4, 'Dentex', 'Extraction Tool', TO_DATE('2024-02-05', 'YYYY-MM-DD'), NULL, 2002);

INSERT INTO inventory (inventory_id, brand, item_name, date_received, expiration_date, appointment_id)
VALUES (5, 'Kodak', 'X-ray Machine', TO_DATE('2023-09-01', 'YYYY-MM-DD'), NULL, 2003);

INSERT INTO inventory (inventory_id, brand, item_name, date_received, expiration_date)
VALUES (6, 'Colgate', 'Toothpaste', TO_DATE('2024-01-15', 'YYYY-MM-DD'), NULL);

INSERT INTO inventory (inventory_id, brand, item_name, date_received, expiration_date)
VALUES (7, 'Listerine', 'Mouthwash', TO_DATE('2024-01-16', 'YYYY-MM-DD'), TO_DATE('2025-01-16', 'YYYY-MM-DD'));

INSERT INTO inventory (inventory_id, brand, item_name, date_received, expiration_date, appointment_id)
VALUES (8, 'OrthoCare', 'Braces Kit', TO_DATE('2024-03-10', 'YYYY-MM-DD'), NULL, 2004);

INSERT INTO inventory (inventory_id, brand, item_name, date_received, expiration_date, appointment_id)
VALUES (9, 'Dentsply', 'Root Canal Drill', TO_DATE('2024-03-12', 'YYYY-MM-DD'), TO_DATE('2026-03-12', 'YYYY-MM-DD'), 2005);

INSERT INTO inventory (inventory_id, brand, item_name, date_received, expiration_date, appointment_id)
VALUES (10, 'Colgate', 'Whitening Gel', TO_DATE('2024-04-15', 'YYYY-MM-DD'), TO_DATE('2025-04-15', 'YYYY-MM-DD'), 2006);

INSERT INTO inventory (inventory_id, brand, item_name, date_received, expiration_date, appointment_id)
VALUES (11, 'Philips', 'Consultation Kit', TO_DATE('2024-05-01', 'YYYY-MM-DD'), NULL, 2007);

-- Insert data into the medical_history table
INSERT INTO medical_history (medical_history_id, patient_id, medical_conditions, medications, last_updated, appointment_id_list)
VALUES (4001, 1001, 'Cavities', 'Painkillers', TO_DATE('2024-09-01', 'YYYY-MM-DD'), '2001');

INSERT INTO medical_history (medical_history_id, patient_id, medical_conditions, medications, last_updated, appointment_id_list)
VALUES (4002, 1002, 'Gum Disease', 'Antibiotics', TO_DATE('2024-09-10', 'YYYY-MM-DD'), '2002');

INSERT INTO medical_history (medical_history_id, patient_id, medical_conditions, medications, last_updated, appointment_id_list)
VALUES (4003, 1003, 'Tooth Decay', 'Antibiotics', TO_DATE('2024-09-12', 'YYYY-MM-DD'), '2003');

INSERT INTO medical_history (medical_history_id, patient_id, medical_conditions, medications, last_updated, appointment_id_list)
VALUES (4004, 1004, 'Braces', 'None', TO_DATE('2024-09-15', 'YYYY-MM-DD'), '2004');

INSERT INTO medical_history (medical_history_id, patient_id, medical_conditions, medications, last_updated, appointment_id_list)
VALUES (4005, 1005, 'Root Canal', 'Painkillers, Antibiotics', TO_DATE('2024-09-16', 'YYYY-MM-DD'), '2005');

INSERT INTO medical_history (medical_history_id, patient_id, medical_conditions, medications, last_updated, appointment_id_list)
VALUES (4006, 1006, 'Teeth Whitening', 'Whitening Gel', TO_DATE('2024-09-17', 'YYYY-MM-DD'), '2006');

INSERT INTO medical_history (medical_history_id, patient_id, medical_conditions, medications, last_updated, appointment_id_list)
VALUES (4007, 1007, 'Implant Consultation', 'None', TO_DATE('2024-09-18', 'YYYY-MM-DD'), '2007');

-- Insert data into the billing table
INSERT INTO billing (billing_id, appointment_id, patient_id, total_cost, payment_status, billing_date, due_date)
VALUES (3001, 2001, 1001, 100.00, 'Paid', TO_DATE('2024-09-21', 'YYYY-MM-DD'), TO_DATE('2024-09-25', 'YYYY-MM-DD'));

INSERT INTO billing (billing_id, appointment_id, patient_id, total_cost, payment_status, billing_date, due_date)
VALUES (3002, 2002, 1002, 250.00, 'Unpaid', TO_DATE('2024-09-22', 'YYYY-MM-DD'), TO_DATE('2024-09-30', 'YYYY-MM-DD'));

INSERT INTO billing (billing_id, appointment_id, patient_id, total_cost, payment_status, billing_date, due_date)
VALUES (3003, 2003, 1003, 150.00, 'Pending', TO_DATE('2024-09-23', 'YYYY-MM-DD'), TO_DATE('2024-09-28', 'YYYY-MM-DD'));

INSERT INTO billing (billing_id, appointment_id, patient_id, total_cost, payment_status, billing_date, due_date)
VALUES (3004, 2004, 1004, 300.00, 'Unpaid', TO_DATE('2024-09-24', 'YYYY-MM-DD'), TO_DATE('2024-10-01', 'YYYY-MM-DD'));

INSERT INTO billing (billing_id, appointment_id, patient_id, total_cost, payment_status, billing_date, due_date)
VALUES (3005, 2005, 1005, 500.00, 'Paid', TO_DATE('2024-09-25', 'YYYY-MM-DD'), TO_DATE('2024-10-05', 'YYYY-MM-DD'));

INSERT INTO billing (billing_id, appointment_id, patient_id, total_cost, payment_status, billing_date, due_date)
VALUES (3006, 2006, 1006, 200.00, 'Paid', TO_DATE('2024-09-26', 'YYYY-MM-DD'), TO_DATE('2024-10-03', 'YYYY-MM-DD'));

INSERT INTO billing (billing_id, appointment_id, patient_id, total_cost, payment_status, billing_date, due_date)
VALUES (3007, 2007, 1007, 400.00, 'Pending', TO_DATE('2024-09-27', 'YYYY-MM-DD'), TO_DATE('2024-10-04', 'YYYY-MM-DD'));

-- Insert canceled appointments for some patients and employees
INSERT INTO appointments (appointment_id, patient_id, employee_id, appointment_date, appointment_type, status, equipment)
VALUES (2008, 1001, 9001, TO_DATE('2024-09-27', 'YYYY-MM-DD'), 'Cleaning', 'Canceled', 'N95 Mask, Surgical Gloves, Suction Device');

INSERT INTO appointments (appointment_id, patient_id, employee_id, appointment_date, appointment_type, status, equipment)
VALUES (2009, 1002, 9002, TO_DATE('2024-09-28', 'YYYY-MM-DD'), 'Extraction', 'Canceled', 'Extraction Tool, N95 Mask');

INSERT INTO appointments (appointment_id, patient_id, employee_id, appointment_date, appointment_type, status, equipment)
VALUES (2010, 1003, 9003, TO_DATE('2024-09-29', 'YYYY-MM-DD'), 'Consultation', 'Canceled', 'X-ray Machine, Examination Chair');

INSERT INTO appointments (appointment_id, patient_id, employee_id, appointment_date, appointment_type, status, equipment)
VALUES (2011, 1004, 9004, TO_DATE('2024-09-30', 'YYYY-MM-DD'), 'Braces Adjustment', 'Canceled', 'Braces Kit, N95 Mask');

INSERT INTO appointments (appointment_id, patient_id, employee_id, appointment_date, appointment_type, status, equipment)
VALUES (2012, 1005, 9005, TO_DATE('2024-10-01', 'YYYY-MM-DD'), 'Root Canal', 'Canceled', 'Root Canal Drill, Suction Device');

-- Insert additional appointments for some patients and employees
INSERT INTO appointments (appointment_id, patient_id, employee_id, appointment_date, appointment_type, status, equipment)
VALUES (2013, 1001, 9001, TO_DATE('2024-10-02', 'YYYY-MM-DD'), 'Teeth Whitening', 'Completed', 'Whitening Gel, UV Light, N95 Mask');

INSERT INTO appointments (appointment_id, patient_id, employee_id, appointment_date, appointment_type, status, equipment)
VALUES (2014, 1003, 9003, TO_DATE('2024-10-03', 'YYYY-MM-DD'), 'Consultation', 'Completed', 'X-ray Machine, Consultation Kit, Examination Chair');

INSERT INTO appointments (appointment_id, patient_id, employee_id, appointment_date, appointment_type, status, equipment)
VALUES (2015, 1005, 9005, TO_DATE('2024-10-04', 'YYYY-MM-DD'), 'Root Canal', 'Completed', 'Root Canal Drill, Anesthetic, Suction Device');

-- Update the inventory to reflect the increased usage of equipment
INSERT INTO inventory (inventory_id, brand, item_name, date_received, expiration_date, appointment_id)
VALUES (12, '3M', 'N95 Mask', TO_DATE('2024-04-05', 'YYYY-MM-DD'), TO_DATE('2025-04-05', 'YYYY-MM-DD'), 2008);

INSERT INTO inventory (inventory_id, brand, item_name, date_received, expiration_date, appointment_id)
VALUES (13, 'Medline', 'Surgical Gloves', TO_DATE('2024-04-06', 'YYYY-MM-DD'), TO_DATE('2025-04-06', 'YYYY-MM-DD'), 2008);

INSERT INTO inventory (inventory_id, brand, item_name, date_received, expiration_date, appointment_id)
VALUES (14, 'Philips', 'Suction Device', TO_DATE('2024-04-10', 'YYYY-MM-DD'), TO_DATE('2026-04-10', 'YYYY-MM-DD'), 2012);

INSERT INTO inventory (inventory_id, brand, item_name, date_received, expiration_date, appointment_id)
VALUES (15, 'OrthoCare', 'Braces Kit', TO_DATE('2024-04-11', 'YYYY-MM-DD'), TO_DATE('2026-04-11', 'YYYY-MM-DD'), 2011);

INSERT INTO inventory (inventory_id, brand, item_name, date_received, expiration_date, appointment_id)
VALUES (16, 'Dentsply', 'Root Canal Drill', TO_DATE('2024-04-12', 'YYYY-MM-DD'), TO_DATE('2026-04-12', 'YYYY-MM-DD'), 2015);

INSERT INTO inventory (inventory_id, brand, item_name, date_received, expiration_date, appointment_id)
VALUES (17, 'Medline', 'Anesthetic', TO_DATE('2024-04-13', 'YYYY-MM-DD'), TO_DATE('2025-04-13', 'YYYY-MM-DD'), 2015);

INSERT INTO inventory (inventory_id, brand, item_name, date_received, expiration_date, appointment_id)
VALUES (18, 'Philips', 'Suction Device', TO_DATE('2024-04-14', 'YYYY-MM-DD'), TO_DATE('2025-04-14', 'YYYY-MM-DD'), 2015);

-- Insert additional medical history for the new appointments
INSERT INTO medical_history (medical_history_id, patient_id, medical_conditions, medications, last_updated, appointment_id_list)
VALUES (4008, 1001, 'Teeth Cleaning, Whitening', 'Painkillers, Whitening Gel', TO_DATE('2024-10-02', 'YYYY-MM-DD'), '2001, 2013');

INSERT INTO medical_history (medical_history_id, patient_id, medical_conditions, medications, last_updated, appointment_id_list)
VALUES (4009, 1003, 'Consultation', 'Antibiotics', TO_DATE('2024-10-03', 'YYYY-MM-DD'), '2003, 2014');

INSERT INTO medical_history (medical_history_id, patient_id, medical_conditions, medications, last_updated, appointment_id_list)
VALUES (4010, 1005, 'Root Canal', 'Painkillers, Antibiotics', TO_DATE('2024-10-04', 'YYYY-MM-DD'), '2005, 2015');

-- Insert data into the billing table for the new appointments
INSERT INTO billing (billing_id, appointment_id, patient_id, total_cost, payment_status, billing_date, due_date)
VALUES (3008, 2013, 1001, 200.00, 'Paid', TO_DATE('2024-10-03', 'YYYY-MM-DD'), TO_DATE('2024-10-10', 'YYYY-MM-DD'));

INSERT INTO billing (billing_id, appointment_id, patient_id, total_cost, payment_status, billing_date, due_date)
VALUES (3009, 2014, 1003, 150.00, 'Pending', TO_DATE('2024-10-04', 'YYYY-MM-DD'), TO_DATE('2024-10-11', 'YYYY-MM-DD'));

INSERT INTO billing (billing_id, appointment_id, patient_id, total_cost, payment_status, billing_date, due_date)
VALUES (3010, 2015, 1005, 500.00, 'Paid', TO_DATE('2024-10-05', 'YYYY-MM-DD'), TO_DATE('2024-10-12', 'YYYY-MM-DD'));