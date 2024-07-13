-- Create a table “Employee” to store the details of the Employee in the restaurant
-- Table: Employee
-- Columns: ID
--	      FirstName
--       LastName
--  	    Phone
--  	    Address

CREATE TABLE Employee (
    ID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Phone VARCHAR(20) UNIQUE,
    Address VARCHAR(255)
);


-- Inserting data into Employee table
INSERT INTO Employee (FirstName, LastName, Phone, Address)
VALUES ('Ram', 'Nath', '9812345654', 'Kapan'),
       ('Jane', 'Shah', '9765878465', 'Baneshwor'),
       ('Kapil', 'Sharma', '9765453456', 'Chabahil');

	   Select * from Employee

