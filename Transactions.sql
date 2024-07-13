/*1.	Create a table “AccountHolder” to store the details of account holder like Name, Gender, DOB, 
etc. Insert some records.*/
CREATE TABLE AccountHolder (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Gender VARCHAR(10),
    DOB DATE
);

INSERT INTO AccountHolder (Name, Gender, DOB)
VALUES 
    ('Alex', 'Male', '1990-05-15'),
    ('Jane', 'Female', '1985-10-20');


/* 2.	Create another table to store the Financial transation of each account. It should include 
AccountId Foreign Key Referencing AccountHolder.Id, CR, DR, TransactionDate, etc. 
When an account gets credited, the CR column should receive value and DR should be 0. 
When an account gets debited, DR column should receive value and CR should be 0. Insert some records.
*/
-- Create another table to store the Financial transactions of each account
CREATE TABLE FinancialTransaction (
    TransactionId INT PRIMARY KEY IDENTITY(1,1),
    AccountId INT FOREIGN KEY REFERENCES AccountHolder(Id),
    CR DECIMAL(10, 2),
    DR DECIMAL(10, 2),
    TransactionDate DATETIME
);

-- Inserting sample records
-- When an account gets credited, the CR column should receive value and DR should be 0
INSERT INTO FinancialTransaction (AccountId, CR, DR, TransactionDate)
VALUES 
    (1, 500.00, 0, '2024-03-25 09:00:00'), -- Account 1 credited with 500.00
    (1, 0, 200.00, '2024-03-25 09:30:00'),-- Account 1 debited with 200.00
	(2, 1000, 0, '2024-03-22 10:30:00'),  -- Account 2 credited with 1000.00
    (1, 50000.00, 0, '2024-03-25 09:00:00'), -- Account 1 credited with 50000.00
    (1, 0, 2000.00, '2024-03-25 09:30:00'),-- Account 1 debited with 2000.00
	(2, 10000, 0, '2024-03-22 10:30:00'), -- Account 2 credited with 10000.00
	(2, 0, 8000.00, '2024-03-25 09:30:00'); -- Account 2 debited with 8000.00

/* 3.	Write a SQL query to list the total balance of each account in the database.*/
SELECT ah.Id AS AccountId, ah.Name,
    SUM(ft.CR) AS TotalCredit,
    SUM(ft.DR) AS TotalDebit,
    SUM(ft.CR - ft.DR) AS TotalBalance
FROM AccountHolder ah
INNER JOIN 
    FinancialTransaction ft ON ah.Id = ft.AccountId
GROUP BY 
    ah.Id, ah.Name;

/* 4.	Using transactions, show how one account can transfer money into another.*/
BEGIN TRY
    BEGIN TRANSACTION;

    -- Debit from Account 1 and credit to Account 2
    UPDATE FinancialTransaction
    SET DR = DR + 500
    WHERE AccountId = 1;

    UPDATE FinancialTransaction
    SET CR = CR + 500
    WHERE AccountId = 2;

    -- Commit the transaction
    IF @@TRANCOUNT > 0
        COMMIT;

    -- Print transaction successful message
    PRINT 'Transaction successful';
END TRY
BEGIN CATCH
    -- Rollback the transaction if an error occurred
    IF @@TRANCOUNT > 0
        ROLLBACK;

    -- Print error information
    SELECT ERROR_NUMBER() AS ErrorNumber;
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;



