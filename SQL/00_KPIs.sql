/*============================================================
Project : RetailIQ
Section : KPIs
============================================================*/


SELECT COUNT(*) AS TotalRows
FROM Sales;

SELECT SUM(TotalSales) AS TotalRevenue
FROM Sales;

SELECT COUNT(DISTINCT Invoice) AS TotalOrders
FROM Sales;

SELECT COUNT(DISTINCT Customer_ID) AS TotalCustomers
FROM Sales;

SELECT SUM(Quantity) AS TotalProductsSold
FROM Sales;