-- Drop tables
DROP TABLE IF EXISTS expenses;
DROP TABLE IF EXISTS clinic_sales;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS clinics;

-- Create Clinics table
CREATE TABLE clinics (
    cid INT PRIMARY KEY,
    clinic_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50)
);

-- Create Customer table
CREATE TABLE customer (
    uid INT PRIMARY KEY,
    name VARCHAR(100),
    mobile VARCHAR(15)
);

-- Create Clinic sales table
CREATE TABLE clinic_sales (
    oid INT PRIMARY KEY,
    uid INT,
    cid INT,
    amount INT,
    datetime DATE,
    sales_channel VARCHAR(50),
    FOREIGN KEY (uid) REFERENCES customer(uid),
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);

-- Create Expenses table
CREATE TABLE expenses (
    eid INT PRIMARY KEY,
    cid INT,
    description VARCHAR(255),
    amount INT,
    datetime DATE,
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);

-- Insert data into clinics
INSERT INTO clinics VALUES
(1, 'Clinic A', 'Hyderabad', 'Telangana', 'India'),
(2, 'Clinic B', 'Delhi', 'Delhi', 'India'),
(3, 'Clinic C', 'Mumbai', 'Maharashtra', 'India');

-- Insert data into customer
INSERT INTO customer VALUES
(1, 'Rishi', '9898989898'),
(2, 'Arjun', '8989898989');

-- Insert data into clinic_sales
INSERT INTO clinic_sales VALUES
(101, 1, 1, 500, '2021-11-10', 'Online'),
(102, 2, 1, 300, '2021-11-12', 'Offline'),
(103, 1, 2, 700, '2021-11-15', 'Online'),
(104, 2, 3, 400, '2021-11-18', 'Offline');

-- Insert data into clinic_sales
INSERT INTO expenses VALUES
(1, 1, 'Rent', 400, '2021-11-11'),
(2, 1, 'Electricity', 100, '2021-11-20'),
(3, 2, 'Rent', 500, '2021-11-12'),
(4, 3, 'Rent', 200, '2021-11-19');