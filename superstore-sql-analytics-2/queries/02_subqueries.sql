-- =========================================================
-- Task 1: Orders where sales are greater than the average sales (Subquery)
-- =========================================================
SELECT
    order_id,
    customer_id,
    product_id,
    sales
FROM orders
WHERE sales > (SELECT AVG(sales) FROM orders)
ORDER BY sales DESC;
-- Result: 2,359 orders out of 9,993 exceed the average sale of ~$230


-- =========================================================
-- Task 2: Highest sales order for each customer (Subquery)
-- =========================================================
SELECT
    o.customer_id,
    c.customer_name,
    o.order_id,
    o.sales
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
WHERE o.sales = (
    SELECT MAX(o2.sales)
    FROM orders o2
    WHERE o2.customer_id = o.customer_id
)
ORDER BY o.sales DESC;
-- Top result: Sean Miller, order CA-2014-145317, $22,638.48
