-- B. Create examples of each of the functions in SQL
---------------------------------------------------------------------
---------------------------------------------------------------------

-- 1. Date Function
---------------------------------------------------------------------
---------------------------------------------------------------------
-- a. GETDATE
SELECT GETDATE() AS CurrentDate;

-- b. DATEADD
SELECT DATEADD(DAY, 7, GETDATE()) AS DateAfter7Days;

-- c. DATEDIFF
SELECT DATEDIFF(DAY, OrderDate, GETDATE()) AS DaysSinceOrder
FROM FoodOrder;

-- d. DATENAME
SELECT DATENAME(WEEKDAY, OrderDate) AS DayOfWeek
FROM FoodOrder;

-- e. DATEPART
SELECT DATEPART(MONTH, OrderDate) AS OrderMonth
FROM FoodOrder;

-- f. ISDATE
SELECT ISDATE(CONVERT(DATETIME, OrderDate, 120)) AS IsDate
FROM FoodOrder;


-- g. YEAR
SELECT YEAR(OrderDate) AS OrderYear
FROM FoodOrder;

-- h. MONTH
SELECT MONTH(OrderDate) AS OrderMonth
FROM FoodOrder;
---------------------------------------------------------------------

-- 2. String Function
---------------------------------------------------------------------
---------------------------------------------------------------------

-- a. CONCAT
SELECT CONCAT('Food Name: ', Name) AS ConcatenatedName
FROM Food;

-- b. DATALENGTH
SELECT Name, DATALENGTH(Name) AS DataLength
FROM Food;

-- c. LEN
SELECT Name, LEN(Name) AS Length
FROM Food;

-- d. LTRIM
SELECT '   ' + Name AS PaddedName, LTRIM('   ' + Name) AS TrimmedName
FROM Food;

-- e. RTRIM
SELECT Name + '   ' AS PaddedName, RTRIM(Name + '   ') AS TrimmedName
FROM Food;

-- f. SUBSTRING
SELECT Name, SUBSTRING(Name, 2, 3) AS SubstringResult
FROM Food;

-- g. UPPER
SELECT Name, UPPER(Name) AS UppercaseName
FROM Food;

-- h. LOWER
SELECT Name, LOWER(Name) AS LowercaseName
FROM Food;
---------------------------------------------------------------------

-- 3) Numeric Function
---------------------------------------------------------------------
---------------------------------------------------------------------
-- a. ABS
SELECT Name, Price, ABS(Price) AS AbsolutePrice
FROM Food;

-- b. CEILING
SELECT Name, Price, CEILING(Price) AS CeilingPrice
FROM Food;

-- c. FLOOR
SELECT Name, Price, FLOOR(Price) AS FloorPrice
FROM Food;

-- d. SQUARE
SELECT Name, Price, Price * Price AS SquarePrice
FROM Food;

-- e. SQRT
SELECT Name, Price, SQRT(Price) AS SquareRootPrice
FROM Food;

-- f. SIN
SELECT Name, Price, SIN(Price) AS SinePrice
FROM Food;

-- g. COS
SELECT Name, Price, COS(Price) AS CosinePrice
FROM Food;
---------------------------------------------------------------------

-- 4) Advanced Function
---------------------------------------------------------------------
---------------------------------------------------------------------
-- a. ISNULL
SELECT Name, ISNULL(Size, '-') AS FoodSize
FROM Food;

-- b. NULLIF
SELECT Name, NULLIF(Size, '-') AS SIZE
FROM Food;

-- c. CAST
SELECT Name, Price, CAST(Price AS INT) AS PriceInteger
FROM Food;

-- d. CONVERT
SELECT Name,  CONVERT(VARCHAR, OrderDate, 103) AS OrderDateFormatted
FROM Food
JOIN FoodOrder 
ON Food.Id = FoodOrder.FoodId;

-- e. IIF
SELECT Name, 
    IIF(IsVeg = 1, 'Vegetarian', 'Non-Vegetarian') AS VegStatus
FROM  Food;

-- f. ISNUMERIC
SELECT Name, ISNUMERIC(Price) AS IsPriceNumeric
FROM Food;
---------------------------------------------------------------------

-- 5) Aggregate Function
---------------------------------------------------------------------
---------------------------------------------------------------------
-- a. MIN
SELECT MIN(Price) AS MinimumPrice
FROM Food;

-- b. MAX
SELECT MAX(Price) AS MaximumPrice
FROM Food;

-- c. AVG
SELECT AVG(Price) AS AveragePrice
FROM Food;

-- d. COUNT
SELECT COUNT(*) AS TotalFoodItems
FROM Food;

-- e. SUM
SELECT SUM(fo.Quantity * f.Price) AS TotalSales
FROM Food f
JOIN FoodOrder fo 
ON f.Id = fo.FoodId;
---------------------------------------------------------------------

-- 6) User Defined Function
---------------------------------------------------------------------
---------------------------------------------------------------------
-- a. Scalar Function
-- b. Inline Table-Valued Function
-- c. Multi Statement Table-Valued Function



