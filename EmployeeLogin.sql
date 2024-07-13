-- 1.Create a table to Store the login credentials of the Employees in the Restaurant
--    Table : EmployeeLogin
--    Columns : Id, 
--              Username (Unique)
--              Password (Hashed Varchar)
--              Email (Unique)
--              Phone(Unique)
-- Creating the EmployeeLogin table
CREATE TABLE EmployeeLogin (
    EmployeeId INT FOREIGN KEY REFERENCES Employee(ID),
    UserName VARCHAR(100) UNIQUE NOT NULL,
    Password VARBINARY(64) NOT NULL, -- Storing password hash as VARBINARY(64) for SHA2_512
    Email VARCHAR(255) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(20) UNIQUE NOT NULL
);

-- Generating hashed password using SHA2_512 for the string 'abcdef'
DECLARE @password1 VARCHAR(100) = 'abcdef';
DECLARE @password2 VARCHAR(100) = 'xyz';
DECLARE @hashedPassword1 VARBINARY(64);
DECLARE @hashedPassword2 VARBINARY(64);

SET @hashedPassword1 = HashBytes('SHA2_512', @password1);
SET @hashedPassword2 = HashBytes('SHA2_512', @password2);

-- Inserting multiple data entries into the EmployeeLogin table
INSERT INTO EmployeeLogin (EmployeeId, UserName, Password, Email, PhoneNumber)
VALUES 
    (1, 'Ram', @hashedPassword1, 'ram@gmail.com', '9812345654'),
    (2, 'Jane', @hashedPassword2, 'jane15@email.com', '9765878465');


Select * from EmployeeLogin









