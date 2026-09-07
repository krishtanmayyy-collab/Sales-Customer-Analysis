----------------------- SALES ANLYSIS
---- Monthly Revenue
SELECT
    EXTRACT(MONTH FROM sale_date) AS Month,
    SUM(net_sales) AS Total_Revenue
FROM sales
GROUP BY Month
ORDER BY Month;
---- Monthly Order 
SELECT
    EXTRACT(MONTH FROM sale_date) AS Month,
    count(sale_id) AS Total_Order
FROM sales
GROUP BY Month
ORDER BY Month;
--- Monthly Quantity Sold
SELECT
    EXTRACT(MONTH FROM sale_date) AS Month,
    sum(quantity) AS Quantity_Sold
FROM sales
GROUP BY Month
ORDER BY Month;
--- Best and Wrost Month
----Best Revenue Month
SELECT
    extract(MONTH FROM sale_date) AS Month,
    SUM(net_sales) AS Total_Revenue
FROM sales
group by Month
ORDER BY Total_Revenue DESC
LIMIT 1;
---wrost Revenue Month
SELECT
    EXTRACT(MONTH FROM sale_date) AS Month,
    SUM(net_sales) AS Total_Revenue
FROM sales
GROUP BY Month
ORDER BY Total_Revenue asc
LIMIT 1;
-------- Month-over-Month (MoM) Growth
WITH monthly_sales AS (
    SELECT
        EXTRACT(MONTH FROM sale_date) AS Month,
        SUM(net_sales) AS Total_Revenue
    FROM sales                             ---------------- using CTE
    GROUP BY Month )
SELECT Month, Total_Revenue, LAG(Total_Revenue) OVER ( ORDER BY Month ) AS Previous_Month_Revenue, Total_Revenue -
    LAG(Total_Revenue) OVER (
        ORDER BY Month
    ) AS Revenue_Growth
FROM monthly_sales
ORDER BY Month;
-------- Running Total Revenue
------What is the cumulative revenue from the start of the year up to the current month
with monthly_sales AS (
    SELECT
        EXTRACT(MONTH FROM sale_date) AS Month, SUM(net_sales) AS Total_Revenue
    FROM sales
    GROUP BY Month )                         ------------------ using CTE
SELECT Month, Total_Revenue, SUM(Total_Revenue) OVER ( ORDER BY Month ) AS Running_Total_Revenue
     FROM monthly_sales
ORDER BY Month;
