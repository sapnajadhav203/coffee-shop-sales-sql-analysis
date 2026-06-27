/*
==================================================
EXPLORATORY DATA ANALYSIS (EDA)
==================================================

Dataset validation and quality checks were completed
in 04_Data_validation.sql before performing analysis.
*/

SELECT * 
FROM coffee_sales 
LIMIT 10;

#Total Revenue
SELECT 
SUM(quantity * unit_price) AS total_revenue
FROM coffee_sales;

#2.Total Transactions
SELECT 
COUNT(DISTINCT transaction_id) AS total_transactions 
FROM coffee_sales;

#3. Total Quantity Sold
SELECT 
SUM(quantity) AS total_quantity 
FROM coffee_sales;

#4. Average Order Value
SELECT
ROUND(AVG(order_total), 2) AS avg_order_value
FROM
(
SELECT
transaction_id,
SUM(quantity * unit_price) AS order_total
FROM coffee_sales
GROUP BY transaction_id
) t;

#5. Average Unit Price
SELECT 
ROUND(avg(unit_price), 2) AS avg_unit_price 
FROM coffee_sales;

#6. Number of Products
SELECT 
COUNT(DISTINCT product_id) AS total_products 
FROM coffee_sales;

#7. Number of Stores
SELECT 
COUNT(DISTINCT store_id) AS total_stores 
FROM coffee_sales;

-- Dataset Coverage
#8.First transaction
SELECT *
FROM coffee_sales
ORDER BY transaction_date,
transaction_time
LIMIT 1;

-- Insight:
-- First recorded transaction occurred on
-- 2023-01-01 at 07:06 AM
-- Store: Lower Manhattan
-- Product: Coffee

#9.Last transaction
SELECT *
FROM coffee_sales
ORDER BY transaction_date DESC,
transaction_time DESC,
transaction_id DESC
LIMIT 1;

-- Insight:
-- Two transactions share the latest timestamp (2023-06-30 20:57:19).
-- Transaction ID is used as a tie-breaker to identify the last recorded transaction.
-- Last recorded transaction occurred on:
-- 2023-06-30 at 08:57 PM
-- Store: Hell's kitchen
-- Product: Regular Syrup

#10.Total Sales Days
SELECT
MIN(transaction_date) AS start_date,
MAX(transaction_date) AS end_date,
DATEDIFF(MAX(transaction_date), MIN(transaction_date)) + 1 AS sales_days
FROM coffee_sales;

#11.Average Daily Revenue
SELECT
ROUND(
SUM(quantity * unit_price)
/ COUNT(DISTINCT transaction_date),
2
) AS avg_daily_revenue
FROM coffee_sales;

#12.Average Daily Revenue
SELECT
ROUND(
SUM(quantity * unit_price)
/ COUNT(DISTINCT transaction_date),
2
) AS avg_daily_revenue
FROM coffee_sales;

#13.Revenue per Transaction
SELECT
ROUND(
SUM(quantity * unit_price)
/
COUNT(DISTINCT transaction_id),
2
) AS revenue_per_transaction
FROM coffee_sales;
