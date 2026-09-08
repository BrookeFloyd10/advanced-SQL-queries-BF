DROP TABLE IF EXISTS post, users;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;

CREATE TABLE customers (
 id INT PRIMARY KEY AUTO_INCREMENT,
 first_name VARCHAR(50),
 last_name VARCHAR(50)
);

CREATE TABLE orders (
 id INT PRIMARY KEY,
 customer_id INT NULL,
 order_date DATE,
 total_amount DECIMAL(10, 2),
 FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO customers (id, first_name, last_name) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Alice', 'Smith'),
(4, 'Bob', 'Brown');

INSERT INTO orders (id, customer_id, order_date, total_amount) VALUES
(1, 1, '2023-01-01', 100.00),
(2, 1, '2023-02-01', 150.00),
(3, 2, '2023-01-01', 200.00),
(4, 3, '2023-04-01', 250.00),
(5, 3, '2023-04-01', 300.00),
(6, NULL, '2023-04-01', 100.00);

SELECT * FROM customers;
SELECT * FROM orders;


-- total amount spent by individual cusomers
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id;


-- total amount spent by customers, but only including those who spent over $200
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > 200;


-- display customer id's along with total number of transactions
SELECT customer_id, COUNT(id) AS all_transactions
FROM orders
GROUP By customer_id;


-- joining 2 tables with left join to all orders with customers first and last name
SELECT orders.id, customers.first_name, customers.last_name, orders.order_date, orders.total_amount
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.id;


-- joining 2 tables wuth inner join to display all the orders with customer's first and last name.
SELECT orders.id, customers.first_name, customers.last_name, orders.order_date, orders.total_amount
FROM orders
INNER JOIN customers ON orders.customer_id = customers.id;


-- using subqueries to display orders of all customers with same last name who's id is in the list of id values
SELECT id, order_date, customer-id, total_amount
FROM orders
WHERE customer_id IN (SELECT id FROM customers WHERE last_name = "Smith");


-- show orders with a total_amount that is > = the ave total_amount of all orders
SELECT id, order_date, total_amount
FROM orders
WHERE total_amount >= (SELECT AVG(total_amount)FROM orders);


-- show all order dates from the orders table
SELECT order_date
FROM (SELECT id, order_date, total_amount FROM orders) AS order_summary;

