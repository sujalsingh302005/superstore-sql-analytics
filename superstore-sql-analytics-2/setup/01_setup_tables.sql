-- =========================================================
-- Week 3: Setup Data
-- Load Superstore dataset, then split into customers/orders/products
--
-- Schema matches Sample - Superstore.csv exactly (21 columns).
-- Design notes based on inspecting the actual data:
--   * customer_id -> customer_name/segment/country is 1:1 (safe to
--     dedupe into a customers table).
--   * City/State/Postal Code/Region vary PER ORDER for the same
--     customer (customers ship to different addresses), so those
--     columns stay on `orders`, not `customers`.
--   * A small number of product_ids (32 in this dataset) are
--     inconsistently mapped to more than one product_name/category
--     combination -- a known data-quality quirk in this dataset.
--     We keep the first occurrence per product_id for the
--     `products` table so the primary key holds.
-- =========================================================

-- Step 1: Raw staging table (mirrors the CSV as-is)
DROP TABLE IF EXISTS superstore_raw;

CREATE TABLE superstore_raw (
    row_id          INT,
    order_id        VARCHAR(20),
    order_date      DATE,
    ship_date       DATE,
    ship_mode       VARCHAR(50),
    customer_id     VARCHAR(20),
    customer_name   VARCHAR(100),
    segment         VARCHAR(50),
    country         VARCHAR(50),
    city            VARCHAR(100),
    state           VARCHAR(100),
    postal_code     VARCHAR(20),
    region          VARCHAR(50),
    product_id      VARCHAR(30),
    category        VARCHAR(50),
    sub_category    VARCHAR(50),
    product_name    VARCHAR(255),
    sales           DECIMAL(12,2),
    quantity        INT,
    discount        DECIMAL(5,2),
    profit          DECIMAL(12,2)
);

-- Load the CSV into superstore_raw. Dates in the source file are
-- M/D/YYYY text -- convert to a real DATE/ISO format on import so
-- ORDER BY on order_date/ship_date sorts chronologically, not
-- alphabetically (this matters for Task 6 below).
-- Example (PostgreSQL):
-- \copy superstore_raw FROM 'data/superstore.csv' DELIMITER ',' CSV HEADER;
-- UPDATE superstore_raw SET order_date = TO_DATE(order_date_text, 'MM/DD/YYYY');

-- Step 2: Create normalized tables
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    customer_id     VARCHAR(20) PRIMARY KEY,
    customer_name   VARCHAR(100),
    segment         VARCHAR(50),
    country         VARCHAR(50)
);

DROP TABLE IF EXISTS products;
CREATE TABLE products (
    product_id      VARCHAR(30) PRIMARY KEY,
    category        VARCHAR(50),
    sub_category    VARCHAR(50),
    product_name    VARCHAR(255)
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id        VARCHAR(20),
    order_date      DATE,
    ship_date       DATE,
    ship_mode       VARCHAR(50),
    customer_id     VARCHAR(20),
    product_id      VARCHAR(30),
    city            VARCHAR(100),
    state           VARCHAR(100),
    postal_code     VARCHAR(20),
    region          VARCHAR(50),
    sales           DECIMAL(12,2),
    quantity        INT,
    discount        DECIMAL(5,2),
    profit          DECIMAL(12,2)
);

-- Step 3: Populate using SELECT DISTINCT
INSERT INTO customers (customer_id, customer_name, segment, country)
SELECT DISTINCT customer_id, customer_name, segment, country
FROM superstore_raw;

-- products: keep one row per product_id (first occurrence) since a
-- handful of product_ids inconsistently map to more than one
-- product_name/category in the source data.
INSERT INTO products (product_id, category, sub_category, product_name)
SELECT product_id, category, sub_category, product_name
FROM (
    SELECT
        product_id, category, sub_category, product_name,
        ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY row_id) AS rn
    FROM superstore_raw
) ranked
WHERE rn = 1;

INSERT INTO orders (order_id, order_date, ship_date, ship_mode, customer_id, product_id, city, state, postal_code, region, sales, quantity, discount, profit)
SELECT DISTINCT order_id, order_date, ship_date, ship_mode, customer_id, product_id, city, state, postal_code, region, sales, quantity, discount, profit
FROM superstore_raw;

-- Quick sanity checks (actual counts from Sample - Superstore.csv)
SELECT COUNT(*) AS raw_rows      FROM superstore_raw;   -- 9994
SELECT COUNT(*) AS customer_rows FROM customers;         -- 793
SELECT COUNT(*) AS product_rows  FROM products;           -- 1862
SELECT COUNT(*) AS order_rows    FROM orders;             -- 9993
