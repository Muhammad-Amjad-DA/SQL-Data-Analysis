# SQL Data Analysis Portfolio Project

A self-contained SQL project built to demonstrate practical data-analyst skills: relational schema design, data modeling, and writing analyst-style queries that answer real business questions.

## Business Scenario

The project simulates a small online retail store. Customers place orders, each order contains one or more line items, and each line item references a product. The goal is to use SQL to answer common questions a data analyst would be asked: revenue trends, best-selling products, customer value, retention, and market performance.

## Files

| File | Purpose |
|---|---|
| `schema.sql` | Creates the four tables (`customers`, `products`, `orders`, `order_items`) with primary/foreign keys |
| `sample_data.sql` | Inserts a small, hand-crafted dataset (10 customers, 8 products, 20 orders, 30 line items) so every query result can be verified by eye |
| `queries.sql` | 9 commented analyst queries, each framed as a business question |

## Entity Relationship

```
customers 1---* orders 1---* order_items *---1 products
```

## Skills Demonstrated

This project demonstrates: multi-table joins across two to three tables; aggregation with GROUP BY using SUM, COUNT, and ROUND; common table expressions (CTEs) that break complex logic into readable steps; window functions including RANK(), LAG(), SUM() OVER, and MAX() OVER; filtering with WHERE and HAVING; business-rule customer segmentation using CASE WHEN; and business-oriented query design that frames SQL around real questions rather than just syntax.

## Example Questions Answered in queries.sql

Q1: How much revenue did we make each month?

Q2: Which products generate the most revenue?

Q3: Who are our highest-value customers?

Q4: What does our cumulative revenue look like over time?

Q5: Which customers have placed more than one completed order?

Q6: How is revenue trending month over month (growth percent)?

Q7: Which countries and markets should we prioritize?

Q8: Which customers are at risk of going inactive (recency)?

Q9: Which customers should marketing prioritize with a limited budget?

## Case Study: Who Should We Prioritize With a Limited Retention Budget?

This is the part of the project I spent the most time on, because it is the closest thing to what an analyst actually gets asked to do. Instead of stopping at raw revenue totals, I used query 9 to split all 10 customers into three groups based on how recently they ordered, how often, and how much they spent.

The result surprised me a little: only 4 of the 10 customers, Alice Johnson, Bob Smith, Ethan Brown, and George Wilson, qualified as Loyal / High-Value, but together they account for 1021.78 dollars of the 1383.62 dollars in total revenue, or about 74 percent. On the other side, three customers, Carlos Diaz, Hana Suzuki, and Ivan Petrov, have not ordered in over 60 days. Carlos has not ordered since January, 164 days of silence by the end of the sample period.

If I were handing this to a marketing team with a limited retention budget, I would tell them to spend it re-engaging the At Risk group before those customers are lost for good, protect the Loyal group with a lighter-touch loyalty perk since they already drive most of the revenue, and send the New / Low-Engagement group (Diana Chen, Fatima Khan, Julia Novak) a simple onboarding follow-up rather than a discount, since they are too new to call at risk but have not shown repeat behavior yet.

None of this needed machine learning, just SQL, some business judgment about what at risk means for this kind of store, and a willingness to turn a query result into an actual recommendation. That is the habit I am trying to build.

## How to Run

Step 1: Create a new database in PostgreSQL (queries use DATE_TRUNC, which is Postgres syntax; MySQL users can substitute DATE_FORMAT).

Step 2: Run schema.sql to create the tables.

Step 3: Run sample_data.sql to load the sample dataset.

Step 4: Run any query from queries.sql to see the results.

## Tools

SQL (PostgreSQL syntax), relational database design.

## Author

Muhammad Amjad - Data Analyst focused on SQL, Power BI, and Excel. See my [profile](https://github.com/Muhammad-Amjad-DA) for more projects.
 
 
 
 
