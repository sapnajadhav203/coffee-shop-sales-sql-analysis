






#Add primary key on transaction_id field
ALTER TABLE coffee_sales
ADD PRIMARY KEY(transaction_id);

#Data Validation

#Total Rows
SELECT count(*) FROM coffee_sales;

#Check Primary Key Uniqueness
SELECT transaction_id,count(*)
FROM coffee_sales
GROUP BY transaction_id 
HAVING count(*)>1;
#Result: No duplicate transaction IDs found.

#Check NULL Values
SELECT
    SUM(transaction_id IS NULL) AS transaction_id_nulls,
    SUM(transaction_date IS NULL) AS transaction_date_nulls,
    SUM(transaction_time IS NULL) AS transaction_time_nulls,
    SUM(quantity IS NULL) AS quantity,
    SUM(store_location IS NULL) AS store_location_nulls,
    SUM(product_id IS NULL) AS product_id_nulls,
    SUM(unit_price IS NULL) AS unit_price_nulls
FROM coffee_sales;

#Result: No NULL values found.

#Check Negative Prices
SELECT *
FROM coffee_sales
WHERE unit_price <= 0;

#Result: No invalid prices found.

#Check Invalid Quantity
SELECT *
FROM coffee_sales
WHERE quantity <= 0;

#Result: No invalid quantities found.

#Check Category Consistency
SELECT DISTINCT product_category
FROM coffee_sales;

#Result: Categories are consistently formatted.

#Check Date Range
SELECT
MIN(transaction_date),
MAX(transaction_date)
FROM coffee_sales;


#Check Time Range
SELECT
MIN(transaction_time),
MAX(transaction_time)
FROM coffee_sales;