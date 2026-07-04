-- =========================================================
-- Task 3: Total sales for each customer (CTE)
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
SELECT *
FROM customer_sales
ORDER BY total_sales DESC;
-- Result: 793 customers. Top: Sean Miller ($25,043.05).
-- Average total_sales across all customers: ~$2,896.49
