-- 1.Create a table "Drink" to Store the drinks available in the Restaurant.
--    Table : Drink
--    Columns : Id, 
--              Name (Unique)
--              CategoryID(Int FK referencing DrinkCategory.Id) 
--              Price(check > 0)
--              IsAlcoholic(bit default 1)
CREATE TABLE Drink (
    Id INT PRIMARY KEY IDENTITY(1, 1),
    Name VARCHAR(100) UNIQUE NOT NULL,
    CategoryID INT FOREIGN KEY REFERENCES DrinkCategory(Id),
    Price DECIMAL(10, 2) CHECK (Price > 0) NOT NULL,
    IsAlcoholic BIT DEFAULT 1,
);


-- 2. Inserting data into Drink Table
INSERT INTO Drink (Name, CategoryID, Price, IsAlcoholic) 
VALUES('Rum', 1, 300, 1),
('Old Durbar', 1, 1000, 1),
('Vodka', 1, 1100, 1),
('Beer', 1, 600, 1),
('Whiskey', 1, 1300, 1),
('Coca-Cola', 2, 100, 0),
('Fanta', 2, 100, 0),
('Lemonade', 2, 110, 0),
('Sprite', 2, 100, 0),
('Flavored-Milk', 2, 150, 0),
('Orange Juice', 3, 120, 0),
('Apple Juice', 3, 130, 0),
('Grape Juice', 3, 120, 0),
('Cranberry Juice', 3, 125, 0),
('Mango Juice', 3, 125, 0),
('Tomato Soup', 4, 200, 0),
('Chicken Soup', 4, 250, 0),
('Mushroom Soup', 4, 220, 0),
('Vegetable Soup', 4, 230, 0);

Select * from Drink

