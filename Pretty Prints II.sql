USE prints;
SELECT customer_name, customer_add, customer_city, customer_state, customer_zip
FROM customers;

USE prints;
SELECT customer_name, customer_phone
FROM customers
WHERE customer_state = 'GA';

USE prints;
SELECT customer_name, customer_zip
FROM customers
WHERE customer_state = 'NC' OR customer_state = 'SC';

USE prints;
SELECT Title, artist, order_date, ship_date
FROM orders, items, orderline
WHERE items.item_id = orderline. item_id AND orderline.order_id = orders.order_id;

USE prints;
SELECT item_id, Title, artist, unit_price, on_hand
FROM items
ORDER BY unit_price ASC;

USE prints;
SELECT item_id, Title, artist, unit_price, on_hand
FROM items
WHERE unit_price > 100;

USE prints;
SELECT item_id, Title, artist, unit_price, on_hand
FROM items
WHERE on_hand > 300;

USE prints;
SELECT Title, unit_price, unit_price * 2 AS retail_price
FROM items;

USE prints;
SELECT customer_name, customer_phone
FROM customers, orders
WHERE order_date LIKE '2014-__-__' AND orders.customer_id = customers.customer_id;

USE prints;
SELECT customer_name, SUM(orderline.order_qty) AS items_sold
FROM customers, orders, orderline
WHERE customers.customer_id = orders.customer_id AND orders.order_id = orderline.order_id
GROUP BY orders.customer_id;

USE prints;
SELECT Title
FROM items
WHERE unit_price BETWEEN 40 AND 100;

USE prints;
SELECT customer_name, Title, artist, SUM(orderline.order_qty) AS quantity
FROM customers, orders, orderline, items
WHERE customers.customer_id = orders.customer_id AND orders.order_id = orderline.order_id AND orderline.item_id = items.item_id
GROUP BY orders.customer_id;

USE prints;
SELECT customer_name, SUM((unit_price * 2) * order_qty) AS revenue
FROM customers, items, orders, orderline
WHERE customers.customer_id = orders.customer_id AND orders.order_id = orderline.order_id AND orderline.item_id = items.item_id
GROUP BY orders.customer_id;

USE prints;
SELECT DISTINCT customer_state, COUNT(*) AS num_customers
FROM customers
GROUP BY customer_state;