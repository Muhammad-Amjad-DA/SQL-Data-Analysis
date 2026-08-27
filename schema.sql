-- =========================================================
-- SQL-Data-Analysis: Database Schema
-- A small online-retail style database used to demonstrate
-- SQL skills: joins, aggregation, window functions, and CTEs.
-- =========================================================

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- Customers who place orders
CREATE TABLE customers (
      customer_id   INT PRIMARY KEY,
      customer_name VARCHAR(100) NOT NULL,
      country       VARCHAR(50)  NOT NULL,
      signup_date   DATE         NOT NULL
  );

-- Products available for sale
CREATE TABLE products (
      product_id    INT PRIMARY KEY,
      product_name  VARCHAR(100) NOT NULL,
      category      VARCHAR(50)  NOT NULL,
      unit_price    DECIMAL(10,2) NOT NULL
  );

-- One row per order placed by a customer
CREATE TABLE orders (
      order_id      INT PRIMARY KEY,
      customer_id   INT NOT NULL,
      order_date    DATE NOT NULL,
      status        VARCHAR(20) NOT NULL,
      FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
  );

-- Line items belonging to an order (one order can have many items)
CREATE TABLE order_items (
      order_item_id INT PRIMARY KEY,
      order_id      INT NOT NULL,
      product_id    INT NOT NULL,
      quantity      INT NOT NULL,
      unit_price    DECIMAL(10,2) NOT NULL,
      FOREIGN KEY (order_id) REFERENCES orders(order_id),
      FOREIGN KEY (product_id) REFERENCES products(product_id)
  );
