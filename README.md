Library Management Database Lab – SQL Constraints
1. Introduction

A Database Management System (DBMS) is used to store and manage data efficiently. In relational databases, constraints help maintain data integrity by preventing invalid data entry.

In this lab, a database named library_lab was created with three tables: MEMBER, BOOK, and LOAN. Various constraints such as Primary Key, Foreign Key, Unique, and Check were implemented. Later, several ALTER TABLE operations were performed to modify the structure of the database.

2. Objectives

The objectives of this lab are:

Create a relational database

Implement SQL constraints

Insert records into tables

Demonstrate constraint violations/errors

Modify tables using ALTER TABLE commands

3. Database Creation
CREATE DATABASE library_lab;
USE library_lab;
4. Table Creation
MEMBER Table
CREATE TABLE MEMBER (
    MemberID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Age INT,
    Gender ENUM('Male','Female','Other'),
    CHECK (Age >= 12)
);
BOOK Table
CREATE TABLE BOOK (
    BookID INT PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    ISBN VARCHAR(50) NOT NULL UNIQUE,
    Price INT,
    Status ENUM('AVAILABLE','BORROWED') DEFAULT 'AVAILABLE',
    CHECK (Price > 0)
);
LOAN Table
CREATE TABLE LOAN (
    LoanID INT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    FOREIGN KEY (MemberID) REFERENCES MEMBER(MemberID),
    FOREIGN KEY (BookID) REFERENCES BOOK(BookID)
);
5. Data Insertion
Insert MEMBER Data
INSERT INTO MEMBER VALUES
(1,'Rahim Uddin','rahim@gmail.com',22,'Male'),
(2,'Karim Ahmed','karim@gmail.com',25,'Male'),
(3,'Sadia Islam','sadia@gmail.com',21,'Female'),
(4,'Nusrat Jahan','nusrat@gmail.com',23,'Female'),
(5,'Tanvir Hasan','tanvir@gmail.com',24,'Male');
Insert BOOK Data
INSERT INTO BOOK VALUES
(101,'Database System','ISBN001',500,'AVAILABLE'),
(102,'Java Programming','ISBN002',600,'AVAILABLE'),
(103,'Data Structures','ISBN003',550,'AVAILABLE'),
(104,'Operating System','ISBN004',650,'AVAILABLE'),
(105,'Computer Networks','ISBN005',700,'AVAILABLE');
Insert LOAN Data
INSERT INTO LOAN VALUES
(1,1,101),
(2,2,102),
(3,3,103),
(4,4,104),
(5,5,105),
(6,1,103);
6. Constraint Error Demonstration

Example: Attempting to insert a duplicate email:

INSERT INTO MEMBER VALUES
(6,'Test User','rahim@gmail.com',20,'Male');

Error Message:

#1062 Duplicate entry 'rahim@gmail.com' for key 'Email'
7. ALTER TABLE Operations
Add Phone Column
ALTER TABLE MEMBER
ADD Phone VARCHAR(15) NOT NULL DEFAULT 'N/A';
Modify Price Column
ALTER TABLE BOOK
MODIFY Price DECIMAL(8,2);
Change Column Name
ALTER TABLE BOOK
CHANGE Status Availability ENUM('AVAILABLE','BORROWED') DEFAULT 'AVAILABLE';
Drop Gender Column
ALTER TABLE MEMBER
DROP COLUMN Gender;
Rename Table
RENAME TABLE LOAN TO BORROW;
8. GitHub Repository

The complete SQL scripts and project files are available on GitHub:

https://github.com/Logno12/library-lab-constraints

Repository includes:

SQL queries

Database design

Table creation

Data insertion

ALTER TABLE operations

README documentation

9. Result

The database was successfully created.

Constraints were implemented correctly.

Data insertion was performed, and errors were observed when constraints were violated.

10. Conclusion

This lab provided practical knowledge of SQL constraints and table modification techniques. Constraints help maintain data integrity, and ALTER TABLE commands allow modifications to the database structure after creation.
