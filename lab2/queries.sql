-- Lab 2: SQL Queries on E-Commerce Dataset
-- Author: Muskan
-- Date: April 2026

-- Query 1: Explore the data
SELECT * FROM customers LIMIT 5;
SELECT * FROM products LIMIT 5;
SELECT * FROM orders LIMIT 5;
SELECT * FROM order_items LIMIT 5;

-- Query 2: Customer names, cities, signup dates
SELECT name, city, signup_date
FROM customers
ORDER BY signup_date DESC;

-- Query 3: Filter delivered orders
SELECT order_id, customer_id, total_amount, order_date
FROM orders
WHERE status = 'delivered'
ORDER BY order_date DESC;

-- Query 4A: Price range using BETWEEN
SELECT product_name, category, price
FROM products
WHERE price BETWEEN 1000 AND 5000
ORDER BY price;

-- Query 4B: Same using comparison operators
SELECT product_name, category, price
FROM products
WHERE price >= 1000 AND price <= 5000
ORDER BY price;

-- Query 5: Top 10 highest value orders
SELECT order_id, customer_id, total_amount, status
FROM orders
ORDER BY total_amount DESC
LIMIT 10;

-- Query 6: Delivered orders in 2025 above 10000
SELECT order_id, customer_id, total_amount, order_date
FROM orders
WHERE status = 'delivered'
  AND order_date >= '2025-01-01'
  AND total_amount > 10000
ORDER BY total_amount DESC;

-- Query 7: Gmail customers
SELECT name, email, city
FROM customers
WHERE email LIKE '%@gmail.com'
ORDER BY name;

-- Query 8: Unshipped orders (NULL shipped_date)
SELECT order_id, customer_id, order_date, status, total_amount
FROM orders
WHERE shipped_date IS NULL
ORDER BY order_date;

-- Query 9: Products with 20% discount
SELECT product_name,
       category,
       price AS original_price,
       ROUND(price * 0.80, 2) AS discounted_price,
       ROUND(price * 0.20, 2) AS you_save
FROM products
ORDER BY discounted_price DESC;

-- Query 10: Top 5 unshipped orders with priority label
SELECT order_id,
       customer_id,
       total_amount,
       order_date,
       status,
       CASE
           WHEN total_amount > 20000 THEN 'CRITICAL'
           WHEN total_amount > 10000 THEN 'URGENT'
           ELSE 'NORMAL'
       END AS priority
FROM orders
WHERE shipped_date IS NULL
  AND order_date >= '2025-01-01'
ORDER BY total_amount DESC
LIMIT 5;
