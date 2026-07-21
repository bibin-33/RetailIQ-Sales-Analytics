/*============================================================
Project : RetailIQ
Section : Product Analysis
============================================================*/


/*
Question:
Who are the Top 10 Customer by Revenue?
*/
SELECT TOP 10
Customer_ID,SUM(TotalSales) AS Revenue
FROM Sales
WHERE Customer_ID IS NOT NULL
GROUP BY Customer_ID
ORDER BY Revenue DESC;

/*
Question:
Which customers placed the most orders?
*/
SELECT Customer_ID,COUNT(DISTINCT(Invoice)) AS Orders
FROM Sales
WHERE Customer_ID IS NOT NULL
GROUP BY Customer_ID
ORDER BY Orders DESC;

/*
Question:
Which customers purchased the highest quantity of products?
*/
SELECT Customer_ID, SUM(Quantity) AS QuantityPurchaced
FROM Sales
WHERE Customer_ID IS NOT NULL
GROUP BY Customer_ID
ORDER BY QuantityPurchaced DESC;

/*
Question:
What is the average spending per customer?
*/
SELECT AVG(Revenue) AS AverageCustomerRevenue
FROM
(
SELECT Customer_ID, SUM(TotalSales) AS Revenue
FROM Sales
GROUP BY Customer_ID) AS CustomerRevenue

/*
Question:
Rank customers by revenue
*/
SELECT Customer_ID, SUM(TotalSales) AS Revenue,
RANK() OVER(ORDER BY SUM(TotalSales) DESC) AS RankRevenue
FROM Sales
WHERE Customer_ID IS NOT NULL
GROUP BY Customer_ID
ORDER BY Revenue DESC;

/*
Question:
Which customers generated more than £10,000 in revenue?
*/
SELECT Customer_ID,SUM(TotalSales) AS Revenue
FROM Sales
WHERE Customer_ID IS NOT NULL 
GROUP BY Customer_ID
HAVING SUM(TotalSales) > 10000
ORDER BY Revenue DESC;

/*
Question:
What percentage of total revenue comes from each customer?
*/
WITH CustomerRevenue AS
(
	SELECT Customer_ID,SUM(TotalSales) AS Revenue
	FROM Sales
	GROUP BY Customer_ID
)
SELECT Customer_ID,Revenue,
ROUND(Revenue *100/SUM(Revenue) OVER(),2) AS RevenuePercentage
FROM CustomerRevenue
WHERE Customer_ID IS NOT NULL 
ORDER BY Revenue DESC;

/*
Question:
Customer Segmentation using CASE
*/
SELECT Customer_ID,SUM(TotalSales) AS Revenue,
CASE
	WHEN SUM(TotalSales) >=10000 THEN 'PLATINUM'
	WHEN SUM(TotalSales) >=5000 THEN 'GOLD'
	WHEN SUM(TotalSales) >=1000 THEN 'SILVER'
	ELSE 'BRONZE'
	END AS CustomerSegment
FROM Sales
WHERE Customer_ID IS NOT NULL
GROUP BY Customer_ID
ORDER BY Revenue DESC;