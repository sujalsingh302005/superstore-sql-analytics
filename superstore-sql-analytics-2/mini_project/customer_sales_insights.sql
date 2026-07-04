-- =========================================================
-- Mini Project: Customer Sales Insights
-- =========================================================

-- ---------------------------------------------------------
-- Q1: Who are the top 5 customers?
-- ---------------------------------------------------------
WITH customer_sales AS (
    SELECT o.customer_id, c.customer_name, SUM(o.sales) AS total_sales
    FROM orders o
    JOIN customers c ON c.customer_id = o.customer_id
    GROUP BY o.customer_id, c.customer_name
)
SELECT customer_id, customer_name, total_sales
FROM customer_sales
ORDER BY total_sales DESC
LIMIT 5;
-- 1. Sean Miller     25043.05
-- 2. Tamara Chand    19052.22
-- 3. Raymond Buch    15117.34
-- 4. Tom Ashbrook    14595.62
-- 5. Adrian Barton   14473.57


-- ---------------------------------------------------------
-- Q2: Who are the bottom 5 customers?
-- ---------------------------------------------------------
WITH customer_sales AS (
    SELECT o.customer_id, c.customer_name, SUM(o.sales) AS total_sales
    FROM orders o
    JOIN customers c ON c.customer_id = o.customer_id
    GROUP BY o.customer_id, c.customer_name
)
SELECT customer_id, customer_name, total_sales
FROM customer_sales
ORDER BY total_sales ASC
LIMIT 5;
-- 1. Thais Sissman     4.83
-- 2. Lela Donovan      5.30
-- 3. Carl Jackson      16.52
-- 4. Mitch Gastineau   16.74
-- 5. Roy Skaria        22.33


-- ---------------------------------------------------------
-- Q3: Which customers made only one order?
-- Uses COUNT(DISTINCT order_id) since one order can contain
-- multiple product line items.
-- ---------------------------------------------------------
SELECT
    o.customer_id,
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS order_count
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY o.customer_id, c.customer_name
HAVING COUNT(DISTINCT o.order_id) = 1;
-- Result: 12 customers placed exactly one order, including
-- Anthony O'Donnell, Anemone Ratner, Carl Jackson, Jenna Caffey,
-- Jocasta Rupert, Lela Donovan, Mitch Gastineau, Patricia Hirasaki,
-- Ricardo Emerson, Roland Murray (+2 more)


-- ---------------------------------------------------------
-- Q4: Which customers have above-average sales?
-- ---------------------------------------------------------
WITH customer_sales AS (
    SELECT o.customer_id, c.customer_name, SUM(o.sales) AS total_sales
    FROM orders o
    JOIN customers c ON c.customer_id = o.customer_id
    GROUP BY o.customer_id, c.customer_name
)
SELECT customer_id, customer_name, total_sales
FROM customer_sales
WHERE total_sales > (SELECT AVG(total_sales) FROM customer_sales)
ORDER BY total_sales DESC;
-- Result: 294 of 793 customers (~37%) are above the average
-- total-sales line of ~$2,896.49


-- ---------------------------------------------------------
-- Q5: What is the highest order value per customer?
-- ---------------------------------------------------------
SELECT
    o.customer_id,
    c.customer_name,
    MAX(o.sales) AS highest_order_value
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY o.customer_id, c.customer_name
ORDER BY highest_order_value DESC;
-- Highest single order value overall: Sean Miller, $22,638.48
