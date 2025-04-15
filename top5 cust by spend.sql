SELECT
    CustomerName,
    SUM(Sales) AS TotalSpend
FROM
    SalesData
GROUP BY
    CustomerName
ORDER BY
    TotalSpend DESC
LIMIT 5;
