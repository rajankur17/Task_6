SELECT
    EXTRACT(YEAR FROM OrderDate) AS Year,
    SubCategory,
    SUM(Sales) AS TotalRevenue
FROM
    SalesData
GROUP BY
    EXTRACT(YEAR FROM OrderDate),
    SubCategory
ORDER BY
    Year, TotalRevenue DESC;

