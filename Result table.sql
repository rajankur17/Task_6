WITH RevenueVolume AS (
    SELECT
        EXTRACT(YEAR FROM OrderDate) AS Year,
        EXTRACT(MONTH FROM OrderDate) AS Month,
        Region,
        Category,
        SubCategory,
        SUM(Sales) AS TotalRevenue,
        COUNT(DISTINCT OrderID) AS Volume
    FROM
        SalesData
    GROUP BY
        EXTRACT(YEAR FROM OrderDate),
        EXTRACT(MONTH FROM OrderDate),
        Region,
        Category,
        SubCategory
),
TopProducts AS (
    SELECT
        ProductName,
        SUM(Sales) AS TotalRevenue
    FROM
        SalesData
    GROUP BY
        ProductName
    ORDER BY
        TotalRevenue DESC
    LIMIT 5
),
TopCustomers AS (
    SELECT
        CustomerName,
        SUM(Sales) AS TotalSpend
    FROM
        SalesData
    GROUP BY
        CustomerName
    ORDER BY
        TotalSpend DESC
    LIMIT 5
),
YearlySummary AS (
    SELECT
        EXTRACT(YEAR FROM OrderDate) AS Year,
        SUM(Sales) AS TotalRevenue,
        COUNT(DISTINCT OrderID) AS Volume,
        COUNT(DISTINCT CustomerID) AS CustomerCount
    FROM
        SalesData
    GROUP BY
        EXTRACT(YEAR FROM OrderDate)
)
SELECT
    -- Yearly Summary
    Y.Year AS Year,
    Y.TotalRevenue AS YearlyRevenue,
    Y.Volume AS YearlyVolume,
    Y.CustomerCount AS YearlyCustomerCount,

    -- Monthly Summary
    RV.Month AS Month,
    RV.Region AS Region,
    RV.Category AS Category,
    RV.SubCategory AS SubCategory,
    RV.TotalRevenue AS MonthlyRevenue,
    RV.Volume AS MonthlyVolume,

    -- Top Products and Customers
    (SELECT ProductName FROM TopProducts LIMIT 1) AS TopProduct,
    (SELECT TotalRevenue FROM TopProducts LIMIT 1) AS TopProductRevenue,
    (SELECT ProductName FROM TopProducts OFFSET 1 LIMIT 1) AS SecondTopProduct,
    (SELECT TotalRevenue FROM TopProducts OFFSET 1 LIMIT 1) AS SecondTopProductRevenue,
    
    (SELECT CustomerName FROM TopCustomers LIMIT 1) AS TopCustomer,
    (SELECT TotalSpend FROM TopCustomers LIMIT 1) AS TopCustomerSpend,
    (SELECT CustomerName FROM TopCustomers OFFSET 1 LIMIT 1) AS SecondTopCustomer,
    (SELECT TotalSpend FROM TopCustomers OFFSET 1 LIMIT 1) AS SecondTopCustomerSpend

FROM
    YearlySummary Y
JOIN
    RevenueVolume RV ON Y.Year = RV.Year
ORDER BY
    Y.Year DESC, RV.Month ASC;
