-- =========================================================
-- Task 5: Rank all customers based on total sales (Window Function)
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
    total_sales,
    RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM customer_sales
ORDER BY sales_rank;
-- Rank 1: Sean Miller ($25,043.05)


-- =========================================================
-- Task 5b: Rank customers using DENSE_RANK (no gaps after ties)
-- The assignment guide calls out ROW_NUMBER, RANK, and DENSE_RANK
-- together. RANK() leaves a gap after a tie (e.g. 1,2,2,4); DENSE_RANK()
-- does not (1,2,2,3). In this dataset no two customers have an exactly
-- equal total_sales value, so RANK and DENSE_RANK happen to match --
-- but DENSE_RANK is the correct choice whenever ties are possible and
-- you don't want skipped rank numbers.
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
    total_sales,
    RANK() OVER (ORDER BY total_sales DESC)       AS sales_rank,
    DENSE_RANK() OVER (ORDER BY total_sales DESC) AS sales_dense_rank
FROM customer_sales
ORDER BY sales_dense_rank;


-- =========================================================
-- Task 6: Row numbers for each order within a customer (Window Function + PARTITION BY)
-- Note: order_date must be a real DATE (not raw M/D/YYYY text) for
-- this ORDER BY to sequence orders chronologically.
-- =========================================================
SELECT
    o.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date,
    o.sales,
    ROW_NUMBER() OVER (PARTITION BY o.customer_id ORDER BY o.order_date) AS order_seq
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
ORDER BY o.customer_id, order_seq;


-- =========================================================
-- Task 7: Top 3 customers based on total sales (Window Function)
-- =========================================================
WITH customer_sales AS (
    SELECT
        o.customer_id,
        c.customer_name,
        SUM(o.sales) AS total_sales
    FROM orders o
    JOIN customers c ON c.customer_id = o.customer_id
    GROUP BY o.customer_id, c.customer_name
),
ranked AS (
    SELECT
        customer_id,
        customer_name,
        total_sales,
        RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
    FROM customer_sales
)
SELECT customer_id, customer_name, total_sales, sales_rank
FROM ranked
WHERE sales_rank <= 3
ORDER BY sales_rank;
-- 1. Sean Miller    $25,043.05
-- 2. Tamara Chand    $19,052.22
-- 3. Raymond Buch     $15,117.34
