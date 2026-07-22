/*============================================================
Project : RetailIQ
Section : Advanced SQL
============================================================*/

/*
Question: What are the top-selling products within each country?
*/
With ProductRevenue AS
(
	SELECT Country,Description,SUM(TotalSales) AS Revenue,
	ROW_NUMBER() OVER(PARTITION BY country ORDER BY SUM(TotalSales) DESC) AS ProductRank
	FROM Sales
	GROUP BY Country, Description

)
SELECT *
FROM ProductRevenue
WHERE ProductRank<=5;

/*
Question: How does cumulative revenue grow over time?
*/
WITH MonthlySales AS
(
	SELECT Year,Month,SUM(TotalSales) AS Revenue
	FROM Sales
	GROUP by Year,Month
)

SELECT *,
SUM(Revenue) OVER(ORDER BY year,month) AS RunningRevenue
FROM MonthlySales;

/*
Question: How does each month's revenue compare to the previous month?
*/
WITH MonthyRevenue AS
(
	SELECT Year,Month,SUM(TotalSales) AS revenue
	FROM Sales
	GROUP BY Year,Month
)

SELECT *,
LAG(revenue) OVER(ORDER BY year,month) AS PreviousMonthRevenue
FROM MonthyRevenue;

 