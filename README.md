# Sales & Customer Analysis | PostgreSQL

## Project Overview

This project analyzes sales and customer data using PostgreSQL to identify revenue trends, customer behavior, product performance, employee performance, and key business insights.

## Business Objective

- Analyze overall sales and revenue performance
- Identify high-value customers
- Analyze product and category performance
- Evaluate employee sales performance
- Identify monthly sales trends
- Generate actionable business insights using SQL

## Tools & Technologies

- PostgreSQL
- SQL
- pgAdmin
- GitHub
- CSV Data

## Database Structure

The project contains five relational tables:

- `customerss` — Customer information
- `products` — Product and pricing information
- `employees` — Employee information
- `sales` — Sales transaction data
- `payments` — Payment transaction data

### Relationships

- `sales.customer_id` → `customerss.customer_id`
- `sales.product_id` → `products.product_id`
- `sales.employee_id` → `employees.employee_id`
- `payments.sale_id` → `sales.sale_id`

## SQL Analysis

The project includes:

- Data validation
- KPI analysis
- Customer analysis
- Product analysis
- Employee analysis
- Time-based sales analysis
- Advanced SQL analysis

### SQL Concepts Used

- SELECT
- WHERE
- JOINs
- GROUP BY
- HAVING
- Aggregate Functions
- CASE WHEN
- CTEs
- Subqueries
- Window Functions
- RANK()
- DENSE_RANK()
- ROW_NUMBER()
- LAG()
- Data Validation
- Business Analysis

## Key Business Insights

- Total Profit: **₹78.23 Lakh**
- Profit Margin: **12.16%**
- Average Order Value: **₹53.61K**
- Corporate customers generated the highest segment revenue.
- Pune generated the highest city-wise revenue.
- Nisha Gupta was the highest-value customer.
- Varun Kapoor was the top-performing employee by revenue.
- Samsung Galaxy S24 was the top-performing Electronics product.
- Customer segmentation helped identify high-value customers for targeted business strategies.

## Project Structure

```text
Sales-Customer-Analysis/
│
├── README.md
│
├── data/
│   ├── customers.csv
│   ├── products.csv
│   ├── employees.csv
│   ├── sales.csv
│   └── payments.csv
│
├── sql/
│   ├── 01_database_setup.sql
│   ├── 02_data_validation.sql
│   ├── 03_kpi_analysis.sql
│   ├── 04_customer_analysis.sql
│   ├── 05_product_analysis.sql
│   ├── 06_employee_analysis.sql
│   ├── 07_time_sales_analysis.sql
│   └── 08_advanced_analysis.sql
│
└── insights/
    └── business_insights.md
```

## How to Run

1. Install PostgreSQL and pgAdmin.
2. Create the database using `01_database_setup.sql`.
3. Import the CSV files from the `data` folder.
4. Run the SQL analysis files in order.
5. Review the business insights in `insights/business_insights.md`.

## Skills Demonstrated

- SQL Data Analysis
- Relational Database Design
- Data Validation
- Customer Analytics
- Sales Analytics
- Business Intelligence
- Advanced SQL
- Analytical Thinking
