SELECT
    EXTRACT(YEAR FROM OrderDate) AS Year,
    EXTRACT(MONTH FROM OrderDate) AS Month,
    SUM(Sales) AS TotalRevenue,
    COUNT(DISTINCT OrderID) AS Volume
FROM
    SalesData
WHERE
    OrderDate BETWEEN '2022-01-01' AND '2023-12-31'  
GROUP BY
    EXTRACT(YEAR FROM OrderDate),
    EXTRACT(MONTH FROM OrderDate)
ORDER BY
    Year ASC,
    Month ASC
LIMIT 24; 
