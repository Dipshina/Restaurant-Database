-- Create a table “Ingredients” to store the list of ingredients of a specific drink
-- Table: Ingredients
-- Columns: ID
-- DrinkId(FK)
-- Ingredients
-- Unit
-- IsLiquid
CREATE TABLE DrinkIngredients(
    ID INT PRIMARY KEY IDENTITY(1,1),
    DrinkId INT FOREIGN KEY REFERENCES Drink(Id),
    Ingredients VARCHAR(500),
    Unit DECIMAL(10, 2) CHECK (Unit > 0),
    IsLiquid BIT DEFAULT 0
);


-- Inserting data into DrinkIngredients table
-- Rum
INSERT INTO DrinkIngredients (DrinkId, Ingredients, Unit, IsLiquid)
VALUES (1, 'Rum', 200, 1),
       (1, 'Water', 50, 1),
       (1, 'Ice', 100, 0);

-- Old Durbar
INSERT INTO DrinkIngredients (DrinkId, Ingredients, Unit, IsLiquid)
VALUES (2, 'Old Durbar', 200, 1),
       (2, 'Water', 50, 1),
       (2, 'Ice', 100, 0);

-- Vodka
INSERT INTO DrinkIngredients (DrinkId, Ingredients, Unit, IsLiquid)
VALUES (3, 'Vodka', 200, 1),
       (3, 'Water', 50, 1),
       (3, 'Ice', 100, 0);

-- Beer
INSERT INTO DrinkIngredients (DrinkId, Ingredients, Unit, IsLiquid)
VALUES (4, 'Beer', 500, 1),
       (4, 'Water', 50, 1),
       (4, 'Ice', 100, 0);

-- Whiskey
INSERT INTO DrinkIngredients (DrinkId, Ingredients, Unit, IsLiquid)
VALUES (5, 'Whiskey', 200, 1),
       (5, 'Water', 50, 1),
       (5, 'Ice', 100, 0);

-- Coca-Cola
INSERT INTO DrinkIngredients (DrinkId, Ingredients, Unit, IsLiquid)
VALUES (6, 'Coca-Cola', 250, 1),
       (6, 'Ice', 100, 0);

-- Fanta
INSERT INTO DrinkIngredients (DrinkId, Ingredients, Unit, IsLiquid)
VALUES (7, 'Fanta', 250, 1),
       (7, 'Ice', 100, 0);

-- Lemonade
INSERT INTO DrinkIngredients (DrinkId, Ingredients, Unit, IsLiquid)
VALUES (8, 'Lemonade', 300, 1),
       (8, 'Ice', 100, 0);

-- Sprite
INSERT INTO DrinkIngredients (DrinkId, Ingredients, Unit, IsLiquid)
VALUES (9, 'Sprite', 250, 1),
       (9, 'Ice', 100, 0);

-- Flavored-Milk
INSERT INTO DrinkIngredients (DrinkId, Ingredients, Unit, IsLiquid)
VALUES (10, 'Flavored-Milk', 200, 1),
       (10, 'Ice', 100, 0);

-- Orange Juice
INSERT INTO DrinkIngredients (DrinkId, Ingredients, Unit, IsLiquid)
VALUES (11, 'Orange Juice', 300, 1),
       (11, 'Ice', 100, 0);

-- Apple Juice
INSERT INTO DrinkIngredients (DrinkId, Ingredients, Unit, IsLiquid)
VALUES (12, 'Apple Juice', 300, 1),
       (12, 'Ice', 100, 0);

-- Grape Juice
INSERT INTO DrinkIngredients (DrinkId, Ingredients, Unit, IsLiquid)
VALUES (13, 'Grape Juice', 300, 1),
       (13, 'Ice', 100, 0);

-- Cranberry Juice
INSERT INTO DrinkIngredients (DrinkId, Ingredients, Unit, IsLiquid)
VALUES (14, 'Cranberry Juice', 300, 1),
       (14, 'Ice', 100, 0);

-- Mango Juice
INSERT INTO DrinkIngredients (DrinkId, Ingredients, Unit, IsLiquid)
VALUES (15, 'Mango Juice', 300, 1),
       (15, 'Ice', 100, 0);

-- Tomato Soup
INSERT INTO DrinkIngredients (DrinkId, Ingredients, Unit, IsLiquid)
VALUES (16, 'Tomato Soup', 300, 1),
       (16, 'Water', 50, 1),
       (16, 'Ice', 100, 0);

-- Chicken Soup
INSERT INTO DrinkIngredients (DrinkId, Ingredients, Unit, IsLiquid)
VALUES (17, 'Chicken Soup', 300, 1),
       (17, 'Water', 50, 1),
       (17, 'Ice', 100, 0);

-- Mushroom Soup
INSERT INTO DrinkIngredients (DrinkId, Ingredients, Unit, IsLiquid)
VALUES (18, 'Mushroom Soup', 300, 1),
       (18, 'Water', 50, 1),
       (18, 'Ice', 100, 0);

-- Vegetable Soup
INSERT INTO DrinkIngredients (DrinkId, Ingredients, Unit, IsLiquid)
VALUES (19, 'Vegetable Soup', 300, 1),
       (19, 'Water', 50, 1),
       (19, 'Ice', 100, 0);


Select * from DrinkIngredients

