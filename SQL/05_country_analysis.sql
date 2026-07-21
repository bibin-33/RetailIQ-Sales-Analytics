/*============================================================
Project : RetailIQ
Section : Product Analysis
============================================================*/

/*
Question:
Which Top 10 countries generated the highest revenue?
*/
SELECT TOP 10
Country,SUM(TotalSales) AS Revenue
FROM Sales
GROUP BY Country
ORDER BY Revenue DESC;

/*
Question:
Which countries placed the most orders?
*/
SELECT Country,COUNT(DISTINCT(Invoice)) AS Orders
FROM Sales
GROUP BY Country
ORDER BY Orders DESC;	

/*
Question:
Which countries sold the highest quantity of products?
*/
SELECT Country,SUM(Quantity) AS TotalQuantity
FROM Sales
GROUP BY Country
ORDER BY TotalQuantity DESC;

/*
Question:
Average revenue per order by country
*/

SELECT Country, SUM(TotalSales) / COUNT(DISTINCT(Invoice)) AS AverageOrderValue
FROM Sales
GROUP BY Country
ORDER BY AverageOrderValue DESC;

/*
Question:
Rank countries by revenue
*/
SELECT Country, SUM(TotalSales) AS Revenue,
RANK() OVER(ORDER BY SUM(TotalSales) DESC) AS RevenueRank
FROM Sales
GROUP BY Country
ORDER BY Revenue DESC;

/*
Question:
Revenue contribution by country
*/
WITH CountryRevenue AS
(
	SELECT Country,SUM(TotalSales) AS Revenue
	FROM Sales
	GROUP BY Country
) 
SELECT Country,Revenue,
	   ROUND(Revenue *100/ SUM(Revenue) OVER(),2) AS RevenuePercentage
FROM CountryRevenue
ORDER BY Revenue DESC;