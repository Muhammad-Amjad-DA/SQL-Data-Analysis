# SQL Data Analysis Portfolio Project

A self-contained SQL project built to demonstrate practical data-analyst skills: relational schema design, data modeling, and writing analyst-style queries that answer real business questions.

## Business Scenario

The project simulates a small online retail store. Customers place orders, each order contains one or more line items, and each line item references a product. The goal is to use SQL to answer common questions a data analyst would be asked: revenue trends, best-selling products, customer value, retention, and market performance.

## Files

| File | Purpose |
|---|---|
| `schema.sql` | Creates the four tables (`customers`, `products`, `orders`, `order_items`) with primary/foreign keys |
| `sample_data.sql` | Inserts a small, hand-crafted dataset (10 customers, 8 products, 20 orders, 30 line items) so every query result can be verified by eye |
| `queries.sql` | 8 commented analyst queries, each framed as a business question |

## Entity Relationship

```
customers 1---* orders 1---* order_items *---1 products
```

## Skills Demonstrated

This project demonstrates: multi-table joins across two to three tables; aggregation with GROUP BY using SUM, COUNT, and ROUND; common table expressions (CTEs) that break complex logic into readable steps; window functions including RANK(), LAG(), SUM() OVER, and MAX() OVER; filtering with WHERE and HAVING; and business-oriented query design that frames SQL around real questions rather than just syntax.

## Example Questions Answered in queries.sql

Q1: How much revenue did we make each month?

Q2: Which products generate the most revenue?

Q3: Who are our highest-value customers?

Q4: What does our cumulative revenue look like over time?

Q5: Which customers have placed more than one completed order?

Q6: How is revenue trending month over month (growth percent)?

Q7: Which countries and markets should we prioritize?

Q8: Which customers are at risk of going inactive (recency)?

## How to Run

Step 1: Create a new database in PostgreSQL (queries use DATE_TRUNC, which is Postgres syntax; MySQL users can substitute DATE_FORMAT).

Step 2: Run schema.sql to create the tables.

Step 3: Run sample_data.sql to load the sample dataset.

Step 4: Run any query from queries.sql to see the results.

## Tools

SQL (PostgreSQL syntax), relational database design.

## Author

Muhammad Amjad - Data Analyst focused on SQL, Power BI, and Excel. See my [profile](https://github.com/Muhammad-Amjad-DA) for more projects.
