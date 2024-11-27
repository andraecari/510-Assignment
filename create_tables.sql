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
    CONSTRAINT fk_patient_appointment FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    CONSTRAINT fk_employee_appointment FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE equipment (
    appointment_id NUMBER,
    equipment_item VARCHAR2(100),
    CONSTRAINT pk_equipment PRIMARY KEY (appointment_id, equipment_item),
    CONSTRAINT fk_appoinment_equipment FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

CREATE TABLE medical_history (
    medical_history_id NUMBER PRIMARY KEY,
    patient_id NUMBER NOT NULL,
    last_updated DATE NOT NULL,
    CONSTRAINT fk_patient_medical FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

CREATE TABLE medical_conditions (
    medical_history_id NUMBER,
    medical_condition VARCHAR2(255) NOT NULL,
    CONSTRAINT pk_medical_conditions PRIMARY KEY (medical_history_id, medical_condition),
    CONSTRAINT fk_med_hist_id_med_cond FOREIGN KEY (medical_history_id) REFERENCES medical_history(medical_history_id)
    
);

CREATE TABLE medications (
    medical_history_id NUMBER,
    medication VARCHAR2(255),
    CONSTRAINT pk_medications PRIMARY KEY (medical_history_id, medication),
    CONSTRAINT fk_med_hist_id_med FOREIGN KEY (medical_history_id) REFERENCES medical_history(medical_history_id)

);

CREATE TABLE patient_appointments (
    medical_history_id NUMBER,
    appointment_id NUMBER,
    CONSTRAINT pk_patient_appointments PRIMARY KEY (medical_history_id, appointment_id),
    CONSTRAINT fk_med_hist_id_pat_apt FOREIGN KEY (medical_history_id) REFERENCES medical_history(medical_history_id),
    CONSTRAINT fk_apt_id_pat_apts FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)

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