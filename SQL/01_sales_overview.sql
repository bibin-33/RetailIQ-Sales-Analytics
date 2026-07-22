/*============================================================
Project : RetailIQ
Section : Sales Overview
============================================================*/

SELECT SUM(TotalSales) AS Total_Sales
FROM Sales;

SELECT SUM(TotalSales) / COUNT(DISTINCT Invoice) AS AverageOrderValue
FROM Sales;

SELECT AVG(Price) AS Average_Price
FROM Sales;