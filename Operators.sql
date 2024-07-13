-- A. Create examples of each of the operators in SQL
---------------------------------------------------------------------
---------------------------------------------------------------------

-- 1) Comparison
---------------------------------------------------------------------
---------------------------------------------------------------------
-- a. Equal to (=)
SELECT * FROM Food WHERE Price = 200;

-- b. Greater than (>)
SELECT * FROM Food WHERE Price > 200;

-- c. Less than (<)
SELECT * FROM Food WHERE Price < 500;

-- d. Greater than or equal to (>=)
SELECT * FROM Food WHERE Price >= 200;

-- e. Less than or equal to (<=)
SELECT * FROM Food WHERE Price <= 500;

-- f. Not Equal to (<>)
SELECT * FROM Food WHERE Price <> 200;
---------------------------------------------------------------------

-- 2)  Logical
---------------------------------------------------------------------
---------------------------------------------------------------------
-- a. AND
SELECT * FROM Food WHERE CategoryID = 1 AND Price < 300;

-- b. OR
SELECT * FROM Food WHERE CategoryID = 2 OR CategoryID = 3;

-- c. BETWEEN
SELECT * FROM Food WHERE Price BETWEEN 200 AND 400;

-- d. EXISTS
-- Select all foods that have been ordered at least once
SELECT * 
FROM Food 
WHERE EXISTS (
    SELECT 1
    FROM FoodOrder 
    WHERE FoodOrder.FoodId = Food.Id
);


-- e. IN
SELECT * FROM Food f
Inner Join FoodCategory fc
On f.CategoryID = fc.Id
WHERE Category IN ('Snack', 'Dessert');

-- f. LIKE
SELECT * FROM Food WHERE Name LIKE 'Veg%';

-- g. NOT
SELECT * FROM Food f
Inner Join FoodCategory fc
On f.CategoryID = fc.Id
Where NOT Category = 'Snack';
---------------------------------------------------------------------

-- 3. Arithmetic 
---------------------------------------------------------------------
---------------------------------------------------------------------
-- a. Addition (+)
SELECT Name, Price, Price + 10 AS NewPrice
FROM Food;

-- b. Subtraction (-)
SELECT Name, Price, Price - 5 AS NewPrice
FROM Food;

-- c. Multiplication (*)
SELECT Name, Price, Price * 2 AS DoublePrice
FROM Food;

-- d. Division (/)
SELECT Name, Price, Price / 2 AS HalfPrice
FROM Food;

-- e. Modulus (%)
SELECT Name, Price, Price % 3 AS Remainder
FROM Food;
---------------------------------------------------------------------

-- 4. Compound
---------------------------------------------------------------------
---------------------------------------------------------------------
-- a. +=
UPDATE Food
SET Price += 10
WHERE CategoryID = 1;

-- b. -=
UPDATE Food
SET Price -= 5
WHERE CategoryID = 2;

-- c. *=
UPDATE Food
SET Price *= 2
WHERE CategoryID = 3;

-- d. /=
UPDATE Food
SET Price /= 2
WHERE CategoryID = 4;

-- e. %=
UPDATE Food
SET Price %= 3
WHERE CategoryID = 2;


