SELECT
    ProductName,
    SUM(Sales) AS TotalRevenue
FROM
    SalesData
GROUP BY
    ProductName
ORDER BY
    TotalRevenue DESC
LIMIT 5;
