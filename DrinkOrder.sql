-- 1. Create a table to store the orders for the drink/stores single row for each customer.
-- Table: Orders
-- Columns: Id
-- DrinkId(FK)
-- Quantity
-- TableNo
-- OrderDate Default Today's Date
-- EmployeeID(FK)
-- NumberOfPersons(can be null)
-- IsPaid (Null before pay. after pay True or False)
-- Create Orders table
CREATE TABLE Orders (
    Id INT PRIMARY KEY IDENTITY(1,1),
    DrinkId INT FOREIGN KEY REFERENCES Drink(Id),
    Quantity DECIMAL(5,2),
    TableNo INT,
    OrderDate DATETIME DEFAULT GETDATE(),
    EmployeeID INT FOREIGN KEY REFERENCES Employee(Id),
    NumberOfPersons INT,
    IsPaid BIT
);

-- Inserting data into the Orders table
INSERT INTO Orders (DrinkId, Quantity, TableNo, OrderDate, EmployeeID, NumberOfPersons, IsPaid)
VALUES 
    (1, 2, 1, '2024-03-25', 1, 2, NULL),
    (4, 1, 3, '2024-03-25', 2, 1, NULL),
    (2, 1, 2, '2024-03-26', 3, 2, NULL);

-- Create OrderDetails table
/* Create a table “DrinkOrders” to store the details of each orders of the drink.
Table: Order Details
Columns: ID
 	      OrderId (FK referencing Orders.Id)
 	      DrinkId(FK)
 	      Quantity
 	      OrderDate Default Today's DateTime
 	      Comments*/

CREATE TABLE OrderDetails (
    ID INT PRIMARY KEY IDENTITY(1,1),
    OrderId INT FOREIGN KEY REFERENCES Orders(Id),
    DrinkId INT FOREIGN KEY REFERENCES Drink(Id),
    Quantity DECIMAL(5,2),
    OrderDate DATETIME DEFAULT GETDATE(),
    Comments VARCHAR(255)
);

-- Inserting data into the OrderDetails table
INSERT INTO OrderDetails (OrderId, DrinkId, Quantity, OrderDate, Comments)
VALUES 
    (1, 1, 2, '2024-03-25 12:30:00', 'Ice'),
    (2, 4, 1, '2024-03-25 13:45:00', NULL),
    (3, 2, 1, '2024-03-26 14:00:00', 'No ice');

