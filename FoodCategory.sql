-- 1. Create a database "Restaurant"
CREATE DATABASE Restaurant


 -- 2. Create a table "FoodCategory" to store the type of Food(Snack, Meal, Dessert, Appetizer, etc)
 --   Table : FoodCategory
 --   Columns : Id, 
  --            Category (Unique)
CREATE TABLE FoodCategory (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Category VARCHAR(50) UNIQUE NOT NULL
);


-- 3. Inserting data into Food Category Table
INSERT INTO FoodCategory (Category)
VALUES ('Snack'),
	   ('Meal'),
	   ('Dessert'),
	   ('Appetizer');
	   
Select * from FoodCategory

-- Selecting data from FoodCategory table in sorted order
SELECT * FROM FoodCategory
ORDER BY Id;

