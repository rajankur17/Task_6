SELECT
    EXTRACT(YEAR FROM OrderDate) AS Year,
    SUM(Sales) AS TotalRevenue,
    COUNT(DISTINCT OrderID) AS Volume
FROM
    SalesData
GROUP BY
    EXTRACT(YEAR FROM OrderDate)
ORDER BY
    Year;
