SELECT
    CustomerID,
    COUNT(DISTINCT OrderID) AS OrderCount
FROM
    SalesData
GROUP BY
    CustomerID
HAVING
    COUNT(DISTINCT OrderID) > 1;


