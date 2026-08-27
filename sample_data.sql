-- =========================================================
-- SQL-Data-Analysis: Sample Data
-- Small, hand-crafted dataset so every query result is easy
-- to verify by eye.
-- =========================================================

INSERT INTO customers (customer_id, customer_name, country, signup_date) VALUES
(1, 'Alice Johnson', 'USA', '2023-01-15'),
(2, 'Bob Smith', 'USA', '2023-02-10'),
(3, 'Carlos Diaz', 'Canada', '2023-01-22'),
(4, 'Diana Chen', 'Canada', '2023-03-05'),
(5, 'Ethan Brown', 'UK', '2023-02-18'),
(6, 'Fatima Khan', 'UK', '2023-04-01'),
(7, 'George Wilson', 'Germany', '2023-01-30'),
(8, 'Hana Suzuki', 'Germany', '2023-05-12'),
(9, 'Ivan Petrov', 'USA', '2023-03-20'),
(10, 'Julia Novak', 'Canada', '2023-06-08');

INSERT INTO products (product_id, product_name, category, unit_price) VALUES
(1, 'Wireless Mouse', 'Electronics', 19.99),
(2, 'Mechanical Keyboard', 'Electronics', 59.99),
(3, 'USB-C Hub', 'Electronics', 24.99),
(4, 'Desk Lamp', 'Home', 29.99),
(5, 'Office Chair', 'Home', 149.99),
(6, 'Notebook Set', 'Stationery', 9.99),
(7, 'Water Bottle', 'Lifestyle', 14.99),
(8, 'Backpack', 'Lifestyle', 45.99);

INSERT INTO orders (order_id, customer_id, order_date, status) VALUES
(1, 1, '2024-01-05', 'Completed'),
(2, 2, '2024-01-12', 'Completed'),
(3, 3, '2024-01-18', 'Completed'),
(4, 1, '2024-02-02', 'Completed'),
(5, 4, '2024-02-14', 'Cancelled'),
(6, 5, '2024-02-20', 'Completed'),
(7, 6, '2024-03-01', 'Completed'),
(8, 2, '2024-03-10', 'Completed'),
(9, 7, '2024-03-15', 'Completed'),
(10, 3, '2024-03-25', 'Refunded'),
(11, 8, '2024-04-02', 'Completed'),
(12, 1, '2024-04-11', 'Completed'),
(13, 9, '2024-04-19', 'Completed'),
(14, 4, '2024-05-03', 'Completed'),
(15, 5, '2024-05-14', 'Completed'),
(16, 10, '2024-05-22', 'Completed'),
(17, 2, '2024-06-01', 'Completed'),
(18, 6, '2024-06-09', 'Completed'),
(19, 7, '2024-06-15', 'Completed'),
(20, 1, '2024-06-28', 'Completed');

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1, 19.99),
(2, 1, 3, 2, 24.99),
(3, 2, 2, 1, 59.99),
(4, 3, 4, 1, 29.99),
(5, 3, 6, 3, 9.99),
(6, 4, 5, 1, 149.99),
(7, 5, 7, 2, 14.99),
(8, 6, 1, 1, 19.99),
(9, 6, 8, 1, 45.99),
(10, 7, 2, 1, 59.99),
(11, 7, 6, 2, 9.99),
(12, 8, 3, 1, 24.99),
(13, 9, 5, 1, 149.99),
(14, 10, 1, 1, 19.99),
(15, 11, 8, 2, 45.99),
(16, 11, 7, 1, 14.99),
(17, 12, 2, 1, 59.99),
(18, 12, 3, 1, 24.99),
(19, 13, 4, 1, 29.99),
(20, 14, 6, 4, 9.99),
(21, 15, 1, 2, 19.99),
(22, 15, 5, 1, 149.99),
(23, 16, 7, 3, 14.99),
(24, 17, 2, 1, 59.99),
(25, 17, 8, 1, 45.99),
(26, 18, 6, 1, 9.99),
(27, 19, 3, 2, 24.99),
(28, 20, 1, 1, 19.99),
(29, 20, 4, 1, 29.99),
(30, 20, 6, 2, 9.99);
