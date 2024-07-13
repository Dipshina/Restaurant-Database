-- 1. Create a table "DrinkCategory" to store the category of Drinks(Hard, Soft, Juice, Soup, etc.)
	--   Table : DrinkCategory
	--   Columns : Id, 
	--            Category (Unique)
CREATE TABLE DrinkCategory (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Category VARCHAR(50) UNIQUE NOT NULL
);


-- 2. Inserting data into DrinkCategory Table
INSERT INTO DrinkCategory (Category) 
VALUES('Hard Drink'),
('Soft Drink'),
('Juice'),
('Soup');


Select * from DrinkCategory