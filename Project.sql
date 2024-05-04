---- TABLES CREATION

-- Create Hospital Table
CREATE TABLE Hospital (
    Hospital_ID INT PRIMARY KEY,
    Hospital_Name VARCHAR(255),
    Hospital_Address VARCHAR(255),
    Hospital_Phone VARCHAR(15)
);

-- Create Branch Table 
CREATE TABLE Branch (
    Branch_ID INT PRIMARY KEY,
    Hospital_ID INT,
    Branch_Address VARCHAR(255),
    Branch_Phone VARCHAR(15),
    FOREIGN KEY (Hospital_ID) REFERENCES Hospital(Hospital_ID)
);

-- Create Employee Table
CREATE TABLE Employee (
    Employee_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Start_Date DATE,
    Degree VARCHAR(255),
    Birth_Date DATE
);

-- Add Branch_ID column to Employee table
ALTER TABLE Employee
ADD Branch_ID INT;

-- Add foreign key constraint
ALTER TABLE Employee
ADD CONSTRAINT FK_Branch_Employee FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID);


-- Create Doctor Table
CREATE TABLE Doctor (
    Employee_ID INT PRIMARY KEY,
    Specialty VARCHAR(255),
    Office VARCHAR(255),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

-- Create Nurse Table
CREATE TABLE Nurse (
    Employee_ID INT PRIMARY KEY,
    Team VARCHAR(255),
    Shift VARCHAR(50),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

-- Create Admin Table
CREATE TABLE Admin (
    Employee_ID INT PRIMARY KEY,
    Title VARCHAR(255),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

-- Create Room Table
CREATE TABLE Room (
    Room_Number INT PRIMARY KEY,
    Nurse_ID INT,
    Occupancy VARCHAR(50),
    Precautions VARCHAR(255),
    Ward VARCHAR(50),
    Accomodations VARCHAR(255),
    FOREIGN KEY (Nurse_ID) REFERENCES Nurse(Employee_ID)
);

-- Create Patient Table
CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY,
    SSN VARCHAR(11),
    Name VARCHAR(255),
    Birth_Date DATE,
    Room_Number INT,
    Nurse_ID INT,
    Doctor_ID INT,
    FOREIGN KEY (Room_Number) REFERENCES Room(Room_Number),
    FOREIGN KEY (Nurse_ID) REFERENCES Nurse(Employee_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Employee_ID)
);

ALTER TABLE Patient
    ADD Description VARCHAR(255);

-- Create Bill Table
CREATE TABLE Bill (
    Bill_No INT PRIMARY KEY,
    Cost DECIMAL(10, 2),
    Patient_ID INT,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);

-- Create Emergency_Contact Table
CREATE TABLE Emergency_Contact (
    Name VARCHAR(255),
    Patient_ID INT,
    Address VARCHAR(255),
    Phone_Number VARCHAR(15),
    Relationship VARCHAR(50),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);


------INSERT

-- Insert data into Hospital
INSERT INTO Hospital (Hospital_ID, Hospital_Name, Hospital_Address, Hospital_Phone) VALUES
(1, 'St. Mary Hospital', '123 Main St', '555-1234');

INSERT INTO Hospital (Hospital_ID, Hospital_Name, Hospital_Address, Hospital_Phone) VALUES
(2, 'City General Hospital', '456 Branch Ave', '555-5678');

INSERT INTO Hospital (Hospital_ID, Hospital_Name, Hospital_Address, Hospital_Phone) VALUES
(3, 'Oakwood Medical Center', '789 City Ave', '555-7890');

INSERT INTO Hospital (Hospital_ID, Hospital_Name, Hospital_Address, Hospital_Phone) VALUES
(4, 'Sunrise Hospital', '101 Suburb Blvd', '555-1010');

INSERT INTO Hospital (Hospital_ID, Hospital_Name, Hospital_Address, Hospital_Phone) VALUES
(5, 'Green Hills Hospital', '555 Rural Rd', '555-5555');

-- Insert data into Branch
INSERT INTO Branch (Branch_ID, Hospital_ID, Branch_Address, Branch_Phone) VALUES
(1, 1, '123 Main St', '555-1234');

INSERT INTO Branch (Branch_ID, Hospital_ID, Branch_Address, Branch_Phone) VALUES
(2, 2, '456 Branch Ave', '555-5678');

INSERT INTO Branch (Branch_ID, Hospital_ID, Branch_Address, Branch_Phone) VALUES
(3, 3, '789 City Ave, Suite 201', '555-7890');

INSERT INTO Branch (Branch_ID, Hospital_ID, Branch_Address, Branch_Phone) VALUES
(4, 3, '789 City Ave, Suite 301', '555-7891');

INSERT INTO Branch (Branch_ID, Hospital_ID, Branch_Address, Branch_Phone) VALUES
(5, 4, '101 Suburb Blvd, Unit A', '555-1010');



-- Employees with degree MD (Employee_ID 1 to 20)
INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(1, 'John Doe', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 'MD', TO_DATE('1980-01-01', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(2, 'Jane Smith', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 'MD', TO_DATE('1985-02-01', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(3, 'David Johnson', TO_DATE('2020-03-01', 'YYYY-MM-DD'), 'MD', TO_DATE('1990-03-01', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(4, 'Emily Johnson', TO_DATE('2021-01-15', 'YYYY-MM-DD'), 'MD', TO_DATE('1985-05-20', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(5, 'Michael Brown', TO_DATE('2021-02-10', 'YYYY-MM-DD'), 'MD', TO_DATE('1990-08-15', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(6, 'Jessica Davis', TO_DATE('2020-07-20', 'YYYY-MM-DD'), 'MD', TO_DATE('1983-04-10', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(7, 'Sarah Wilson', TO_DATE('2020-05-12', 'YYYY-MM-DD'), 'MD', TO_DATE('1987-10-05', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(8, 'Andrew Miller', TO_DATE('2020-08-30', 'YYYY-MM-DD'), 'MD', TO_DATE('1992-12-15', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(9, 'Andrew', TO_DATE('2020-08-30', 'YYYY-MM-DD'), 'MD', TO_DATE('1992-12-15', 'YYYY-MM-DD'));


INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(21, ' Doe J', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 'RN', TO_DATE('1980-01-01', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(22, 'Smith K', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 'RN', TO_DATE('1985-02-01', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(23, 'David S', TO_DATE('2020-03-01', 'YYYY-MM-DD'), 'RN', TO_DATE('1990-03-01', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(24, 'Emily J', TO_DATE('2021-01-15', 'YYYY-MM-DD'), 'RN', TO_DATE('1985-05-20', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(25, 'Michael B', TO_DATE('2021-02-10', 'YYYY-MM-DD'), 'RN', TO_DATE('1990-08-15', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(26, 'Jessica D', TO_DATE('2020-07-20', 'YYYY-MM-DD'), 'RN', TO_DATE('1983-04-10', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(27, 'Sarah W', TO_DATE('2020-05-12', 'YYYY-MM-DD'), 'RN', TO_DATE('1987-10-05', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(28, 'Andrew M', TO_DATE('2020-08-30', 'YYYY-MM-DD'), 'RN', TO_DATE('1992-12-15', 'YYYY-MM-DD'));


INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(41, 'John Doe', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 'Admin', TO_DATE('1980-01-01', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(42, 'Jane Smith', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 'Admin', TO_DATE('1985-02-01', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(43, 'David Johnson', TO_DATE('2020-03-01', 'YYYY-MM-DD'), 'Admin', TO_DATE('1990-03-01', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(44, 'Emily Johnson', TO_DATE('2021-01-15', 'YYYY-MM-DD'), 'Admin', TO_DATE('1985-05-20', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(45, 'Michael Brown', TO_DATE('2021-02-10', 'YYYY-MM-DD'), 'Admin', TO_DATE('1990-08-15', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_ID, Name, Start_Date, Degree, Birth_Date) VALUES 
(9, 'Brown', TO_DATE('2021-02-10', 'YYYY-MM-DD'), 'MD', TO_DATE('1990-08-15', 'YYYY-MM-DD'));

-- Insert data into Doctor
INSERT INTO Doctor (Employee_ID, Specialty, Office) VALUES (1, 'Cardiology', 'A101');
INSERT INTO Doctor (Employee_ID, Specialty, Office) VALUES (2, 'Pediatrics', 'B202');
INSERT INTO Doctor (Employee_ID, Specialty, Office) VALUES (3, 'Neurology', 'C303');
INSERT INTO Doctor (Employee_ID, Specialty, Office) VALUES (4, 'Orthopedics', 'D404');
INSERT INTO Doctor (Employee_ID, Specialty, Office) VALUES (5, 'Oncology', 'E505');
INSERT INTO Doctor (Employee_ID, Specialty, Office) VALUES (6, 'Dermatology', 'F606');
INSERT INTO Doctor (Employee_ID, Specialty, Office) VALUES (7, 'Gynecology', 'G707');
INSERT INTO Doctor (Employee_ID, Specialty, Office) VALUES (8, 'Urology', 'H808');
INSERT INTO Doctor (Employee_ID, Specialty, Office) VALUES (9, 'Ear Specalist', 'F801');

COMMIT;
-- Insert data into Nurse
INSERT INTO Nurse (Employee_ID, Team, Shift) VALUES (21, 'Emergency', 'Day');
INSERT INTO Nurse (Employee_ID, Team, Shift) VALUES (22, 'Pediatrics', 'Night');
INSERT INTO Nurse (Employee_ID, Team, Shift) VALUES (23, 'Surgery', 'Day');
INSERT INTO Nurse (Employee_ID, Team, Shift) VALUES (24, 'Orthopedics', 'Night');
INSERT INTO Nurse (Employee_ID, Team, Shift) VALUES (25, 'Intensive Care Unit', 'Day');
INSERT INTO Nurse (Employee_ID, Team, Shift) VALUES (26, 'Obstetrics', 'Night');
INSERT INTO Nurse (Employee_ID, Team, Shift) VALUES (27, 'Cardiology', 'Day');
INSERT INTO Nurse (Employee_ID, Team, Shift) VALUES (28, 'Oncology', 'Night');

-- Insert data into Admin
INSERT INTO Admin (Employee_ID, Title) VALUES (41, 'Hospital Administrator');
INSERT INTO Admin (Employee_ID, Title) VALUES (42, 'HR Manager');
INSERT INTO Admin (Employee_ID, Title) VALUES (43, 'Finance Director');
INSERT INTO Admin (Employee_ID, Title) VALUES (44, 'Operations Manager');
INSERT INTO Admin (Employee_ID, Title) VALUES (45, 'IT Administrator');

-- Inserts for Room table
INSERT INTO Room (Room_Number, Nurse_ID, Occupancy, Precautions, Ward, Accomodations) VALUES 
(101, 21, 'Vacant', 'None', 'Pediatrics', 'Single bed');

DELETE FROM ROOM WHERE Room_Number=101;

INSERT INTO Room (Room_Number, Nurse_ID, Occupancy, Precautions, Ward, Accomodations) VALUES 
(102, 22, 'Occupied', 'Isolation', 'Emergency', 'Double bed');

INSERT INTO Room (Room_Number, Nurse_ID, Occupancy, Precautions, Ward, Accomodations) VALUES 
(103, 23, 'Vacant', 'None', 'Surgery', 'Single bed');

INSERT INTO Room (Room_Number, Nurse_ID, Occupancy, Precautions, Ward, Accomodations) VALUES 
(104, 24, 'Occupied', 'None', 'ICU', 'Single bed');

INSERT INTO Room (Room_Number, Nurse_ID, Occupancy, Precautions, Ward, Accomodations) 
VALUES (105, 25, 'Vacant', 'None', 'Emergency', 'Double bed');

INSERT INTO Room (Room_Number, Nurse_ID, Occupancy, Precautions, Ward, Accomodations) 
VALUES (106, 26, 'Occupied', 'None', 'ICU', 'Double bed');

INSERT INTO Room (Room_Number, Nurse_ID, Occupancy, Precautions, Ward, Accomodations) VALUES 
(107, 27, 'Vacant', 'None', 'Surgery', 'Single bed');

INSERT INTO Room (Room_Number, Nurse_ID, Occupancy, Precautions, Ward, Accomodations) 
VALUES (108, 28, 'Vacant', 'None', 'Emergency', 'Double bed');



-- Inserts for Patient table
INSERT INTO Patient (Patient_ID, SSN, Name, Birth_Date, Room_Number, Nurse_ID, Doctor_ID) VALUES
(1, '123-45-6789', 'Alice Johnson', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 101, 21, 1);

INSERT INTO Patient (Patient_ID, SSN, Name, Birth_Date, Room_Number, Nurse_ID, Doctor_ID) VALUES 
(2, '987-65-4321', 'Bob Smith', TO_DATE('1985-09-20', 'YYYY-MM-DD'), 102, 22, 2);

INSERT INTO Patient (Patient_ID, SSN, Name, Birth_Date, Room_Number, Nurse_ID, Doctor_ID) VALUES 
(3, '456-78-9123', 'Carol Williams', TO_DATE('1978-07-10', 'YYYY-MM-DD'), 103, 23, 3);

INSERT INTO Patient (Patient_ID, SSN, Name, Birth_Date, Room_Number, Nurse_ID, Doctor_ID) VALUES 
(4, '789-12-3456', 'David Brown', TO_DATE('1995-03-25', 'YYYY-MM-DD'), 104, 24, 4);

INSERT INTO Patient (Patient_ID, SSN, Name, Birth_Date, Room_Number, Nurse_ID, Doctor_ID) VALUES 
(5, '654-32-1987', 'Emily Taylor', TO_DATE('1983-12-30', 'YYYY-MM-DD'), 105, 25, 5);


-- Inserts for Bill table
INSERT INTO Bill (Bill_No, Cost, Patient_ID) VALUES (101, 500.00, 1);
INSERT INTO Bill (Bill_No, Cost, Patient_ID) VALUES (102, 750.00, 2);
INSERT INTO Bill (Bill_No, Cost, Patient_ID) VALUES (103, 1000.00, 3);
INSERT INTO Bill (Bill_No, Cost, Patient_ID) VALUES (104, 1200.00, 4);
INSERT INTO Bill (Bill_No, Cost, Patient_ID) VALUES (105, 800.00, 5);

-- Inserts for Emergency_Contact table
INSERT INTO Emergency_Contact (Name, Patient_ID, Address, Phone_Number, Relationship) VALUES
('Alice Johnson', 1, '123 Main St, Anytown', '555-1234', 'Spouse');

INSERT INTO Emergency_Contact (Name, Patient_ID, Address, Phone_Number, Relationship) VALUES 
('Bob Smith Jr.', 2, '456 Elm St, Anytown', '555-5678', 'Sibling');

INSERT INTO Emergency_Contact (Name, Patient_ID, Address, Phone_Number, Relationship) VALUES 
('Carol Williams', 3, '789 Oak St, Anytown', '555-9012', 'Parent');

INSERT INTO Emergency_Contact (Name, Patient_ID, Address, Phone_Number, Relationship) VALUES 
('David Brown Sr.', 4, '321 Pine St, Anytown', '555-3456', 'Child');

INSERT INTO Emergency_Contact (Name, Patient_ID, Address, Phone_Number, Relationship) VALUES 
('Emily Taylor', 5, '654 Maple St, Anytown', '555-7890', 'Friend');


---- SELECT

select * from hospital;
select * from branch;
select * from employee;
select * from doctor;
select * from nurse;
select * from admin;
select * from room;
select * from patient;
select * from Bill;
select * from emergency_contact;


--- DROP
DROP TABLE Emergency_Contact;
DROP TABLE Bill;
DROP TABLE Patient;
DROP TABLE Room;
DROP TABLE Admin;
DROP TABLE Nurse;
DROP TABLE Doctor;
DROP TABLE Employee;
DROP TABLE Branch;
DROP TABLE Hospital;



-----TRIGGERS

--- Trigger 
CREATE SEQUENCE patient_seq
    START WITH 6
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
CREATE OR REPLACE TRIGGER patient_trigger
BEFORE INSERT ON Patient
FOR EACH ROW
BEGIN
    SELECT patient_seq.NEXTVAL
    INTO :new.Patient_ID
    FROM dual;
END;
/

CREATE SEQUENCE doctor_seq START WITH 12 INCREMENT BY 1;
CREATE SEQUENCE nurse_seq START WITH 31 INCREMENT BY 1;
CREATE SEQUENCE admin_seq START WITH 45 INCREMENT BY 1;

-- Trigger for Doctors
CREATE OR REPLACE TRIGGER doctor_id_trigger
BEFORE INSERT ON Employee
FOR EACH ROW
WHEN (NEW.Degree = 'MD')
BEGIN
    SELECT doctor_seq.NEXTVAL INTO :NEW.Employee_ID FROM dual;
END;
/

-- Trigger for Nurses
CREATE OR REPLACE TRIGGER nurse_id_trigger
BEFORE INSERT ON Employee
FOR EACH ROW
WHEN (NEW.Degree = 'RN')
BEGIN
    SELECT nurse_seq.NEXTVAL INTO :NEW.Employee_ID FROM dual;
END;
/

-- Trigger for Admins
CREATE OR REPLACE TRIGGER admin_id_trigger
BEFORE INSERT ON Employee
FOR EACH ROW
WHEN (NEW.Degree = 'Admin')
BEGIN
    SELECT admin_seq.NEXTVAL INTO :NEW.Employee_ID FROM dual;
END;
/

-- Create trigger to automatically assign Employee_ID for doctors
CREATE OR REPLACE TRIGGER doctor_insert_trigger
BEFORE INSERT ON Doctor
FOR EACH ROW
DECLARE
    max_employee_id NUMBER;
BEGIN
    SELECT MAX(Employee_ID) INTO max_employee_id
    FROM Employee
    WHERE Degree = 'MD';

    IF max_employee_id IS NOT NULL THEN
        :NEW.Employee_ID := max_employee_id;
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'No Employee with MD degree found.');
    END IF;
END;
/

-- Create trigger to automatically assign Employee_ID for nurses
CREATE OR REPLACE TRIGGER nurse_insert_trigger
BEFORE INSERT ON Nurse
FOR EACH ROW
DECLARE
    max_employee_id NUMBER;
BEGIN
    SELECT MAX(Employee_ID) INTO max_employee_id
    FROM Employee
    WHERE Degree = 'RN';

    IF max_employee_id IS NOT NULL THEN
        :NEW.Employee_ID := max_employee_id;
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'No Employee with RN degree found.');
    END IF;
END;
/



---VIEWS

CREATE VIEW PatientInfoView AS
SELECT
    p.Patient_ID,
    p.Name AS Patient_Name,
    e_doctor.Name AS Assigned_Doctor_Name,
    d.Specialty AS Doctor_Specialty,
    p.Room_Number,
    e_nurse.Name AS Nurse_Name
FROM
    Patient p
JOIN
    Doctor d ON p.Doctor_ID = d.Employee_ID
JOIN
    Employee e_doctor ON d.Employee_ID = e_doctor.Employee_ID
LEFT JOIN
    Nurse n ON p.Nurse_ID = n.Employee_ID
LEFT JOIN
    Employee e_nurse ON n.Employee_ID = e_nurse.Employee_ID;
    
    
Select * from PatientInfoView;

CREATE VIEW DoctorInfoView AS
SELECT
    d.Employee_ID AS Doctor_ID,
    e.Name AS Doctor_Name,
    d.Specialty AS Doctor_Specialty,
    LISTAGG(p.Name, ', ') WITHIN GROUP (ORDER BY p.Name) AS Patients_Assigned
FROM
    Doctor d
JOIN
    Employee e ON d.Employee_ID = e.Employee_ID
JOIN
    Patient p ON d.Employee_ID = p.Doctor_ID
GROUP BY
    d.Employee_ID, e.Name, d.Specialty;
    
Select * from DoctorInfoView;


CREATE VIEW Nurse_Patient_View AS
SELECT 
    n.Employee_ID AS Nurse_ID,
    e.Name AS Nurse_Name,
    n.Team AS Nurse_Team,
    n.Shift AS Nurse_Shift,
    LISTAGG(p.Name, ', ') WITHIN GROUP (ORDER BY p.Name) AS Patient_Names,
    LISTAGG(r.Room_Number, ', ') WITHIN GROUP (ORDER BY p.Name) AS Room_Numbers
FROM 
    Nurse n
JOIN 
    Employee e ON n.Employee_ID = e.Employee_ID
LEFT JOIN 
    Patient p ON n.Employee_ID = p.Nurse_ID
LEFT JOIN 
    Room r ON p.Room_Number = r.Room_Number
GROUP BY 
    n.Employee_ID, e.Name, n.Team, n.Shift;


Select * from Nurse_Patient_View;




----STORED PROCEDURES

CREATE OR REPLACE PROCEDURE GetAllEmergencyContacts(
    emergency_contacts OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN emergency_contacts FOR
        SELECT * FROM Emergency_Contact;
END;
/

//Function

CREATE OR REPLACE FUNCTION GetTotalBillAmount(patient_id_in IN NUMBER)
RETURN DECIMAL
IS
    total_bill DECIMAL(10, 2);
BEGIN
    SELECT SUM(Cost) INTO total_bill FROM Bill WHERE Patient_ID = patient_id_in;
    
    RETURN total_bill;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
END;
/

CREATE OR REPLACE PROCEDURE GetBillForPatient(
    patient_id_in IN NUMBER,
    total_bill_out OUT DECIMAL,
    bill_info_out OUT SYS_REFCURSOR
)
IS
BEGIN
    total_bill_out := GetTotalBillAmount(patient_id_in);
    
    OPEN bill_info_out FOR
        SELECT * FROM Bill WHERE Patient_ID = patient_id_in;
END;
/

CREATE OR REPLACE PROCEDURE DischargePatient(
    patient_id_in IN NUMBER,
    room_number_in IN NUMBER,
    success_out OUT VARCHAR2,
    error_out OUT VARCHAR2
)
IS
BEGIN
    -- Delete the patient from the Patients table
    DELETE FROM Patient WHERE Patient_ID = patient_id_in;

    -- Update the room occupancy to vacant
    UPDATE Room SET Occupancy = 'Vacant' WHERE Room_Number = room_number_in;

    -- Set success message
    success_out := 'Patient discharged successfully!';

EXCEPTION
    WHEN OTHERS THEN
        -- Set error message
        error_out := 'Error discharging patient: ' || SQLERRM;
END;
/

























