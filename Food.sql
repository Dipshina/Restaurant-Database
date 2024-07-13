-- 1.Create a table "Food" to Store the foods available in the Restaurant.
--    Table : Food
--    Columns : Id, 
--              Name (Unique)         
--              Size  (Char(1))
--              Price(check > 0)
--              IsVeg(bit default 1)
--              CategoryID(Int FK referencing FoodCategory.Id) 
CREATE TABLE Food (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(255) UNIQUE NOT NULL,
    Size CHAR(1),
    Price DECIMAL(10, 2) CHECK (Price > 0) NOT NULL,
    IsVeg BIT DEFAULT 1,
    CategoryID INT FOREIGN KEY References FoodCategory(Id)
);


-- 2. Inserting data into Food Table
INSERT INTO Food (Name, Size, Price, IsVeg, CategoryID)
VALUES('Chicken Sandwich', 'L', 299.99, 0, 1),
	('Veg Sandwich', 'M', 220.00, 1, 1),
	('Egg Sandwich', 'S', 179.99, 0, 1),
    ('Chicken Pizza', 'L', 500.00, 0, 1),
	('Mushroom Pizza', 'M', 400.00,  1, 1),
	('Veg Pizza', 'S', 299.99, 1, 1),
	('Thakali Khana Set', 'L', 999.99, 0, 2),
	('Newari Khana Set', 'L', 599.99, 0, 2),
	('Icecream', 'M', 99.99, 1, 3),
    ('Chocolate Cake', 'S', 119.99, 1, 3),
	('Masala Peanuts', 'S', 120.00, 1, 4),
	('French Chilli', 'S', 199.99, 1, 4),
	('Veg Momo', 'L', 149.99, 1, 1),
	('Chicken Momo', 'L', 200.00, 0, 1),
	('Buff Momo', 'L', 250.00, 0, 1),
	('Cotton Candy', '-', 50.00, 1, 3),
	('Choco Lava', 150, 1, 3);

	Select * from Food


-- Selecting name and category of food from Food table
SELECT
    Food.Name AS FoodName,
    FoodCategory.Category AS FoodCategory
FROM
    Food
JOIN
    FoodCategory ON Food.CategoryID = FoodCategory.Id;

-- 3. List only the veg food.
Select Name from Food
where IsVeg=1;

-- 4. List only the non-veg food.
Select Name from Food
where IsVeg = 0;

-- 5. List the Snacks ordered today.
Select DISTINCT f.Name from Food f
Inner Join FoodOrder fo
On fo.FoodId = f.Id
Inner Join FoodCategory fc
On fc.Id = f.CategoryID
where fc.Category = 'Snack' and fo.OrderDate = CONVERT(Date, GetDate());


-- 6. List the food that start with "C".
Select Name from Food
where Name LIKE 'C%'

-- 7. List the food items that were ordered before December 7, 2022.
Select DISTINCT f.Name from Food f
Inner Join FoodOrder fo
On f.Id = fo.FoodId
where OrderDate < '2022-12-07';

-- 8. List the food available and sort them alphabetically.
Select Name from Food
Order By Name;

-- 9. What are the non-veg food that are pricier than 150.
Select Name from Food
where IsVeg = 0 and Price>150;


-- 10. List the food and their order dates that were ordered yesterday and today.
SELECT f.Name, fo.OrderDate
FROM Food f
INNER JOIN FoodOrder fo 
ON fo.FoodId = f.Id
WHERE fo.OrderDate >= CONVERT(Date, GETDATE() - 1) AND fo.OrderDate < CONVERT(Date, GETDATE() + 1);

-- OR

SELECT f.Name, fo.OrderDate
FROM Food f
INNER JOIN FoodOrder fo 
ON fo.FoodId = f.Id
WHERE fo.OrderDate = CAST(GETDATE() AS DATE)
OR fo.OrderDate = CAST(DATEADD(DAY, -1, GETDATE()) AS DATE);


-- 11. List the food and their order dates that were ordered in December 2023 and sort them their order dates.
SELECT f.Name, fo.OrderDate
FROM Food f
INNER JOIN FoodOrder fo 
ON fo.FoodId = f.Id
WHERE fo.OrderDate >= '2023-12-01' AND fo.OrderDate < '2023-01-01'
ORDER BY fo.OrderDate;

-- 12. List the food that were ordered in 2022 and alphabetically.
SELECT f.Name
FROM Food f
INNER JOIN FoodOrder fo 
ON fo.FoodId = f.Id
WHERE Year(fo.OrderDate) = 2022
ORDER BY f.Name;

-- 13. List the food that were ordered yesterday.
SELECT f.Name
FROM Food f
INNER JOIN FoodOrder fo 
ON fo.FoodId = f.Id
WHERE fo.OrderDate = CONVERT(Date, GETDATE() - 1) ;

-- OR

SELECT  DISTINCT f.Name
FROM Food f
INNER JOIN FoodOrder fo 
ON fo.FoodId = f.Id
WHERE fo.OrderDate = CAST(DATEADD(DAY, -1, GETDATE()) AS DATE);

-- 14. List the total number of large, medium and small pizza served. Show the result as:
-- Pizza        Total
-- Large         10
-- Medium        8
-- Small         5
 
SELECT 
    f.Size AS 'Pizza',
    COUNT(*) AS 'Total'
FROM 
    Food f
JOIN 
    FoodOrder fo ON fo.FoodId = f.Id
WHERE 
    f.Name LIKE '%Pizza%'
GROUP BY 
    f.Size;


-- 15. How many units of momos were sold on December 2023?
SELECT f.Name AS FoodName, SUM(fo.Quantity) AS TotalUnitsSold
FROM Food f
Inner JOIN FoodOrder fo 
ON fo.FoodId = f.Id
WHERE
    f.Name LIKE '%Momo%'
    AND fo.OrderDate >= '2023-12-01'
    AND fo.OrderDate < '2024-01-01'
GROUP BY
    f.Name;

-- 16. How many units of momos were sold on last Saturday?
SELECT f.Name AS FoodName,
    SUM(fo.Quantity) AS TotalUnitsSold
FROM Food f
INNER JOIN FoodOrder fo 
ON fo.FoodId = f.Id
WHERE
    f.Name LIKE '%Momo%'
    AND fo.OrderDate = CONVERT(Date, GetDate() - DATEPART(DW, GetDate()))  
GROUP BY
    f.Name;


	SELECT CONVERT(Date, GetDate() - DATEPART(DW, GetDate()))

-- 17. List the Category and the cheapest food in each Category.
-- Category		Food
-- Dessert		Ice Cream
-- Snacks		Chips
SELECT fc.Category as Category, f.Name as CheapestFoood
From FoodCategory fc
Inner Join Food f
On fc.Id = f.CategoryID
WHERE
    f.Price = (
        SELECT MIN(Price)
        FROM Food f2
        WHERE
            f2.CategoryID = fc.Id
    );



-- 18. List the category and the total price of food sold in each category. Sort by total sales descending.
SELECT fc.Category AS Category,
    SUM(fo.Quantity * f.Price) AS TotalSales
FROM FoodCategory fc
INNER JOIN Food f ON fc.Id = f.CategoryID
LEFT JOIN FoodOrder fo ON f.Id = fo.FoodId
GROUP BY fc.Category
ORDER BY TotalSales DESC;


-- 19. List the category of food and their total sales only if total is more than 500. Sort them by total descending.
SELECT
    fc.Category AS Category,
    SUM(fo.Quantity * f.Price) AS TotalSales
FROM
    FoodCategory fc
INNER JOIN
    Food f ON fc.Id = f.CategoryID
LEFT JOIN
    FoodOrder fo ON f.Id = fo.FoodId
GROUP BY
    fc.Category
HAVING
    SUM(fo.Quantity * f.Price) > 500
ORDER BY
    TotalSales DESC;


-- 20. Show the sales of each year. Sort them by Year.
SELECT
    YEAR(fo.OrderDate) AS SalesYear,
    SUM(fo.Quantity * f.Price) AS TotalSales
FROM
    FoodOrder fo
INNER JOIN
    Food f ON fo.FoodId = f.Id
GROUP BY
    YEAR(fo.OrderDate)
ORDER BY
    SalesYear;



	Select * from Food





