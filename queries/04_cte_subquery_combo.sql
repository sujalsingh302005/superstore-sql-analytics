-- =========================================================
-- Task 4: Customers whose total sales are above average (CTE + Subquery)
-- =========================================================
WITH customer_sales AS (
    SELECT
        o.customer_id,
        c.customer_name,
        SUM(o.sales) AS total_sales
    FROM orders o
    JOIN customers c ON c.customer_id = o.customer_id
    GROUP BY o.customer_id, c.customer_name
)
SELECT
    customer_id,
    customer_name,
    total_sales
FROM customer_sales
WHERE total_sales > (SELECT AVG(total_sales) FROM customer_sales)
ORDER BY total_sales DESC;
-- Result: 294 of 793 customers (~37%) have above-average total sales
