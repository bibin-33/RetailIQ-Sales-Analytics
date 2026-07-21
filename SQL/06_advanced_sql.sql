SELECT TOP 10 Description, SUM(TotalSales) AS Revenue
FROM Sales
GROUP BY Description
ORDER BY Revenue DESC;