/*============================================================
Project : RetailIQ
Section : Product Analysis
============================================================*/


/*
Question:
Which products generated the highest revenue?
*/
SELECT TOP 10 Description, SUM(TotalSales) AS Revenue
FROM Sales
GROUP BY Description
ORDER BY Revenue DESC;

/*
Question:
Which products sold the highest quantity?
*/
SELECT TOP 10 Description, SUM(Quantity) AS QuantitySold
FROM Sales
GROUP BY Description
ORDER BY QuantitySold DESC;

/*
Question:
Which products appear in the highest number of orders?
*/
SELECT TOP 10 Description,COUNT(DISTINCT Invoice) AS Orders
FROM Sales
GROUP BY Description
ORDER BY Orders DESC;

/*
Question:
What percentage of total revenue does each product contribute?
*/
WITH ProductRevenue AS
(
	SELECT Description,SUM(TotalSales) AS Revenue
	FROM Sales
	GROUP BY Description
)
SELECT Description,Revenue,
	   ROUND(Revenue * 100/SUM(Revenue) OVER(),2)	AS RevenuePercentage
FROM ProductRevenue
ORDER BY Revenue DESC;

/*
Question:
Rank products by revenue.
*/
SELECT Description,SUM(TotalSales) AS Revenue,
	   RANK() OVER(ORDER BY SUM(TotalSales) DESC) AS RevenueRank
FROM Sales
GROUP BY Description;

/*
Question:
Which products generated more than £10,000 in revenue?
*/
SELECT Description,SUM(TotalSales) AS Revenue
FROM Sales
GROUP BY Description
HAVING SUM(TotalSales)>10000
ORDER BY Revenue DESC;