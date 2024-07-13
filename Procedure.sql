/* Create a table type. */
CREATE TYPE LaptopType AS TABLE
      ( 
  Brand VARCHAR(100)
, Type  VARCHAR(100) 
, Price DECIMAL(10,2)
, ManufacturedDate DATE
, Warranty INT
);
/* Create a procedure to receive data for the table-valued parameter. */
CREATE PROCEDURE dbo.InsertLaptop
   @laptop LaptopType READONLY,
   @Model Varchar(100)
      AS
      INSERT INTO [Laptop]
         (
            Brand
            ,Type
            ,Price
,ManufacturedDate
,Warranty
,Model
         )
      SELECT Brand
            ,Type
            ,Price
,ManufacturedDate
,Warranty
,@Model 
FROM @laptop;
/* Declare a variable that references the type. */
DECLARE @laptop1 AS LaptopType;
/* Add data to the table variable. */
INSERT INTO @laptop1 (
Brand
, Type
, Price
,ManufacturedDate
,Warranty
 )
   SELECT
            Brand
            , Type
            , Price
, ManufacturedDate
, Warranty
   FROM Laptop WHERE ID = 1;
  
/* Pass the table variable data to a stored procedure. */
EXEC InsertLaptop @laptop1, 'l-10';



-- 1.	Create a stored proc to pass the date range as input parameter. 
--      The procedure should show the details of the food ordered within the date range.
CREATE PROCEDURE GetFoodDetails
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT *
    FROM Food f
    INNER JOIN FoodOrder fo ON fo.FoodId = f.Id
    WHERE fo.OrderDate BETWEEN @StartDate AND @EndDate;
END

EXEC GetFoodDetails '2019-01-01', '2022-01-01';


-- 2. Create a stored proc to pass the year as parameter. 
--    The proc should show the total amount of sales in each category within the year.
CREATE PROCEDURE GetSalesByCategoryWithinYear
    @Year INT
AS
BEGIN
    SELECT c.Category,
        YEAR(fo.OrderDate) AS SalesYear, 
		SUM(fo.Quantity * f.Price) AS TotalSales
    FROM FoodOrder fo
    INNER JOIN Food f ON fo.FoodId = f.Id
    INNER JOIN FoodCategory c ON f.CategoryID = c.Id
    WHERE YEAR(fo.OrderDate) = @Year
    GROUP BY c.Category, YEAR(fo.OrderDate);
END

EXEC GetSalesByCategoryWithinYear @Year = 2023; 



-- 3. Create a proc to pass the year as parameter. 
-- The proc should show the number of times each item were ordered in that year. 

CREATE PROCEDURE GetOrdersCountByYear
    @Year INT
AS
BEGIN
    SELECT
        f.Name AS FoodItem,
        COUNT(*) AS OrdersCount
    FROM FoodOrder fo
    INNER JOIN Food f 
	ON fo.FoodId = f.Id
    WHERE YEAR(fo.OrderDate) = @Year
    GROUP BY f.Name;
END

EXEC GetOrdersCountByYear @Year = 2022; 


/* 4. Create a proc to receive UserName and Password as parameter. The proc should check if the 
input values match the ones stored in table. 
If matched show 'Success' else show 'Username or Password mismatched'.
*/
CREATE PROCEDURE ValidateLogin
    @InputUsername VARCHAR(100),
    @InputPassword VARCHAR(100)
AS
BEGIN

    IF EXISTS (
        SELECT 1
        FROM EmployeeLogin
        WHERE UserName = @InputUsername
          AND Password = HashBytes('SHA2_512', @InputPassword)
    )
    BEGIN
        PRINT 'Success';
    END
    ELSE
    BEGIN
        PRINT 'Username or Password mismatched';
    END
END;

EXEC ValidateLogin @InputUsername = 'Ram', @InputPassword = 'abcdef';



/*Create a proc to receive the two account numbers and amount. The proc should be able to 
transfer the amount from one account to another.
USe Commit and Rollback in this case.
*/





/* Create a procedure CheckCredentials that would check the users credentials. The procedure 
should accept UserName and Password as parameters and the proc should check if the supplied 
username and password matches with the ones stored in the table. If both the usernama and 
passwords match, it should show "Correct Password" if not it should show "Incorrect Password"*/
CREATE PROCEDURE CheckCredentials
    @UserName VARCHAR(100),
    @Password VARCHAR(100)
AS
BEGIN
    IF @UserName IS NULL OR @UserName = ''
    BEGIN
        PRINT 'Username cannot be empty';
        RETURN;
    END

    IF @Password IS NULL OR @Password = ''
    BEGIN
        PRINT 'Password cannot be empty';
        RETURN;
    END

    DECLARE @CorrectPassword VARBINARY(64);

    SELECT @CorrectPassword = Password
    FROM EmployeeLogin
    WHERE UserName = @UserName;

    IF @CorrectPassword IS NULL
    BEGIN
        PRINT 'Incorrect Username';
    END
    ELSE IF @CorrectPassword = HashBytes('SHA2_512', @Password)
    BEGIN
        PRINT 'Correct Password';
    END
    ELSE
    BEGIN
        PRINT 'Incorrect Password';
    END
END;

EXEC CheckCredentials 'ram', 'abcdef';




/* Create a proc to receive the two account numbers and amount. The proc should be able to 
transfer the amount from one account to another.
USe Commit and Rollback in this case.*/
CREATE PROCEDURE TransferAmount
    @FromAccountId INT,
    @ToAccountId INT,
    @Amount DECIMAL(10, 2)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Deduct amount from the source account
        UPDATE FinancialTransaction
        SET DR = DR + @Amount
        WHERE AccountId = @FromAccountId;

        -- Add amount to the destination account
        UPDATE FinancialTransaction
        SET CR = CR + @Amount
        WHERE AccountId = @ToAccountId;

        COMMIT;
        PRINT 'Transfer successful';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;

        PRINT 'Transfer failed. Error: ' + ERROR_MESSAGE();
    END CATCH;
END;

EXEC TransferAmount @FromAccountId = 1, @ToAccountId = 2, @Amount = 500.00;

