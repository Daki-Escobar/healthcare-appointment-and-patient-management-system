````markdown
# 📚 Healthcare Appointment and Management System

## 1. 🧑‍💻 User Flow

### a. Registration
- User visits registration page.
- Enters **name, email, password, phone number**.
- System:
  - Validates input.
  - Hashes password securely.
  - Stores user in the `Users` table with default role `Patient`.

### b. Login
- User logs in with email and password.
- System:
  - Verifies credentials.
  - Starts session.
  - Grants access based on role.

---

## 2. 🤒 Patients Flow

### a. Patients
- Patients can:
  - register/login/.
  - view available doctors, and book appointments.

## 3. 🩺 Doctors Flow

### a. Doctors
- Doctors can:
  - Manage Schedules.
  - View patient information.
  - Update medical records.

---

## 4. 📖 Rules & Validations
- Passwords are hashed (e.g., bcrypt).
- Only admins can manage the system.

---

## 5. 🗄️ Database Schema (SQL)
````

### Users

```sql
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('patient', 'doctor', 'admin') DEFAULT 'patient',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Patients

```sql
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    gender VARCHAR(50),
    date_of_birth VARCHAR(50),
    contact_number VARCHAR(20),
    adddress VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);
```

### Doctors

```sql
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    specialization VARCHAR(255),
    contact_number VARCHAR(20),
    availability_schedule VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);
```

### Appointments

```sql
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date Varchar(50),
    time_slot VARCHAR(50),
    status ENUM('scheduled', 'canceled', 'completed') DEFAULT 'scheduled',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES Patients(id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(id)
);
```

### Medical_Records

```sql
CREATE TABLE Medical_Records (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    visit_date VARCHAR(50),
    diagnosis VARCHAR(50),
    treatment VARCHAR(50),
    notes VARCHAR(250),
    FOREIGN KEY (patient_id) REFERENCES Patients(id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(id)
);
```

### Cart

```sql
CREATE TABLE Admins (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);
```
---
