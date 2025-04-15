SELECT
    Region,
    SUM(Sales) AS TotalRevenue,
    COUNT(DISTINCT OrderID) AS Volume
FROM
    SalesData
GROUP BY
    Region
ORDER BY
    TotalRevenue DESC;
