# Query Outputs — Week 3 (real results from Sample - Superstore.csv)


## Task 1 — Orders above average sales

**2,359 of 9,993 orders** exceed the average sale amount. Top 10 shown:


| order_id       | customer_id   | product_id      |    sales |
|:---------------|:--------------|:----------------|---------:|
| CA-2014-145317 | SM-20320      | TEC-MA-10002412 | 22638.5  |
| CA-2016-118689 | TC-20980      | TEC-CO-10004722 | 17500    |
| CA-2017-140151 | RB-19360      | TEC-CO-10004722 | 14000    |
| CA-2017-127180 | TA-21385      | TEC-CO-10004722 | 11200    |
| CA-2017-166709 | HL-15040      | TEC-CO-10004722 | 10500    |
| CA-2016-117121 | AB-10105      | OFF-BI-10000545 |  9892.74 |
| CA-2014-116904 | SC-20095      | OFF-BI-10001120 |  9449.95 |
| US-2016-107440 | BS-11365      | TEC-MA-10001047 |  9099.93 |
| CA-2016-158841 | SE-20110      | TEC-MA-10001127 |  8749.95 |
| CA-2016-143714 | CC-12370      | TEC-CO-10004722 |  8399.98 |


## Task 2 — Highest sales order per customer (top 10 by sales)

| customer_id   | customer_name      | order_id       |    sales |
|:--------------|:-------------------|:---------------|---------:|
| SM-20320      | Sean Miller        | CA-2014-145317 | 22638.5  |
| TC-20980      | Tamara Chand       | CA-2016-118689 | 17500    |
| RB-19360      | Raymond Buch       | CA-2017-140151 | 14000    |
| TA-21385      | Tom Ashbrook       | CA-2017-127180 | 11200    |
| HL-15040      | Hunter Lopez       | CA-2017-166709 | 10500    |
| AB-10105      | Adrian Barton      | CA-2016-117121 |  9892.74 |
| SC-20095      | Sanjit Chand       | CA-2014-116904 |  9449.95 |
| BS-11365      | Bill Shonely       | US-2016-107440 |  9099.93 |
| SE-20110      | Sanjit Engle       | CA-2016-158841 |  8749.95 |
| CC-12370      | Christopher Conant | CA-2016-143714 |  8399.98 |


## Task 3 — Total sales per customer (top 10)

793 customers total. Average total sales per customer: **$2,896.49**


| customer_id   | customer_name      |   total_sales |
|:--------------|:-------------------|--------------:|
| SM-20320      | Sean Miller        |       25043   |
| TC-20980      | Tamara Chand       |       19052.2 |
| RB-19360      | Raymond Buch       |       15117.3 |
| TA-21385      | Tom Ashbrook       |       14595.6 |
| AB-10105      | Adrian Barton      |       14473.6 |
| KL-16645      | Ken Lonsdale       |       14175.2 |
| SC-20095      | Sanjit Chand       |       14142.3 |
| HL-15040      | Hunter Lopez       |       12873.3 |
| SE-20110      | Sanjit Engle       |       12209.4 |
| CC-12370      | Christopher Conant |       12129.1 |


## Task 4 — Customers above average total sales

**294 of 793 customers (37%)** are above average. Top 10 shown:


| customer_id   | customer_name      |   total_sales |
|:--------------|:-------------------|--------------:|
| SM-20320      | Sean Miller        |       25043   |
| TC-20980      | Tamara Chand       |       19052.2 |
| RB-19360      | Raymond Buch       |       15117.3 |
| TA-21385      | Tom Ashbrook       |       14595.6 |
| AB-10105      | Adrian Barton      |       14473.6 |
| KL-16645      | Ken Lonsdale       |       14175.2 |
| SC-20095      | Sanjit Chand       |       14142.3 |
| HL-15040      | Hunter Lopez       |       12873.3 |
| SE-20110      | Sanjit Engle       |       12209.4 |
| CC-12370      | Christopher Conant |       12129.1 |


## Task 5 — Customer rank by total sales (top 10)

| customer_id   | customer_name      |   total_sales |   sales_rank |
|:--------------|:-------------------|--------------:|-------------:|
| SM-20320      | Sean Miller        |       25043   |            1 |
| TC-20980      | Tamara Chand       |       19052.2 |            2 |
| RB-19360      | Raymond Buch       |       15117.3 |            3 |
| TA-21385      | Tom Ashbrook       |       14595.6 |            4 |
| AB-10105      | Adrian Barton      |       14473.6 |            5 |
| KL-16645      | Ken Lonsdale       |       14175.2 |            6 |
| SC-20095      | Sanjit Chand       |       14142.3 |            7 |
| HL-15040      | Hunter Lopez       |       12873.3 |            8 |
| SE-20110      | Sanjit Engle       |       12209.4 |            9 |
| CC-12370      | Christopher Conant |       12129.1 |           10 |


## Task 5b — Rank customers using DENSE_RANK (top 10)
No two customers share an identical total_sales value in this dataset, so RANK and DENSE_RANK match here. DENSE_RANK is included because the assignment guide calls it out explicitly, and it's the correct choice whenever ties are possible (it doesn't skip rank numbers after a tie).

| customer_id   | customer_name      |   total_sales |   sales_rank |   sales_dense_rank |
|:--------------|:-------------------|--------------:|-------------:|-------------------:|
| SM-20320      | Sean Miller        |       25043   |            1 |                  1 |
| TC-20980      | Tamara Chand       |       19052.2 |            2 |                  2 |
| RB-19360      | Raymond Buch       |       15117.3 |            3 |                  3 |
| TA-21385      | Tom Ashbrook       |       14595.6 |            4 |                  4 |
| AB-10105      | Adrian Barton      |       14473.6 |            5 |                  5 |
| KL-16645      | Ken Lonsdale       |       14175.2 |            6 |                  6 |
| SC-20095      | Sanjit Chand       |       14142.3 |            7 |                  7 |
| HL-15040      | Hunter Lopez       |       12873.3 |            8 |                  8 |
| SE-20110      | Sanjit Engle       |       12209.4 |            9 |                  9 |
| CC-12370      | Christopher Conant |       12129.1 |           10 |                 10 |

## Task 6 — Row number per order within customer (sample: first 6 rows, 2 customers)

| customer_id   | customer_name   | order_id       | order_date   |    sales |   order_seq |
|:--------------|:----------------|:---------------|:-------------|---------:|------------:|
| AA-10315      | Alex Avila      | CA-2014-128055 | 2014-03-31   |  673.568 |           1 |
| AA-10315      | Alex Avila      | CA-2014-128055 | 2014-03-31   |   52.98  |           2 |
| AA-10315      | Alex Avila      | CA-2014-138100 | 2014-09-15   |   14.94  |           3 |
| AA-10315      | Alex Avila      | CA-2014-138100 | 2014-09-15   |   14.56  |           4 |
| AA-10315      | Alex Avila      | CA-2015-121391 | 2015-10-04   |   26.96  |           5 |
| AA-10315      | Alex Avila      | CA-2016-103982 | 2016-03-03   | 3930.07  |           6 |


## Task 7 — Top 3 customers

| customer_id   | customer_name   |   total_sales |   sales_rank |
|:--------------|:----------------|--------------:|-------------:|
| SM-20320      | Sean Miller     |       25043   |            1 |
| TC-20980      | Tamara Chand    |       19052.2 |            2 |
| RB-19360      | Raymond Buch    |       15117.3 |            3 |


## Final Combined Query (top 10)

| customer_name      |   total_sales |   sales_rank |
|:-------------------|--------------:|-------------:|
| Sean Miller        |       25043   |            1 |
| Tamara Chand       |       19052.2 |            2 |
| Raymond Buch       |       15117.3 |            3 |
| Tom Ashbrook       |       14595.6 |            4 |
| Adrian Barton      |       14473.6 |            5 |
| Ken Lonsdale       |       14175.2 |            6 |
| Sanjit Chand       |       14142.3 |            7 |
| Hunter Lopez       |       12873.3 |            8 |
| Sanjit Engle       |       12209.4 |            9 |
| Christopher Conant |       12129.1 |           10 |


## Mini Project


### Q1: Top 5 customers

| customer_id   | customer_name   |   total_sales |
|:--------------|:----------------|--------------:|
| SM-20320      | Sean Miller     |       25043   |
| TC-20980      | Tamara Chand    |       19052.2 |
| RB-19360      | Raymond Buch    |       15117.3 |
| TA-21385      | Tom Ashbrook    |       14595.6 |
| AB-10105      | Adrian Barton   |       14473.6 |


### Q2: Bottom 5 customers

| customer_id   | customer_name   |   total_sales |
|:--------------|:----------------|--------------:|
| TS-21085      | Thais Sissman   |         4.833 |
| LD-16855      | Lela Donovan    |         5.304 |
| CJ-11875      | Carl Jackson    |        16.52  |
| MG-18205      | Mitch Gastineau |        16.739 |
| RS-19870      | Roy Skaria      |        22.328 |


### Q3: Customers who made only one order (12 total)

| customer_id   | customer_name     |   order_count |
|:--------------|:------------------|--------------:|
| AR-10570      | Anemone Ratner    |             1 |
| AO-10810      | Anthony O'Donnell |             1 |
| CJ-11875      | Carl Jackson      |             1 |
| JC-15385      | Jenna Caffey      |             1 |
| JR-15700      | Jocasta Rupert    |             1 |
| LD-16855      | Lela Donovan      |             1 |
| MG-18205      | Mitch Gastineau   |             1 |
| PH-18790      | Patricia Hirasaki |             1 |
| RE-19405      | Ricardo Emerson   |             1 |
| RM-19750      | Roland Murray     |             1 |
| SM-20905      | Susan MacKendrick |             1 |
| TC-21145      | Theresa Coyne     |             1 |


### Q4: Above-average customers (294 total, top 10 shown)

| customer_id   | customer_name      |   total_sales |
|:--------------|:-------------------|--------------:|
| SM-20320      | Sean Miller        |       25043   |
| TC-20980      | Tamara Chand       |       19052.2 |
| RB-19360      | Raymond Buch       |       15117.3 |
| TA-21385      | Tom Ashbrook       |       14595.6 |
| AB-10105      | Adrian Barton      |       14473.6 |
| KL-16645      | Ken Lonsdale       |       14175.2 |
| SC-20095      | Sanjit Chand       |       14142.3 |
| HL-15040      | Hunter Lopez       |       12873.3 |
| SE-20110      | Sanjit Engle       |       12209.4 |
| CC-12370      | Christopher Conant |       12129.1 |


### Q5: Highest order value per customer (top 10)

| customer_id   | customer_name      |   highest_order_value |
|:--------------|:-------------------|----------------------:|
| SM-20320      | Sean Miller        |              22638.5  |
| TC-20980      | Tamara Chand       |              17500    |
| RB-19360      | Raymond Buch       |              14000    |
| TA-21385      | Tom Ashbrook       |              11200    |
| HL-15040      | Hunter Lopez       |              10500    |
| AB-10105      | Adrian Barton      |               9892.74 |
| SC-20095      | Sanjit Chand       |               9449.95 |
| BS-11365      | Bill Shonely       |               9099.93 |
| SE-20110      | Sanjit Engle       |               8749.95 |
| CC-12370      | Christopher Conant |               8399.98 |