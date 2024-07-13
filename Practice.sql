--Variable declaration for single value
/*Declare @a int
Set @a = 5
print @a
print @a+10
print @a*/

/*-- Euta matra value output ma dinu parxa nabhaye error aauxa
Set @a = (Select top 1 Id from Food where name like '%Momo%')
Select @a*/


/*NOTE:
1. Table variable memory ma or server ma load hunxa
2. jati data chahinxa teti matra rakhnu parxa nabhaye aru processharu lai asar garxa
3. As it holds data temporarily, it runs olny once and we cannot access data next time*/

-- Table Variable
Declare @food table(
ID int Primary Key Identity(1,1),
Name Varchar(100),
Price Decimal(10,2)
)

Insert into @food(Name, Price)
values('Momo', '200.00'),
('Pizza', '499.99');

Select * from @food;

Insert into @food(Name, Price)
Select Name, Price
from Food
where Price>200

Select *from @food

-- @table_name  ==  local table variable
-- @@table_name  == global table variable



-- Temporary Table
-- tempdb ma store hunxa tesaile value haru dherai store garna milxa 
Create table #food(
ID int Primary Key Identity(1,1),
Name Varchar(100),
Price Decimal(10,2)
)

Insert into #food(Name, Price)
Select Name, Price
from Food
where Name Like '%Pizza%'

select * from #food  

