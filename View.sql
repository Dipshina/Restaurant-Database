Create View viewVegFood
As
Select * from Food where IsVeg=1

Select * from viewVegFood


--View ko definition modify garnu paryo bhaney
Alter View viewVegFood
As
Select * from Food where IsVeg=0

--1. Create a view to contain FoodName and date on which they were served. 
--   Find the foods that were served in 2024 from the view. 
Create View viewFoodServed
As
Select f.Name, fo.OrderDate
from Food f
Inner Join FoodOrder fo
On f.Id = fo.FoodId

Select Distinct Name
from viewFoodServed 
where Year(OrderDate) = 2024


--2. Create a view to contain FoodName, date on which they were served,price and quantity. 
--   Find the total sales of each food for each year from the view. 

Create View viewFoodServedwithPrice
As
Select f.Name, fo.OrderDate, f.Price, fo.Quantity
from Food f
Inner Join FoodOrder fo
On f.Id = fo.FoodId

Select 


-- 3. Create a view named ViewFoodMenu that displays the menu items with their respective 
--    categories and prices.
CREATE VIEW ViewFoodMenu 
AS
SELECT f.Name AS FoodName, fc.Category AS Category, f.Price
FROM Food f
INNER JOIN FoodCategory fc ON f.CategoryID = fc.Id;

Select * from ViewFoodMenu

-- 4. Create a view named ViewIngredients that provides a list of all ingredients used in each food 
--    item along with the corresponding food names.
--    From the view, get the food names that contain chicken.
CREATE VIEW ViewIngredients AS
SELECT f.Name AS FoodName, fi.Ingredients
FROM Food f
LEFT JOIN FoodIngredients fi ON f.Id = fi.FoodId;

SELECT DISTINCT FoodName
FROM ViewIngredients
WHERE Ingredients LIKE '%Chicken%';
