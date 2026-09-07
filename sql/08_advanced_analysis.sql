------------ Sales Performance Classification
--- Classify each sales into Low Medium or High categories based on their net sales amount
SELECT sale_id, net_sales,
    CASE 
        WHEN net_sales < 50000 THEN 'Low'
        WHEN net_sales <= 100000 THEN 'Medium'            ------ using case when 
        ELSE 'High'
    END AS Sales_Performance
FROM sales;
---- Performance-wise Analysis
select
    CASE 
        WHEN net_sales < 50000 THEN 'Low'
        WHEN net_sales <= 100000 THEN 'Medium'
        ELSE 'High'
    END AS Sales_Performance,
    COUNT(sale_id) AS Total_Orders, SUM(net_sales) AS Total_Revenue
    FROM sales
GROUP BY
    CASE                   ---------------- using case when
        WHEN net_sales < 50000 THEN 'Low'
        WHEN net_sales <= 100000 THEN 'Medium'
        ELSE 'High'
    END
ORDER BY Total_Revenue DESC;
------------  Top Performing Employees
--- First calculate the employee-wise revenue and then extract the top 5 employees from that result.
WITH employee_sales AS (
    SELECT E.employee_id, E.employee_name,
        SUM(S.net_sales) AS Total_Revenue
    FROM employees E                       ---------- using CTE 
    JOIN sales S ON E.employee_id = S.employee_id
    GROUP BY E.employee_id, E.employee_name )
SELECT employee_id, employee_name, Total_Revenue
     FROM employee_sales
ORDER BY Total_Revenue DESC
LIMIT 5;
------- RANK vs DENSE_RANK vs ROW_NUMBER
-- using WINDOW Function 
SELECT E.employee_name, SUM(S.net_sales) AS Total_Revenue,
    RANK() OVER (
        ORDER BY SUM(S.net_sales) DESC
    ) AS Revenue_Rank,
    DENSE_RANK() OVER (
        ORDER BY SUM(S.net_sales) DESC
    ) AS Revenue_Dense_Rank,
    ROW_NUMBER() OVER (
        ORDER BY SUM(S.net_sales) DESC
    ) AS Revenue_Row_Number
FROM employees E
JOIN sales S ON E.employee_id = S.employee_id
GROUP BY E.employee_id, E.employee_name
ORDER BY Total_Revenue DESC;
------- Top 3 Employees Using Ranking
--- Identify the top 3 employees based on revenue 
WITH employee_ranking AS (
    SELECT E.employee_id, E.employee_name, SUM(S.net_sales) AS Total_Revenue,   - ---- using CTE
        RANK() OVER (                                     
            ORDER BY SUM(S.net_sales) DESC ) AS Revenue_Rank
    FROM employees E
    JOIN sales S ON E.employee_id = S.employee_id
    GROUP BY E.employee_id, E.employee_name )
SELECT employee_id, employee_name, Total_Revenue, Revenue_Rank
      FROM employee_ranking
WHERE Revenue_Rank <= 3
ORDER BY Revenue_Rank;
------- Top Product in Each Category
--- Which product generates the highest revenue in each product category
WITH product_ranking AS (
    SELECT P.product_id, P.product_name, P.category, SUM(S.net_sales) AS Total_Revenue,
        RANK() OVER (
            PARTITION BY P.category
            ORDER BY SUM(S.net_sales) DESC
        ) AS Product_Rank
    FROM products P
    JOIN sales S ON P.product_id = S.product_id
    GROUP By P.product_id, P.product_name, P.category
)
SELECT product_id, product_name, category, Total_Revenue, Product_Rank
FROM product_ranking
WHERE Product_Rank = 1
ORDER BY category;
---- Segment the customers based on their total purchase/revenue
WITH customer_sales AS (
    SELECT C.customer_id, C.customer_name, SUM(S.net_sales) AS Total_Purchase
           FROM customerss C
    JOIN sales S ON C.customer_id = S.customer_id
    GROUP BY C.customer_id, C.customer_name )
SELECT customer_id, customer_name, Total_Purchase,
    CASE
        WHEN Total_Purchase < 500000 THEN 'Low Value'
        WHEN Total_Purchase <= 1000000 THEN 'Medium Value'
        ELSE 'High Value'
    END AS Customer_Segment
FROM customer_sales
ORDER BY Total_Purchase DESC;
