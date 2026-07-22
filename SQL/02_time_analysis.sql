/*============================================================
Project : RetailIQ
Section : Time Analysis
============================================================*/

/*
Question: Which months generated the highest revenue?
*/
SELECT YEAR,monthname,SUM(totalsales) AS revenue
FROM Sales
GROUP BY year,Month,MonthName
ORDER BY revenue DESC;

/*
Question: Which months had the highest number of orders?
*/
SELECT Year,MonthName,COUNT(DISTINCT Invoice) AS Orders
FROM sales
GROUP BY Year,MonthName
ORDER BY Orders DESC;

/*
Question: Which day of the week generates the highest revenue?
*/
SELECT Weekday,SUM(TotalSales) AS Revenue
FROM Sales
GROUP BY weekday
ORDER BY Revenue DESC;

/*
Question: During which hours are sales highest?
*/
SELECT Hour,SUM(TotalSales) AS Revenue
FROM Sales
GROUP BY Hour
ORDER BY Hour;

/*
Question: Which quarter contributes the most revenue?
*/
SELECT Quarter,SUM(TotalSales) AS Revenue
FROM Sales
GROUP BY Quarter
ORDER BY Quarter;

/*
Question: Do weekdays or weekends generate more sales?
*/
SELECT IsWeekend,SUM(TotalSales) AS Revenue
FROM Sales
GROUP BY IsWeekend;

