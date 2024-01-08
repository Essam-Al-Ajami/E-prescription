create database e_prescription;
use e_prescription;
CREATE TABLE Users (
  User_ID INT auto_increment PRIMARY KEY,
  User_Name VARCHAR(50) NOT NULL,
  Email varchar(100) NOT NULL UNIQUE,
  Password VARCHAR(50) NOT NULL,
  Phone INT NOT NULL UNIQUE,
  Expertise ENUM('Doctor', 'Pharmacist') NOT NULL,
  -- مجال الختصاص
  -- Speciality VARCHAR(50) NOT NULL,
  -- رقم الشهادة    و    رقم الرخصة
  Certificate INT NOT NULL UNIQUE,
  License INT NOT NULL UNIQUE,
  Address VARCHAR(100) NOT NULL,
  Age INT NOT NULL NOT NULL,
  Gender enum('Male','Female') NOT NULL
);

CREATE TABLE Role (
  Role_ID INT PRIMARY KEY auto_increment,
  Role_Name VARCHAR(20) NOT NULL
  );

-- Create Bridge Table  between User Table and Role Table
  CREATE TABLE Users_Role (
    Users_Role_ID INT PRIMARY KEY auto_increment,
    Role_ID INT NOT NULL,
    User_ID INT NOT NULL,
    FOREIGN KEY (Role_ID) REFERENCES Role (Role_ID),
    FOREIGN KEY (User_ID) REFERENCES Users (User_ID)
  );
  
-- Create pharmacy table
CREATE TABLE pharmacy (
  Pharmacy_ID INT PRIMARY KEY auto_increment,
  Pharmacy_Name VARCHAR(50) NOT NULL,
  Pharmacy_Address VARCHAR(100) NOT NULL,
  Pharmacy_Phone INT NOT NULL UNIQUE
);

-- Create Bridge Table  between User Table and Pharmacy Table
  CREATE TABLE Users_Pharmacy (
    Users_Pharmacy_ID INT PRIMARY KEY auto_increment,
    User_ID INT NOT NULL,
    Pharmacy_ID INT NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users (User_ID),
    FOREIGN KEY (Pharmacy_ID) REFERENCES Pharmacy (Pharmacy_ID)
  );
  
  -- Create medication table
CREATE TABLE Medicine (
  Medicine_ID INT PRIMARY KEY auto_increment,
  Medicine_Name VARCHAR(50) NOT NULL,
  Medicine_Price DECIMAL(18,2) NOT NULL CHECK (Medicine_Price > 0),
  Medicine_Dosage VARCHAR(20) NOT NULL,
  Medicine_Type enum ('tablet', 'capsule', 'syrup', 'injection', 'ointment'),
  Medicine_Quantity INT NOT NULL CHECK (Medicine_Quantity > 0)
);

  -- Create medication table between Medicine Table and Pharmacy Table
CREATE TABLE Medicien_Pharmacy (
    Medicine_Pharmacy_ID INT PRIMARY KEY auto_increment,
    Pharmacy_ID INT NOT NULL,
    Medicine_ID INT NOT NULL,
    FOREIGN KEY (Pharmacy_ID) REFERENCES Pharmacy (Pharmacy_ID),
    FOREIGN KEY (Medicine_ID) REFERENCES Medicine (Medicine_ID)
);

-- Create prescription table
CREATE TABLE Prescription (
  Prescription_ID INT  PRIMARY KEY auto_increment,
  Prescription_Date timestamp ,
  Patient_Name VARCHAR(50) NOT NULL,
  Patient_National_Number INT NOT NULL UNIQUE  CHECK (Patient_National_Number > 0),
  Patient_Age INT NOT NULL CHECK (Patient_Age > 0),
  Frequency INT NOT NULL CHECK (Frequency > 0),
  Medicine_Usage VARCHAR(100) NOT NULL,
  User_ID INT NOT NULL, 
  FOREIGN KEY (User_ID) REFERENCES Users (User_ID)
  );
  
CREATE TABLE Pharmacy_Prescription (
    Pharmacy_Prescription_ID INT PRIMARY KEY auto_increment,
    Pharmacy_ID INT NOT NULL,
    Prescription_ID INT NOT NULL,
    FOREIGN KEY (Pharmacy_ID) REFERENCES Pharmacy (Pharmacy_ID),
    FOREIGN KEY (Prescription_ID) REFERENCES Prescription (Prescription_ID)
  );
  
CREATE TABLE Medicine_Prescription (
  Medicine_Prescription_ID int PRIMARY KEY auto_increment,
  Medicine_ID int,
  Prescription_ID int,
  FOREIGN KEY (Medicine_ID) REFERENCES Medicine (Medicine_ID),
  FOREIGN KEY (Prescription_ID) REFERENCES Prescription (Prescription_ID)
 );
