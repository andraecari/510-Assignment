CREATE TABLE patients (
    patient_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    dob DATE NOT NULL,
    phone_number VARCHAR2(15) NOT NULL,
    medical_history_id NUMBER
);

CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    position VARCHAR2(50) NOT NULL,
    phone_number VARCHAR2(15)
);

CREATE TABLE appointments (
    appointment_id NUMBER PRIMARY KEY,
    patient_id NUMBER NOT NULL,
    employee_id NUMBER NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_type VARCHAR2(50),
    status VARCHAR2(50) NOT NULL,
    equipment VARCHAR2(100),
    CONSTRAINT fk_patient_appointment FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    CONSTRAINT fk_employee_appointment FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE medical_history (
    medical_history_id NUMBER PRIMARY KEY,
    patient_id NUMBER NOT NULL,
    medical_conditions VARCHAR2(255) NOT NULL,
    medications VARCHAR2(255),
    last_updated DATE NOT NULL,
    appointment_id_list VARCHAR2(255),
    CONSTRAINT fk_patient_medical FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

CREATE TABLE inventory (
    inventory_id NUMBER PRIMARY KEY,
    brand VARCHAR2(100) NOT NULL, 
    item_name VARCHAR2(100) NOT NULL,
    date_received DATE NOT NULL,
    expiration_date DATE,
    appointment_id NUMBER,
    CONSTRAINT fk_inventory_appointment FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

CREATE TABLE billing (
    billing_id NUMBER PRIMARY KEY,
    appointment_id NUMBER NOT NULL,
    patient_id NUMBER NOT NULL,
    total_cost NUMBER(10, 2) NOT NULL,
    payment_status VARCHAR2(50) NOT NULL,
    billing_date DATE NOT NULL,
    due_date DATE,
    CONSTRAINT fk_billing_appointment FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id),
    CONSTRAINT fk_billing_patient FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);