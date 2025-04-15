WITH RegionProductSales AS (
    SELECT
        Region,
        ProductName,
        SUM(Sales) AS TotalSales
    FROM
        SalesData
    GROUP BY
        Region,
        ProductName
)
SELECT
    Region,
    ProductName,
    TotalSales
FROM (
    SELECT
        Region,
        ProductName,
        TotalSales,
        RANK() OVER (PARTITION BY Region ORDER BY TotalSales DESC) AS rank
    FROM
        RegionProductSales
) AS ranked
WHERE
    rank = 1;


