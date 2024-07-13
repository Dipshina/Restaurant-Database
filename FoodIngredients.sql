-- 1. Create a table Ingredients to store the ingredients of each food.
-- FoodId(FK)    
-- Ingredients        
-- Unit(decimal) [Check>0]   -- stores the unit of the ingredient. 
-- IsLiquid(bit)	[default 0]-- If IsLiquid = 1 then this is ml else is mg.

CREATE TABLE FoodIngredients (
    ID INT PRIMARY KEY IDENTITY(1,1),
    FoodId INT FOREIGN KEY REFERENCES Food(Id),
    Ingredients VARCHAR(500),
    Unit DECIMAL(10, 2) CHECK (Unit > 0),
    IsLiquid BIT DEFAULT 0,
);


-- 2. Insert values into Ingredients table
-- Pizza
Insert into FoodIngredients (FoodId, Ingredients, Unit, IsLiquid)
values (4, 'Chicken', 200, 0),
(4, 'Cheese', 50, 0),
(4, 'Onion', 10, 0),
(4, 'Tomato', 10, 0),
(4, 'Flour', 400, 0),
(4, 'Water', 60, 1),
(4, 'Sauce', 30, 1),
(4, 'Garlic Powder', 10, 0),
(4, 'Salt', 5, 0),
(4, 'Oregano', 10, 0),
(4, 'Olives', 10, 0),

(5, 'Mushroom', 10, 0),
(5, 'Cheese', 50, 0),
(5, 'Onion', 10, 0),
(5, 'Tomato', 10, 0),
(5, 'Flour', 400, 0),
(5, 'Water', 60, 1),
(5, 'Sauce', 30, 1),
(5, 'Garlic Powder', 10, 0),
(5, 'Salt', 5, 0),
(5, 'Oregano', 10, 0),
(5, 'Olives', 10, 0),

(6, 'Mushroom', 10, 0),
(6, 'Bell Pepper', 40, 0),
(6, 'Cabbage', 15, 0),
(6, 'Carrot', 10, 0),
(6, 'Spinach', 10, 0),
(6, 'Cheese', 50, 0),
(6, 'Onion', 10, 0),
(6, 'Tomato', 10, 0),
(6, 'Flour', 400, 0),
(6, 'Water', 60, 1),
(6, 'Sauce', 30, 1),
(6, 'Garlic Powder', 10, 0),
(6, 'Salt', 5, 0),
(6, 'Oregano', 10, 0),
(6, 'Olives', 10, 0);

-- Sandwich
Insert into FoodIngredients (FoodId, Ingredients, Unit, IsLiquid)
values (1, 'Chicken', 200, 0),
(1, 'Cheese', 50, 0),
(1, 'Onion', 10, 0),
(1, 'Tomato', 10, 0),
(1, 'Bread', 400, 0),
(1, 'Ketchup', 30, 1),
(1, 'Mayonnaise', 20, 1),
(1, 'Mustard Sauce', 10, 1),
(1, 'Garlic Powder', 10, 0),
(1, 'Salt', 5, 0),
(1, 'Butter', 20, 0),

(2, 'Cabbage', 50, 0),
(2, 'Bell Pepper', 20, 0),
(2, 'Corn', 10, 0),
(2, 'Carrot', 5, 0),
(2, 'Cheese', 50, 0),
(2, 'Onion', 10, 0),
(2, 'Tomato', 10, 0),
(2, 'Bread', 400, 0),
(2, 'Ketchup', 30, 1),
(2, 'Mayonnaise', 20, 1),
(2, 'Mustard Sauce', 10, 1),
(2, 'Garlic Powder', 10, 0),
(2, 'Salt', 5, 0),
(2, 'Butter', 20, 0),

(3, 'Egg', 2, 0),
(3, 'Cheese', 50, 0),
(3, 'Onion', 10, 0),
(3, 'Tomato', 10, 0),
(3, 'Bread', 400, 0),
(3, 'Ketchup', 30, 1),
(3, 'Mayonnaise', 20, 1),
(3, 'Mustard Sauce', 10, 1),
(3, 'Garlic Powder', 10, 0),
(3, 'Salt', 5, 0),
(3, 'Butter', 20, 0);


--Momo
Insert into FoodIngredients (FoodId, Ingredients, Unit, IsLiquid)
values(13, 'Flour', 200, 0),
(13, 'Water', 50, 1),
(13, 'Salt', 15, 0),
(13, 'Spring Onion', 10, 0),
(13, 'Onion', 50, 0),
(13, 'Cabbage', 40, 0),
(13, 'Carrot', 15, 0),
(13, 'Bell Pepper', 20, 0),
(13, 'Soya Chunks', 15, 0),
(13, 'Spices', 10, 0),
(13, 'Garlic Ginger Paste', 10, 0),

(14, 'Flour', 200, 0),
(14, 'Water', 50, 1),
(14, 'Salt', 15, 0),
(14, 'Spring Onion', 10, 0),
(14, 'Onion', 50, 0),
(14, 'Cabbage', 40, 0),
(14, 'Carrot', 15, 0),
(14, 'Bell Pepper', 20, 0),
(14, 'Minced Chicken Meat', 200, 0),
(14, 'Spices', 10, 0),
(14, 'Garlic Ginger Paste', 10, 0),

(15, 'Flour', 200, 0),
(15, 'Water', 50, 1),
(15, 'Salt', 15, 0),
(15, 'Spring Onion', 10, 0),
(15, 'Onion', 50, 0),
(15, 'Cabbage', 40, 0),
(15, 'Carrot', 15, 0),
(15, 'Bell Pepper', 20, 0),
(15, 'Minced Buff Meat', 200, 0),
(15, 'Spices', 10, 0),
(15, 'Garlic Ginger Paste', 10, 0);

SELECT * from FoodIngredients


-- 3. What are the ingredients of Pizza?
SELECT Distinct fi.Ingredients
FROM FoodIngredients fi
Inner JOIN Food f 
ON fi.FoodId = f.Id
WHERE f.Name like '%Pizza%';


-- 4. What are the solid ingredients of Pizza?
Select Distinct fi.Ingredients
From FoodIngredients fi
Inner Join Food f
On fi.FoodId = f.Id
where fi.IsLiquid = 0 AND f.Name like '%Pizza%'


-- 5. How many kilos of flour has been used till date?
SELECT (SUM(fo.Quantity * fi.Unit))/1000 As TotalFlourUsed
FROM FoodIngredients fi
Inner Join FoodOrder fo
On fi.FoodId = fo.FoodId
WHERE fi.Ingredients = 'Flour' AND fo.OrderDate<=CAST(GETDATE() AS DATE);


-- 6. List the ingredients and their total weight.
SELECT Ingredients, SUM(Unit) AS TotalWeight
FROM FoodIngredients
GROUP BY Ingredients;


-- 7. List the food and their total weight.'
SELECT f.Name AS FoodName, SUM(fi.Unit) AS TotalWeight
FROM  Food f
INNER JOIN FoodIngredients fi 
ON f.Id = fi.FoodId
GROUP BY f.Name;


-- 8. Write a query to find the food in which liquid has not been used.

SELECT f.Name AS FoodName
FROM Food f
WHERE EXISTS (
    SELECT 1
    FROM FoodIngredients fi
    WHERE f.Id = fi.FoodId AND fi.IsLiquid = 0
);


-- 9. List the Food and total weight of Ingredients used to prepare the food. 
--    If there are no ingredients then show 0.
-- Food	          Solid	    Liquid
-- Pizza	       800	     200
-- MoMo	           500	     300
-- French Fries	  1000	      0
-- Burger	        0	      0

SELECT 
    f.Name AS Food,
    SUM(CASE WHEN i.IsLiquid = 0 THEN i.Unit ELSE 0 END) AS Solid,
    SUM(CASE WHEN i.IsLiquid = 1 THEN i.Unit ELSE 0 END) AS Liquid
FROM 
    Food f
LEFT JOIN 
    FoodIngredients i ON f.Id = i.FoodId
GROUP BY 
    f.Name;


-- 10. List the foods that do not have any ingredient
SELECT f.Name AS FoodName
FROM Food f
LEFT JOIN FoodIngredients fi ON f.Id = fi.FoodId
WHERE fi.FoodId IS NULL;
