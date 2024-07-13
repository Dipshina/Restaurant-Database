-- 1. Create a table variable to store the foods that start  with c.
DECLARE @foodstartingwithc table (
    ID INT primary Key Identity(1,1),
    Name VARCHAR(255)
);

INSERT INTO @foodstartingwithc (Name)
SELECT Name
FROM Food
WHERE Name LIKE 'C%';

SELECT * FROM @foodstartingwithc;

-- 2. Create a global table variable to store the foods that contain Chicken.
Declare @@foodcontainingchicken table(
ID int Primary key Identity(1,1),
Name VARCHAR(100)
)

INSERT INTO @@foodcontainingchicken (Name)
SELECT Name
FROM Food 
Inner Join FoodIngredients
On Food.Id = FoodIngredients.FoodId
WHERE Ingredients = 'Chicken';

SELECT * FROM @@foodcontainingchicken;

-- 3. Create a temporary table to store the number of veg and non-veg items sold in each year.
--			Year	| Veg	| Non-Veg	|
--			2021	| 10	| 12		|
--			2022	| 12	| 15		|
--			2023	| 8		| 14		|
CREATE TABLE #SalesSummary (
    Year INT,
    Veg INT,
    NonVeg INT
);

INSERT INTO #SalesSummary (Year, Veg, NonVeg)
SELECT 
    YEAR(fo.OrderDate) AS Year,
    SUM(CASE WHEN f.IsVeg = 1 THEN fo.Quantity ELSE 0 END) AS Veg,
    SUM(CASE WHEN f.IsVeg = 0 THEN fo.Quantity ELSE 0 END) AS NonVeg
FROM 
    FoodOrder fo
INNER JOIN 
    Food f ON fo.FoodId = f.Id
GROUP BY 
    YEAR(fo.OrderDate);

SELECT * FROM #SalesSummary;


-- 4. Create a temporary table to store each category and total sales in each category include total sales.
--			Category	| Total	| 
--			Snacks		| 1000	|
--			Dessert		| 1200	|
--			Meal		| 1500	|
--			Total		| 3700	|

CREATE TABLE #CategorySales (
    Category VARCHAR(50),
    Total DECIMAL(10, 2)
);

INSERT INTO #CategorySales (Category, Total)
SELECT fc.Category, Sum(f.Price * fo.Quantity)
FROM FoodCategory fc
INNER JOIN
    Food f ON fc.Id = f.CategoryID
INNER JOIN 
	FoodOrder fo ON fo.FoodId = f.CategoryID
GROUP BY fc.Category

INSERT INTO #CategorySales (Category, Total)
SELECT 'Total', SUM(Total)
FROM #CategorySales;

SELECT * FROM #CategorySales;








