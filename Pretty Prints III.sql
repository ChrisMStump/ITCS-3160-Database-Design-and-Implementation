/* 1 */
USE prints;
CREATE VIEW Under_100 AS
SELECT items.item_id, title, artist, unit_price, order_qty
FROM items, orderline
WHERE items.item_id = orderline.item_id AND  unit_price < 100;

/* 2 */
USE prints;
CREATE VIEW Allen AS
SELECT customers.customer_id, customer_name, customer_phone, title, artist
FROM customers, items, orderline, orders
WHERE customers.customer_id = orders.customer_id
AND orders.order_id = orderline.order_id
AND orderline.item_id = items.item_id;

/* 3 */
USE prints;
CREATE VIEW orders_view AS
SELECT orderline.item_id, title, artist, unit_price, order_qty
FROM items, orderline, orders
WHERE items.item_id = orderline.item_id
AND orderline.order_id = orders.order_id
AND order_date BETWEEN '2014-01-01' AND '2014-02-28';

/* 4 */
USE prints;
CREATE VIEW zip_27 AS
SELECT customer_name, customer_phone, title, artist, ship_date
FROM customers, items, orders, orderline
WHERE customers.customer_id = orders.customer_id
AND orders.order_id = orderline.order_id
AND orderline.item_id = items.item_id
AND customer_zip LIKE '27%';

/* 5 */
USE prints;
CREATE INDEX customer_id
ON customers (customer_id);

USE prints;
CREATE INDEX name
ON customers (customer_name);

USE prints;
CREATE INDEX shipped
ON orders (customer_id , ship_date);

/* 6 */
USE prints;
DROP INDEX name ON customers;

/* 7 */
USE prints;
ALTER TABLE items
ADD CHECK (unit_price > 35.00);

/* 8 */
USE prints;
ALTER TABLE orders
ADD FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

USE prints;
CREATE INDEX item_id
ON items (item_id);
ALTER TABLE orderline
ADD FOREIGN KEY (item_id) 
REFERENCES items(item_id);

/* 9 */
USE prints;
ALTER TABLE items
ADD TYPE CHARACTER(1);

/* 10 */
USE prints;
UPDATE items
SET TYPE ='M'
WHERE title = 'Skies Above';

/* 11 */
USE prints;
ALTER TABLE items
MODIFY COLUMN artist CHARACTER(30);

/* 12 */
USE prints;
DROP TABLE orders;