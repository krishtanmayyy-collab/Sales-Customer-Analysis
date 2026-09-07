----------------- Employee_Analysis
--- Employee wise TOTal Revenue
select E.employee_name, sum(S.net_sales) as Total_revenue
        from employees E
join sales S on E.employee_id = S.employee_id
Group by E.employee_name
order by Total_revenue desc;
---- Employee Wise Total Order
select E.employee_name, count(S.sale_id) as Total_Order
        from employees E
join sales S on E.employee_id = S.employee_id
Group by E.employee_name
order by Total_Order desc;
---- Average Sale Per Employee
select E.employee_name, ROUND(avg(S.net_sales), 2) as Avg_Sale
        from employees E
join sales S on E.employee_id = S.employee_id
Group by E.employee_name
order by Avg_Sale desc;
---------- TOP 5 Employee by revenue
select E.employee_name, sum(S.net_sales) as Total_Revenue
        from employees E
join sales S on E.employee_id = S.employee_id
Group by E.employee_name
order by Total_Revenue desc
limit 5;
------ Employee Ranking Revenue 
SELECT E.employee_name, SUM(S.net_sales) AS Total_Revenue,
    RANK() OVER ( ORDER BY SUM(S.net_sales) DESC ) AS Revenue_Rank
FROM employees E
JOIN sales S ON E.employee_id = S.employee_id
GROUP BY E.employee_name
ORDER BY Revenue_Rank;
