-- Creating new database
CREATE DATABASE sales_customer_analysis;

-- Table to store customer information
CREATE TABLE customerss (
    customer_id INT PRIMARY KEY,          -- Every customer unique ID
    customer_name VARCHAR(100) NOT NULL,  -- Customer name
    email VARCHAR(100),                   -- Customer email
    phone VARCHAR(15),                    -- Phone number
    city VARCHAR(50),                     -- Customer city
    state VARCHAR(50),                    -- Customer state
    customer_segment VARCHAR(30),         -- Retail / Corporate / Small Business
    registration_date DATE                -- Customer registration date
);
select * from customerss

-- Table to store products information
CREATE TABLE products (
    product_id INT PRIMARY KEY,            -- Unique product ID
    product_name VARCHAR(100) NOT NULL,    -- Product name
    category VARCHAR(50),                  -- Main category
    sub_category VARCHAR(50),              -- Product sub-category
    unit_price NUMERIC(12,2),              -- Selling price
    cost_price NUMERIC(12,2)               -- Company cost
);
select * from products

-- Table to store employees information
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,           -- Unique employee ID
    employee_name VARCHAR(100) NOT NULL,   -- Employee name
    department VARCHAR(50),                -- Sales / IT / HR etc.
    job_role VARCHAR(50),                  -- Employee role
    city VARCHAR(50),                      -- Employee city
    joining_date DATE                      -- Joining date
);
select * from employees

--  Table to store Actual sales transactions
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,               -- Unique sale ID
    sale_date DATE NOT NULL,               -- Sale date
    customer_id INT,                       -- customer Id
    product_id INT,                        -- product id
    employee_id INT,                       -- which employee the sale handle
    quantity INT,                          -- units sell 
    discount NUMERIC(5,2),                 -- Discount percentage
    gross_sales NUMERIC(12,2),             -- Before Discount sales
    net_sales NUMERIC(12,2),               -- After discount final sale

    -- Customer and sales connect using forgeign key
    FOREIGN KEY (customer_id)
        REFERENCES customerss(customer_id),

    -- Product and sales connect using forgeign key
    FOREIGN KEY (product_id)
        REFERENCES products(product_id),

    -- Employee and sales using forgeign key
    FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
);
select * from sales

-- Table to store Sales payment details 
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,             -- Unique payment ID
    sale_id INT,                            -- sale id
    payment_date DATE,                      -- Payment date
    payment_method VARCHAR(30),             -- UPI / Card / Cash etc.
    payment_status VARCHAR(30),             -- Paid / Pending / Failed
    amount NUMERIC(12,2),                   -- Payment amount

    -- Payment and sales table connect using foreign key
    FOREIGN KEY (sale_id)
        REFERENCES sales(sale_id)
);
select * from payments
