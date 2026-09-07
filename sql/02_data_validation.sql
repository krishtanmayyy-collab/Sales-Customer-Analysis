--------------------------- Check number of records in every table
SELECT COUNT(*) AS total_customers
FROM customerss;

SELECT COUNT(*) AS total_products
FROM products;

SELECT COUNT(*) AS total_employees
FROM employees;

SELECT COUNT(*) AS total_sales
FROM sales;

SELECT COUNT(*) AS total_payments
FROM payments;

--------------------------- Find duplicate customer IDs
SELECT
    customer_id,
    COUNT(*) AS duplicate_count
FROM customerss
GROUP BY customer_id
HAVING COUNT(*) > 1;

------------ Find duplicate product IDs
SELECT
    product_id,
    COUNT(*) AS duplicate_count
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

-- Find duplicate sale IDs
SELECT
    sale_id,
    COUNT(*) AS duplicate_count
FROM sales
GROUP BY sale_id
HAVING COUNT(*) > 1;

-------NUll value check in customerss 
SELECT
    COUNT(*) AS total_rows,
    COUNT(customer_id) AS customer_id_available,
    COUNT(customer_name) AS customer_name_available,
    COUNT(city) AS city_available,
    COUNT(customer_segment) AS segment_available
FROM customerss;
-----------------null value check in sales
SELECT
    COUNT(*) AS total_rows,
    COUNT(sale_id) AS sale_id_available,
    COUNT(customer_id) AS customer_id_available,
    COUNT(product_id) AS product_id_available,
    COUNT(employee_id) AS employee_id_available,
    COUNT(sale_date) AS date_available,
    COUNT(net_sales) AS net_sales_available
FROM sales;
------------- Find sales records whose product does not exist
SELECT s.product_id
FROM sales s
LEFT JOIN products p
    ON s.product_id = p.product_id
WHERE p.product_id IS NULL;
-- Find sales records whose employee does not exist
SELECT s.employee_id
FROM sales s
LEFT JOIN employees e
    ON s.employee_id = e.employee_id
WHERE e.employee_id IS NULL;
