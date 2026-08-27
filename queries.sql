-- =========================================================
-- SQL-Data-Analysis: Analyst Queries
-- Each query below answers a realistic business question and
-- demonstrates a specific SQL skill (joins, aggregation,
-- CTEs, and window functions).
-- =========================================================


-- 1) MONTHLY REVENUE TREND
-- Skill: JOIN + GROUP BY + aggregation
-- Question: How much revenue did we make each month?
SELECT
    DATE_TRUNC('month', o.order_date)                AS month,
    ROUND(SUM(oi.quantity * oi.unit_price), 2)        AS revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY month;


-- 2) TOP 5 BEST-SELLING PRODUCTS BY REVENUE
-- Skill: JOIN + GROUP BY + ORDER BY + LIMIT
-- Question: Which products generate the most revenue?
SELECT
    p.product_name,
    p.category,
    SUM(oi.quantity)                                  AS units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price), 2)         AS revenue
FROM order_items oi
JOIN orders o    ON o.order_id = oi.order_id
JOIN products p  ON p.product_id = oi.product_id
WHERE o.status = 'Completed'
GROUP BY p.product_name, p.category
ORDER BY revenue DESC
LIMIT 5;


-- 3) CUSTOMER RANKING BY TOTAL SPEND
-- Skill: Window function RANK()
-- Question: Who are our highest-value customers?
SELECT
    c.customer_name,
    c.country,
    ROUND(SUM(oi.quantity * oi.unit_price), 2)         AS total_spend,
    RANK() OVER (ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS spend_rank
FROM customers c
JOIN orders o     ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY c.customer_name, c.country;


-- 4) RUNNING TOTAL OF MONTHLY REVENUE
-- Skill: Window function SUM() OVER with ORDER BY
-- Question: What does our cumulative revenue look like over time?
WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', o.order_date)             AS month,
        SUM(oi.quantity * oi.unit_price)              AS revenue
    FROM orders o
    JOIN order_items oi ON oi.order_id = o.order_id
    WHERE o.status = 'Completed'
    GROUP BY DATE_TRUNC('month', o.order_date)
)
SELECT
    month,
    ROUND(revenue, 2)                                  AS revenue,
    ROUND(SUM(revenue) OVER (ORDER BY month), 2)       AS running_total
FROM monthly_revenue
ORDER BY month;


-- 5) REPEAT CUSTOMERS
-- Skill: CTE + HAVING
-- Question: Which customers have placed more than one completed order?
WITH order_counts AS (
    SELECT customer_id, COUNT(*) AS completed_orders
    FROM orders
    WHERE status = 'Completed'
    GROUP BY customer_id
)
SELECT
    c.customer_name,
    oc.completed_orders
FROM order_counts oc
JOIN customers c ON c.customer_id = oc.customer_id
WHERE oc.completed_orders > 1
ORDER BY oc.completed_orders DESC;


-- 6) MONTH-OVER-MONTH REVENUE GROWTH %
-- Skill: Window function LAG() + CTE
-- Question: How is revenue trending month to month?
WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', o.order_date)             AS month,
        SUM(oi.quantity * oi.unit_price)              AS revenue
    FROM orders o
    JOIN order_items oi ON oi.order_id = o.order_id
    WHERE o.status = 'Completed'
    GROUP BY DATE_TRUNC('month', o.order_date)
)
SELECT
    month,
    ROUND(revenue, 2)                                          AS revenue,
    ROUND(LAG(revenue) OVER (ORDER BY month), 2)               AS prev_month_revenue,
    ROUND(
        100.0 * (revenue - LAG(revenue) OVER (ORDER BY month))
        / LAG(revenue) OVER (ORDER BY month), 1
    )                                                            AS growth_pct
FROM monthly_revenue
ORDER BY month;


-- 7) REVENUE BY COUNTRY
-- Skill: JOIN + GROUP BY across three tables
-- Question: Which markets should we prioritize?
SELECT
    c.country,
    COUNT(DISTINCT c.customer_id)                      AS customers,
    ROUND(SUM(oi.quantity * oi.unit_price), 2)         AS revenue
FROM customers c
JOIN orders o       ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY c.country
ORDER BY revenue DESC;


-- 8) DAYS SINCE EACH CUSTOMER'S LAST ORDER (RFM-lite: Recency)
-- Skill: CTE + window function MAX() OVER
-- Question: Which customers are at risk of going inactive?
WITH last_order AS (
    SELECT
        customer_id,
        MAX(order_date) AS last_order_date
    FROM orders
    WHERE status = 'Completed'
    GROUP BY customer_id
)
SELECT
    c.customer_name,
    lo.last_order_date,
    (DATE '2024-07-01' - lo.last_order_date) AS days_since_last_order
FROM last_order lo
JOIN customers c ON c.customer_id = lo.customer_id
ORDER BY days_since_last_order DESC;



    -- 9) CUSTOMER SEGMENTATION (RFM-LITE)
-- Skill: CTE + business-rule classification (CASE WHEN)
-- Question: Which customers should marketing prioritize with limited budget?
-- Approach: instead of generic quartiles, this uses simple, explainable
-- business rules that a stakeholder can sanity-check at a glance -
-- Recency (days since last order), Frequency (completed orders), and
-- Monetary (total spend) are combined into three actionable segments.
WITH customer_stats AS (
        SELECT
            c.customer_id,
            c.customer_name,
            COUNT(DISTINCT o.order_id)                      AS completed_orders,
            SUM(oi.quantity * oi.unit_price)                AS total_spend,
            MAX(o.order_date)                               AS last_order_date,
            (DATE '2024-07-01' - MAX(o.order_date))         AS days_since_last_order
        FROM customers c
        JOIN orders o        ON o.customer_id = c.customer_id AND o.status = 'Completed'
        JOIN order_items oi  ON oi.order_id = o.order_id
        GROUP BY c.customer_id, c.customer_name
    )
SELECT
    customer_name,
    completed_orders,
    ROUND(total_spend, 2)          AS total_spend,
    days_since_last_order,
    CASE
        WHEN total_spend >= 150 AND completed_orders >= 2 THEN 'Loyal / High-Value'
        WHEN days_since_last_order > 60                    THEN 'At Risk'
        ELSE 'New / Low-Engagement'
    END AS segment
FROM customer_stats
ORDER BY total_spend DESC;
