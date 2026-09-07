-------------------  Product Analysis
----- TOP 10 product by revnue 
select P.product_id, P.product_name, sum(S.net_sales) as Sales
        from products P
join sales S on P.product_id = S.product_id
Group by P.product_id, P.product_name
order by Sales desc
limit 10;
--------- TOP Products by Qty Sold 
select P.product_id, P.product_name, sum(S.quantity) as Qty_sold
        from products P
join sales S on P.product_id = S.product_id
Group by P.product_id, P.product_name
order by Qty_sold desc
limit 10;
----------- Category wise revenue
select  P.category, sum(S.net_sales) as Sales
        from products P
join sales S on P.product_id = S.product_id
Group by P.category
order by Sales desc;
--------- Category Wise Profit
select  P.category, sum(s.net_sales - (s.quantity * p.cost_price)) AS Total_Profit
        from products P
join sales S on P.product_id = S.product_id
Group by P.category
order by Total_Profit desc;
----------- Most Profitable Products
SELECT P.product_id, P.product_name, SUM(S.net_sales - (S.quantity * P.cost_price)) AS Total_Profit
       FROM products P
JOIN sales S ON P.product_id = S.product_id
GROUP BY P.product_id, P.product_name
ORDER BY Total_Profit DESC
LIMIT 10;
------------- Bottom 10 Products by Revenue
SELECT P.product_id, P.product_name, SUM(S.net_sales) AS Total_Revenue
      FROM products P
JOIN sales S ON P.product_id = S.product_id
GROUP BY P.product_id, P.product_name
ORDER BY Total_Revenue ASC
LIMIT 10;
------- Product Ranking 
SELECT P.product_id, P.product_name, SUM(S.net_sales) AS Total_Revenue,
    RANK() OVER ( ORDER BY SUM(S.net_sales) DESC ) AS Revenue_Rank
      FROM products P
JOIN sales S ON P.product_id = S.product_id
GROUP BY P.product_id,P.product_name
ORDER BY Revenue_Rank
