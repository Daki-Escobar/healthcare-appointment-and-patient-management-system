CREATE DATABASE db_cabales04_project;

USE db_cabales04_project;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE Users ADD role ENUM('user', 'admin') DEFAULT 'user';

-- Table: Users
CREATE TABLE Users (
user_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
password VARCHAR(255) NOT NULL,
role ENUM('admin', 'patient') DEFAULT 'patient'
);
-- Table: Patients
CREATE TABLE Patients (
patient_id INT PRIMARY KEY AUTO_INCREMENT,
gender VARCHAR(150) NOT NULL,
date_of_birth VARCHAR(100),
contact_number INT,
address VARCHAR(100)
);
-- Table: Doctors
CREATE TABLE Doctors (
doctor_id INT PRIMARY KEY AUTO_INCREMENT,
specialization VARCHAR(100),
contact_number INT,
availability_schedule VARCHAR(100)
);
-- Table: Appointments
CREATE TABLE Appointments (
appointment_id INT PRIMARY KEY AUTO_INCREMENT,
patient_id INT,
doctor_id INT,
appointment_date VARCHAR(100),
time_slot INT,
status (scheduled canceled, completed) VARCHAR(100),
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
-- Table: Record
CREATE TABLE Record (
record_id INT PRIMARY KEY AUTO_INCREMENT,
patient_id INT,
doctor_id INT,
visit_date VARCHAR(100),
diagnosis VARCHAR(100),
treatment VARCHAR(100),
notes TEXT,
FOREIGN KEY (user_id) REFERENCES Users(user_id),
FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Table: Admin
CREATE TABLE Admin (
admin_id INT PRIMARY KEY AUTO_INCREMENT,
department VARCHAR(100),
FOREIGN KEY (user_id) REFERENCES Users(user_id),
FOREIGN KEY (book_id) REFERENCES Books(book_id)
);