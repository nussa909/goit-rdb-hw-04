use products;

SELECT orders.id, products.name AS product_name, products.price, products.unit, order_details.quantity, categories.name AS category_name,
orders.date, employees.first_name AS employee_first_name, employees.last_name AS employee_last_name, customers.name AS customer_name, shippers.name AS shipper_name
FROM orders
INNER JOIN order_details
ON orders.id = order_details.order_id
INNER JOIN products
ON order_details.product_id = products.id
INNER JOIN employees
ON orders.employee_id = employees.employee_id
INNER JOIN customers
ON orders.customer_id = customers.id
INNER JOIN shippers
ON orders.shipper_id = shippers.id
INNER JOIN categories
ON products.category_id = categories.id;

SELECT COUNT(*)
FROM orders
INNER JOIN order_details
ON orders.id = order_details.order_id
INNER JOIN products
ON order_details.product_id = products.id
INNER JOIN employees
ON orders.employee_id = employees.employee_id
INNER JOIN customers
ON orders.customer_id = customers.id
INNER JOIN shippers
ON orders.shipper_id = shippers.id
INNER JOIN categories
ON products.category_id = categories.id;

SELECT orders.id, products.name AS product_name, products.price, products.unit, order_details.quantity, categories.name AS category_name,  
orders.date,employees.first_name AS employee_first_name, employees.last_name AS employee_last_name, customers.name AS customer_name, shippers.name AS shipper_name
FROM orders
LEFT JOIN order_details
ON orders.id = order_details.order_id
RIGHT JOIN products
ON order_details.product_id = products.id
LEFT JOIN employees
ON orders.employee_id = employees.employee_id
LEFT JOIN customers
ON orders.customer_id = customers.id
LEFT JOIN shippers
ON orders.shipper_id = shippers.id
INNER JOIN categories
ON products.category_id = categories.id;

SELECT COUNT(*)
FROM orders
LEFT JOIN order_details
ON orders.id = order_details.order_id
RIGHT JOIN products
ON order_details.product_id = products.id
LEFT JOIN employees
ON orders.employee_id = employees.employee_id
LEFT JOIN customers
ON orders.customer_id = customers.id
LEFT JOIN shippers
ON orders.shipper_id = shippers.id
RIGHT JOIN categories
ON products.category_id = categories.id;

SELECT COUNT(*)
FROM orders
INNER JOIN order_details
ON orders.id = order_details.order_id
LEFT JOIN products
ON order_details.product_id = products.id
LEFT JOIN employees
ON orders.employee_id = employees.employee_id
RIGHT JOIN customers
ON orders.customer_id = customers.id;
-- LEFT JOIN shippers
-- ON orders.shipper_id = shippers.id
-- RIGHT JOIN categories
-- ON products.category_id = categories.id;

SELECT orders.id, products.name AS product_name, products.price, products.unit, order_details.quantity, categories.name AS category_name,  
orders.date,employees.first_name AS employee_first_name, employees.last_name AS employee_last_name, customers.name AS customer_name, shippers.name AS shipper_name
FROM products
RIGHT JOIN order_details
ON order_details.product_id = products.id
LEFt JOIN orders
ON orders.id = order_details.order_id
LEFT JOIN employees
ON orders.employee_id = employees.employee_id
LEFT JOIN customers
ON orders.customer_id = customers.id
LEFT JOIN shippers
ON orders.shipper_id = shippers.id
INNER JOIN categories
ON products.category_id = categories.id;


SELECT COUNT(*) AS row_count, AVG(order_details.quantity) AS average_quantity
FROM orders
INNER JOIN order_details
ON orders.id = order_details.order_id
INNER JOIN products
ON order_details.product_id = products.id
INNER JOIN employees
ON orders.employee_id = employees.employee_id
INNER JOIN customers
ON orders.customer_id = customers.id
INNER JOIN shippers
ON orders.shipper_id = shippers.id
INNER JOIN categories
ON products.category_id = categories.id
WHERE orders.employee_id > 3 AND orders.employee_id <= 10
GROUP BY categories.name
HAVING average_quantity > 21
ORDER BY row_count DESC
LIMIT 4 OFFSET 1;

