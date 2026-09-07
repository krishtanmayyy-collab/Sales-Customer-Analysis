
\# Sales \& Customer Analysis | PostgreSQL



\## Project Overview



This project is about analyzing sales and customer data using PostgreSQL.



The main goal is to understand:

\- Sales and revenue

\- Customer behavior

\- Product performance

\- Employee performance

\- Monthly sales trends



I used SQL queries to find useful business information from the data.



\## Business Objective



The main objectives of this project are:



\- Find total sales, revenue, profit, and orders.

\- Identify top customers by revenue and orders.

\- Find the best-performing products and categories.

\- Compare employee sales performance.

\- Analyze monthly sales trends.

\- Identify high-value customers.

\- Find useful information that can help in business decisions.



\## Tools \& Technologies



\- PostgreSQL

\- SQL

\- pgAdmin

\- GitHub



\## Database Structure



The project contains 5 main tables:



| Table | Description |

|---|---|

| `customerss` | Stores customer information |

| `products` | Stores product information |

| `employees` | Stores employee information |

| `sales` | Stores sales transaction details |

| `payments` | Stores payment details |



The tables are connected using primary keys and foreign keys.



\## SQL Analysis



The project includes the following SQL analysis:



\- Data validation and data quality checks

\- Key business KPIs

\- Customer analysis

\- Product analysis

\- Employee performance analysis

\- Monthly sales analysis

\- Sales performance classification

\- Customer segmentation

\- Ranking using SQL window functions

\- Top products by category

\- Month-over-Month revenue analysis

\- Running total revenue



\## Key Business Insights



\- Total profit was approximately ₹78.23 lakh.

\- Profit margin was 12.16%.

\- Average order value was approximately ₹53.61K.

\- Corporate customers generated the highest revenue.

\- Pune generated the highest sales revenue among the cities.

\- Nisha Gupta was the highest-revenue customer.

\- Varun Kapoor was the top-performing employee by revenue.

\- Samsung Galaxy S24 was the highest-revenue product in the Electronics category.

\- Customer segmentation helped identify high-value customers.



\## Project Structure



```text

Sales-Customer-Analysis/

│

├── README.md

│

├── sql/

│   ├── 01\_database\_setup.sql

│   ├── 02\_data\_validation.sql

│   ├── 03\_kpi\_analysis.sql

│   ├── 04\_customer\_analysis.sql

│   ├── 05\_product\_analysis.sql

│   ├── 06\_employee\_analysis.sql

│   ├── 07\_time\_sales\_analysis.sql

│   └── 08\_advanced\_analysis.sql

│

└── insights/

&#x20;   └── business\_insights.md



\## How to Run



1\. Install PostgreSQL and pgAdmin.

2\. Create the database using `01\_database\_setup.sql`.

3\. Import the required data into the tables.

4\. Run the SQL analysis files from the `sql` folder.

5\. Check the business insights in the `insights` folder.



\## Skills Demonstrated



\- SQL Joins

\- GROUP BY and HAVING

\- Aggregate Functions

\- CASE WHEN

\- CTEs

\- Window Functions

\- RANK, DENSE\_RANK, ROW\_NUMBER

\- Data Validation

\- Business Analysis

