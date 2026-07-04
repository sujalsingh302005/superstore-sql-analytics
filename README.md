# Superstore SQL Analytics — Week 3

## Objective
Use Subqueries, CTEs, and Window Functions to analyze sales data from the
Superstore dataset and answer customer-level business questions.

## Dataset
`data/superstore.csv` — the "Sample - Superstore" dataset (9,994 rows, 21
columns), loaded into a staging table `superstore_raw`, then normalized into
`customers`, `products`, and `orders`.

### Schema design notes (from inspecting the real data)
- **`customers`** holds `customer_id, customer_name, segment, country` only.
  City/State/Postal Code/Region are **not** stable per customer — the same
  customer ships to different addresses across orders — so those columns
  live on `orders` instead.
- **`products`** keeps one row per `product_id`. 32 product_ids in this
  dataset inconsistently map to more than one `product_name`/`category`
  (a data-quality quirk in the source file); we keep the first occurrence
  of each to preserve a clean primary key.
- **`order_date`/`ship_date`** are converted from `M/D/YYYY` text to a real
  date type on load — required so Task 6's `ORDER BY order_date` sequences
  orders chronologically instead of alphabetically.
- Resulting row counts: `customers` = 793, `products` = 1,862, `orders` =
  9,993 (one exact duplicate row was collapsed by `SELECT DISTINCT`).

## Approach
1. **Setup** (`setup/01_setup_tables.sql`) — load raw CSV, create normalized
   tables, populate with `SELECT DISTINCT`.
2. **Subqueries** (`queries/02_subqueries.sql`) — orders above average sales;
   highest sales order per customer.
3. **CTEs** (`queries/03_ctes.sql`) — total sales per customer.
4. **CTE + Subquery** (`queries/04_cte_subquery_combo.sql`) — customers with
   above-average total sales.
5. **Window Functions** (`queries/05_window_functions.sql`) — customer sales
   rank (`RANK`), rank with no gaps (`DENSE_RANK`), row number per order
   within a customer, top 3 customers.
6. **Final Combined Query** (`queries/06_final_combined_query.sql`) — Customer
   Name, Total Sales, Rank using JOIN + CTE + Window Function together.
7. **Mini Project** (`mini_project/customer_sales_insights.sql`) — top 5,
   bottom 5, single-order customers, above-average customers, highest order
   value per customer.

All queries were executed against the real dataset (SQLite). Full output is
in `results/query_outputs.md`.

## How to Run
1. Load `data/superstore.csv` into your SQL engine (PostgreSQL / MySQL /
   SQLite) as `superstore_raw`, converting `order_date`/`ship_date` to a
   proper date type.
2. Run `setup/01_setup_tables.sql`.
3. Run each file in `queries/` in order.
4. Run `mini_project/customer_sales_insights.sql` for the business questions.
5. See `results/query_outputs.md` for verified expected output.

## Key Insights
- **Top customer:** Sean Miller — $25,043.05 total sales (also placed the
  single highest-value order in the dataset: $22,638.48).
- **Top 3 by total sales:** Sean Miller, Tamara Chand ($19,052.22), Raymond
  Buch ($15,117.34).
- **2,359 of 9,993 orders** (about 24%) have sales above the overall average
  order value.
- **294 of 793 customers (~37%)** have total sales above the average
  customer total of $2,896.49.
- **12 customers** placed exactly one order (e.g. Lela Donovan, Carl
  Jackson, Mitch Gastineau) — candidates for a re-engagement campaign.
- **Lowest-spending customer:** Thais Sissman, at just $4.83 total sales.

## Folder Structure
```
superstore-sql-analytics/
│── data/
│   └── superstore.csv
│── setup/
│   └── 01_setup_tables.sql
│── queries/
│   ├── 02_subqueries.sql
│   ├── 03_ctes.sql
│   ├── 04_cte_subquery_combo.sql
│   ├── 05_window_functions.sql
│   └── 06_final_combined_query.sql
│── mini_project/
│   └── customer_sales_insights.sql
│── results/
│   └── query_outputs.md
└── README.md
```
