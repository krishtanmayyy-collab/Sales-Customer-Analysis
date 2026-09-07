------------- KPI Analysis
------------------Which city has the highest number of customers
select city,
    COUNT(*) AS total_customers
FROM customerss
GROUP BY city
ORDER BY total_customers desc;
--------------- Which customer segment has the most customers 
SELECT customer_segment,    
    COUNT(*) AS total_customers
FROM customerss
GROUP BY customer_segment
ORDER BY total_customers DESC;
-------- Which product category has the highest number of products
SELECT category,
    COUNT(*) AS total_products
FROM products
GROUP BY category
ORDER BY total_products DESC;
------ Total Revenue
SELECT SUM(net_sales) as Total_Revnue
       from sales;
-----------Total Order 
SELECT COUNT(sale_id) as Total_Order
       from sales;
------ Total Quantity sold
select sum(quantity) as Total_Quantity_sold
       from sales;
-------- Average Order Value (AOV)
SELECT ROUND(AVG(net_sales), 2) as Avg_Order_Value
      FROM sales;
-------------  Highest Sale
Select max(net_sales) as HIghest_Sale
      from sales;
---------- Lowest Sale
Select min(net_sales) as Lowest_Sale
       from sales;
--------- Total Gross Sale
Select sum(Gross_sales) as Total_Gross_Sales
       from sales;
----------- Total Discount Amount
Select sum(Gross_Sales - Net_Sales) as Total_Discount_Amount
       from sales;
---------------- Total Profit
select SUM(s.net_sales - (s.quantity * p.cost_price)) AS Total_Profit
       from sales S
join products P on S.product_id = P.product_id;
--------- Profit Margin
SELECT ROUND( SUM(s.net_sales - (s.quantity * p.cost_price))
        / SUM(s.net_sales) * 100
    , 2) AS Profit_Margin_Percentage
FROM sales s
JOIN products p
    ON s.product_id = p.product_id;
