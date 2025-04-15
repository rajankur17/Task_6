SELECT
    Category,
    SUM(Sales) AS TotalRevenue
FROM
    SalesData
GROUP BY
    Category
ORDER BY
    TotalRevenue DESC;
