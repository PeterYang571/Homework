Use Northwind
Go
SELECT * FROM Region,Territories,EmployeeTerritories, Employees WITH (HOLDLOCK)
Select * From Region
Select * From Territories
Select * From Employees
Select * From EmployeeTerritories
Select * From Products
Select * From Orders
Select * From [Order Details]

--#1a
INSERT INTO Region values(5, 'Middle Earth')
--#1b
INSERT INTO Territories values(12345,'Gondor', 5)
--#1c
SET IDENTITY_INSERT Employees ON;
INSERT INTO Employees(EmployeeID, LastName, FirstName)
values(10,'Aragorn','King')
INSERT INTO EmployeeTerritories values(10, '12345')

--#2
Update Territories
Set TerritoryDescription = 'Arnor'
Where TerritoryID = 12345

--#3
Delete From Territories Where TerritoryID = 12345 AND TerritoryDescription = 'Arnor' AND RegionID = 5
Delete From Region Where RegionDescription= 'Middle Earth' AND RegionID = 5
SELECT * FROM Region,Territories,EmployeeTerritories, Employees WITH (NOLOCK)

--#4
Create View view_product_order_Yang AS
Select p.ProductName, Count(od.Quantity) AS TotalQuantity
From Products p inner join [Order Details] od
on p.ProductID = od.ProductID
Group By p.ProductName 

Select* from view_product_order_Yang

--#5
Create Procedure view_product_order_quantity_Yang
	@ProductId int,
	@Totalquantity int
AS
	SET NOCOUNT ON;
	Select od.ProductID,Count(od.Quantity) Totalquantity
	From [Order Details] od
	Where od.ProductID = @ProductId
	Group By ProductID
	Having COUNT(od.quantity) = @Totalquantity

GO

Drop procedure view_product_order_quantity_Yang

--#6
ALTER PROC sp_Product_Order_City_Yang
@ProductName NVARCHAR(50)
AS
BEGIN
SELECT TOP 5 ShipCity,SUM(Quantity) FROM [Order Details] OD JOIN Products P ON P.ProductID = OD.ProductID JOIN Orders O ON O.OrderID = OD.OrderID
WHERE ProductName=@ProductName
GROUP BY ProductName,ShipCity
ORDER BY SUM(Quantity) DESC
END


EXEC sp_Product_Order_City_Yang 'Queso Cabrales'

--#7
BEGIN TRAN
select * from Region
select * from Territories
select * from Employees
select * from EmployeeTerritories
GO
ALTER PROC sp_move_employees_Yang
AS
BEGIN

IF EXISTS(SELECT EmployeeID FROM EmployeeTerritories WHERE TerritoryID = (SELECT TerritoryID FROM Territories WHERE TerritoryDescription ='Troy'))
BEGIN
DECLARE @TerritotyID INT
SELECT @TerritotyID = MAX(TerritoryID) FROM Territories
BEGIN TRAN
INSERT INTO Territories VALUES(@TerritotyID+1 ,'Stevens Point',3)
UPDATE EmployeeTerritories
SET TerritoryID = @TerritotyID+1
WHERE EmployeeID IN (SELECT EmployeeID FROM EmployeeTerritories WHERE TerritoryID = (SELECT TerritoryID FROM Territories WHERE TerritoryDescription ='Troy'))
IF @@ERROR <> 0
BEGIN
ROLLBACK
END
ELSE
COMMIT
END

END

EXEC sp_move_employees_Yang


--#8
CREATE TRIGGER tr_move_emp_Yang
ON EmployeeTerritories
AFTER INSERT
AS
DECLARE @EmpCount INT
SELECT @EmpCount = COUNT(*) FROM EmployeeTerritories WHERE TerritoryID = (SELECT TerritoryID FROM Territories WHERE TerritoryDescription = 'Stevens Point' AND RegionID=3) GROUP BY EmployeeID
IF (@EmpCount>100)
BEGIN
UPDATE EmployeeTerritories
SET TerritoryID = (SELECT TerritoryID FROM Territories WHERE TerritoryDescription ='Troy')
WHERE EmployeeID IN (SELECT EmployeeID FROM EmployeeTerritories WHERE TerritoryID = (SELECT TerritoryID FROM Territories WHERE TerritoryDescription ='Stevens Point' AND RegionID=3))
END

DROP TRIGGER tr_move_emp_Yang

COMMIT

--#9
CREATE TABLE People_Yang
(
id int ,
name nvarchar(100),
city int
)

create table City_Yang
(
id int,
city nvarchar(100)
)
BEGIN TRAN 
insert into City_Yang values(1,'Seattle')
insert into City_Yang values(2,'Green Bay')

insert into People_Yang values(1,'Aaron Rodgers',1)
insert into People_Yang values(2,'Russell Wilson',2)
insert into People_Yang values(3,'Jody Nelson',2)

if exists(select id from People_Yang where city = (select id from City_Yang where city = 'Seatle'))
begin
insert into City_Yang values(3,'Madison')
update People_Yang
set city = 'Madison'
where id in (select id from People_Yang where city = (select id from City_Yang where city = 'Seatle'))
end
delete from City_Yang where city = 'Seattle'

CREATE VIEW Packers_Yang
AS
SELECT name FROM People_Yang WHERE city = 'Green Bay'

select * from Packers_Yang
commit
drop table People_Yang
drop table City_Yang
drop view Packers_Yang

--#10

ALTER PROC sp_birthday_employee_Yang
AS
BEGIN
SELECT * INTO #EmployeeTemp
FROM Employees WHERE DATEPART(MM,BirthDate) = 02
SELECT * FROM #EmployeeTemp
END

--#11

CREATE PROC sp_Yang_1
AS
BEGIN
SELECT City FROM CUSTOMERS
GROUP BY City
HAVING COUNT(*)>2
INTERSECT
SELECT City FROM Customers C JOIN Orders O ON O.CustomerID=C.CustomerID JOIN [Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY OD.ProductID,C.CustomerID,City
HAVING COUNT(*) BETWEEN 0 AND 1
END
GO
EXEC sp_Yang_1
GO
CREATE PROC sp_Yang_2
AS
BEGIN
SELECT City FROM CUSTOMERS
WHERE CITY IN (SELECT City FROM Customers C JOIN Orders O ON O.CustomerID=C.CustomerID JOIN [Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY OD.ProductID,C.CustomerID,City
HAVING COUNT(*) BETWEEN 0 AND 1)
GROUP BY City
HAVING COUNT(*)>2
END
GO
EXEC sp_Yang_2
GO

--#12 USE EXCEPT KEYWORD

SELECT * FROM Customers
EXCEPT
SELECT * FROM Customers

--#14
SELECT firstName+' '+lastName from Person where middleName is null UNION SELECT firstName+' '+lastName+' '+middelName+'.' from Person where middleName is not null

--#15
select top 1 marks from student where sex = 'F' order by marks desc

--#16
select * from students order by sex,marks