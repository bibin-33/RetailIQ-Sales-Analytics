SELECT MonthName,SUM(TotalSales) AS Revenue
FROM Sales
GROUP BY MonthName
ORDER BY SUM(TotalSales) DESC;