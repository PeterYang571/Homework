Use AdventureWorks2019
Go
--#1
--Select ProductID, Name, Color, ListPrice 
--From Production.Product

--#2
--Select ProductID, Name, Color, ListPrice
--From Production.Product
--Where ListPrice = 0

--#3
--Select ProductID, Name, Color, ListPrice
--From Production.Product
--Where Color IS NULL

--#4
--Select ProductID, Name, Color, ListPrice
--From Production.Product
--Where Color IS NOT NULL

--#5
--Select ProductID, Name, Color, ListPrice
--From Production.Product
--Where Color IS NOT NULL AND ListPrice > 0

--#6
--Select Name, Color 
--From Production.Product
--Where Color IS NOT NULL

--#7
--SELECT 'NAME: ' + [Name] + '  --  COLOR: ' + Color AS [Name And Color] 
--FROM Production.Product
--WHERE Color IS NOT NULL

--#8
--Select ProductID, Name 
--From Production.Product
--Where ProductID BETWEEN 400 AND 500

--#9
--Select ProductID, Name, Color
--From Production.Product
--Where Color = 'black' OR Color = 'blue'

--#10
--Select Name
--From Production.Product
--Where Name LIKE 'S%'

--#11
--Select Name, ListPrice
--From Production.Product
--Where Name LIKE 'S%'
--Order BY Name

--#12
--Select Name, ListPrice
--From Production.Product
--Where Name LIKE 'A%' OR Name LIKE 'S%'
--Order BY Name

--#13
--Select Name
--From Production.Product
--Where Name Like 'SPO[^k]%' 
--Order BY Name

--#14
--Select DISTINCT Color
--From Production.Product
--Order by Color DESC

--#15
--Select DISTINCT ProductSubcategoryID, Color
--From Production.Product
--Where ProductSubcategoryID IS NOT NULL and Color IS NOT NULL

--#16
--SELECT ProductSubCategoryID
--      , LEFT([Name],35) AS [Name]
--      , Color, ListPrice 
--FROM Production.Product
--WHERE Color IN ('Red','Black') 
--      AND ProductSubCategoryID = 1 
--      OR ListPrice BETWEEN 1000 AND 2000
--ORDER BY ProductID

--#17
--SELECT ProductSubCategoryID
--      , LEFT([Name],35) AS [Name]
--      , Color, ListPrice 
--FROM Production.Product
--WHERE Color IN ('Red','Black') 
--      AND ProductSubCategoryID = 1 
--      OR ListPrice BETWEEN 1000 AND 2000
--ORDER BY ProductID

--Confused with Q16 and Q17, think they should be a signle question together, because the result set run with Q16 are the same as the required result set in Q17