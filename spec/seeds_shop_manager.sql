TRUNCATE TABLE items, orders, items_orders RESTART IDENTITY;

INSERT INTO items (name, price, quantity) VALUES ('Apple', 1, 100);
INSERT INTO items (name, price, quantity) VALUES ('Pork Pie', 3, 20);
INSERT INTO items (name, price, quantity) VALUES ('Cherry Bakewell', 2, 10);
INSERT INTO items (name, price, quantity) VALUES ('Beef Stew', 5, 40);
INSERT INTO items (name, price, quantity) VALUES ('Steamed Vegetables', 1, 100);
INSERT INTO items (name, price, quantity) VALUES ('Mashed Potato', 1, 50);
INSERT INTO items (name, price, quantity) VALUES ('Vegan Lasagna', 4, 50);

INSERT INTO orders (customer, order_date) VALUES ('Jimmy Brownsocks', '1847-01-22');
INSERT INTO orders (customer, order_date) VALUES ('Alicia Timberfoot', '1847-01-24');
INSERT INTO orders (customer, order_date) VALUES ('Kyle', '1847-01-29');
INSERT INTO orders (customer, order_date) VALUES ('Sir Thomas III', '1847-02-04');
INSERT INTO orders (customer, order_date) VALUES ('Princess Violet', '1847-03-06');
INSERT INTO orders (customer, order_date) VALUES ('Jimmy Brownsocks', '1847-06-13');

INSERT INTO items_orders (item_id, order_id) VALUES (1, 1);
INSERT INTO items_orders (item_id, order_id) VALUES (1, 2);
INSERT INTO items_orders (item_id, order_id) VALUES (1, 3);
INSERT INTO items_orders (item_id, order_id) VALUES (1, 6);
INSERT INTO items_orders (item_id, order_id) VALUES (2, 4);
INSERT INTO items_orders (item_id, order_id) VALUES (2, 5);
INSERT INTO items_orders (item_id, order_id) VALUES (3, 6);
INSERT INTO items_orders (item_id, order_id) VALUES (4, 4);
INSERT INTO items_orders (item_id, order_id) VALUES (5, 2);
INSERT INTO items_orders (item_id, order_id) VALUES (5, 3);
INSERT INTO items_orders (item_id, order_id) VALUES (5, 5);
INSERT INTO items_orders (item_id, order_id) VALUES (6, 3);
INSERT INTO items_orders (item_id, order_id) VALUES (7, 5);