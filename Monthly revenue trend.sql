SELECT
    EXTRACT(YEAR FROM OrderDate) AS Year,
    EXTRACT(MONTH FROM OrderDate) AS Month,
    SUM(Sales) AS TotalRevenue
FROM
    SalesData
GROUP BY
    EXTRACT(YEAR FROM OrderDate),
    EXTRACT(MONTH FROM OrderDate)
ORDER BY
    Year, Month;
