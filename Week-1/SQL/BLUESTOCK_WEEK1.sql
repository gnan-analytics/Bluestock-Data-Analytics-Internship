CREATE DATABASE BlueStockDB;
GO

USE BlueStockDB;
GO

CREATE TABLE Superstore (
    ShipMode VARCHAR(50),
    Segment VARCHAR(50),
    Country VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(100),
    PostalCode INT,
    Region VARCHAR(50),
    Category VARCHAR(50),
    SubCategory VARCHAR(100),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2)
);

SELECT COUNT(*) AS RowsInSampleSuperstore
FROM dbo.SampleSuperstore;

SELECT TOP 10 *
FROM dbo.SampleSuperstore;

SELECT *
FROM dbo.SampleSuperstore;

SELECT Sales, Profit
FROM dbo.SampleSuperstore;

SELECT Category, Sales
FROM dbo.SampleSuperstore;

SELECT *
FROM dbo.SampleSuperstore
WHERE Sales > 500;

SELECT *
FROM dbo.SampleSuperstore
WHERE Region = 'West';

SELECT *
FROM dbo.SampleSuperstore
WHERE Category = 'Technology';

SELECT *
FROM dbo.SampleSuperstore
WHERE Profit > 100;


SELECT *
FROM dbo.SampleSuperstore
ORDER BY Sales DESC;

SELECT TOP 10 *
FROM dbo.SampleSuperstore
ORDER BY Sales DESC;


SELECT SUM(Sales) AS TotalSales
FROM dbo.SampleSuperstore;

SELECT SUM(Profit) AS TotalProfit
FROM dbo.SampleSuperstore;

SELECT COUNT(*) AS TotalOrders
FROM dbo.SampleSuperstore;

SELECT AVG(Sales) AS AverageSales
FROM dbo.SampleSuperstore;

SELECT MAX(Sales) AS HighestSale
FROM dbo.SampleSuperstore;

SELECT MIN(Sales) AS LowestSale
FROM dbo.SampleSuperstore;

SELECT Region,
       SUM(Sales) AS TotalSales
FROM dbo.SampleSuperstore
GROUP BY Region;

SELECT Category,
       SUM(Profit) AS TotalProfit
FROM dbo.SampleSuperstore
GROUP BY Category;

SELECT Segment,
       SUM(Sales) AS TotalSales
FROM dbo.SampleSuperstore
GROUP BY Segment;

SELECT Region,
       AVG(Discount) AS AverageDiscount
FROM dbo.SampleSuperstore
GROUP BY Region;

SELECT Region,
       SUM(Sales) AS TotalSales
FROM dbo.SampleSuperstore
GROUP BY Region
ORDER BY TotalSales DESC;

SELECT Category,
       SUM(Profit) AS TotalProfit
FROM dbo.SampleSuperstore
GROUP BY Category
ORDER BY TotalProfit DESC;

SELECT Region,
       SUM(Sales) AS TotalSales
FROM dbo.SampleSuperstore
GROUP BY Region
HAVING SUM(Sales) > 500000;


SELECT Category,
       SUM(Profit) AS TotalProfit
FROM dbo.SampleSuperstore
GROUP BY Category
HAVING SUM(Profit) > 50000;

SELECT *
FROM dbo.SampleSuperstore
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM dbo.SampleSuperstore
);

SELECT *
FROM dbo.SampleSuperstore
WHERE Profit =
(
    SELECT MAX(Profit)
    FROM dbo.SampleSuperstore
);

SELECT State,
       SUM(Sales) AS TotalSales
FROM dbo.SampleSuperstore
GROUP BY State
HAVING SUM(Sales) >
(
    SELECT AVG(Sales)
    FROM dbo.SampleSuperstore
);

SELECT
    State,
    SUM(Sales) AS TotalSales,
    RANK() OVER (ORDER BY SUM(Sales) DESC) AS SalesRank
FROM dbo.SampleSuperstore
GROUP BY State;

SELECT
    State,
    Sales,
    ROW_NUMBER() OVER (ORDER BY Sales DESC) AS RowNum
FROM dbo.SampleSuperstore;

SELECT
    Category,
    SUM(Profit) AS TotalProfit,
    DENSE_RANK() OVER (ORDER BY SUM(Profit) DESC) AS ProfitRank
FROM dbo.SampleSuperstore
GROUP BY Category;