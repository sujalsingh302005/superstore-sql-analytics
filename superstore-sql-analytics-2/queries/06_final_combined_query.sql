-- =========================================================
-- Step 3: Final Combined Query
-- Customer Name, Total Sales, Rank (JOIN + CTE + Window Function)
-- =========================================================
WITH customer_sales AS (
    SELECT
        o.customer_id,
        SUM(o.sales) AS total_sales
    FROM orders o
    GROUP BY o.customer_id
)
SELECT
    c.customer_name,
    cs.total_sales,
    RANK() OVER (ORDER BY cs.total_sales DESC)       AS sales_rank,
    DENSE_RANK() OVER (ORDER BY cs.total_sales DESC) AS sales_dense_rank
FROM customer_sales cs
JOIN customers c ON c.customer_id = cs.customer_id
ORDER BY sales_rank;

-- Top 5 output (rank and dense_rank match here since no ties exist):
-- Sean Miller          25043.05   1   1
-- Tamara Chand         19052.22   2   2
-- Raymond Buch         15117.34   3   3
-- Tom Ashbrook         14595.62   4   4
-- Adrian Barton        14473.57   5   5
