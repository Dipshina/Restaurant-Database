-- 1.Create a table "FoodOrder" to Store the ordered foods in the Restaurant.
--    Table : FoodOrder
--    Columns : Id, 
--              FoodId (FK)         
--              Quantity  
--              TableNo
--              OrderDate Default Today's Date
--              NumberOfPersons (can be null) 
Create Table FoodOrder(
ID INT Primary Key Identity(1,1),
FoodId INT Foreign Key References Food(Id),
Quantity Decimal(5,2),
TableNo INT,
OrderDate Date Default GetDate(),
NumberOfPersons INT,
);

Insert into FoodOrder(FoodId, Quantity, TableNo, OrderDate, NumberOfPersons)
VALUES(1, 2, 1, '2021-10-28', 2),
(1, 2, 1, '2022-12-28', 2),
(2, 4, 2, '2021-11-16', 6),
(3, 2, 1, '2022-08-15', 2),
(4, 5, 4, '2022-11-11', 8),
(5, 2, 1, '2023-12-28', 1),
(6, 1, 1, '2023-12-16', 4),
(7, 8, 4, '2023-12-06', 3),
(8, 2, 3, '2023-12-14', 6),
(9, 2, 6, '2023-12-06', 4),
(10, 4, 2, '2023-12-08', 3),
(11, 2, 1, '2023-12-05', 4),
(12, 3, 1, '2023-12-07', 3),
(6, 2, 1, '2022-12-28', 4),
(4, 3, 4, '2022-12-12',5),
(5, 2, 1, '2023-12-12',4),
(4, 6, 6, '2023-10-14', 8),
(5, 3, 2, '2022-02-12', 5),
(6, 6, 6, '2022-08-18',8),
(5, 3, 1, '2023-12-01', 5);

Insert into FoodOrder(FoodId, Quantity, TableNo, OrderDate, NumberOfPersons)
VALUES(13, 2, 1, '2023-12-09', 2),
(14, 4, 3, '2023-12-09',4);

Insert into FoodOrder(FoodId, Quantity, TableNo, NumberOfPersons)
VALUES(1, 2, 1, 4),
(1, 6, 6, 8),
(11, 3, 3, 6),
(14, 6, 12, 12),
(13, 7, 3, 10);
Select * from FoodOrder;


Insert into FoodOrder(FoodId, Quantity, TableNo, OrderDate, NumberOfPersons)
VALUES(13, 2, 1, '2024-12-09', 2),
(14, 4, 3, '2024-12-09',4),
(4, 3, 4, '2024-12-12',5),
(5, 2, 1, '2024-12-12',4);

Insert into FoodOrder(FoodId, Quantity, TableNo, OrderDate, NumberOfPersons)
VALUES(13, 2, 1, '2024-03-15', 2),
(14, 4, 3, '2024-03-15',4);

Insert into FoodOrder(FoodId, Quantity, TableNo, OrderDate, NumberOfPersons)
VALUES(4, 3, 4, '2024-03-14',5),
(5, 2, 1, '2024-03-14',4);

Insert into FoodOrder(FoodId, Quantity, TableNo, OrderDate, NumberOfPersons)
VALUES(13, 3, 4, '2024-03-09',1),
(14, 2, 1, '2024-03-09',2);





