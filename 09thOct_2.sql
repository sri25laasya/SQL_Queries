create database testdb1;
use testdb1;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    registration_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATETIME,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price_per_unit DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE product_reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    customer_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    review_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (first_name, last_name, email, registration_date) VALUES
('John', 'Doe', 'john.doe@example.com', '2023-01-15'),
('Jane', 'Smith', 'jane.smith@example.com', '2023-02-20'),
('Alice', 'Johnson', 'alice.johnson@example.com', '2023-03-05'),
('Bob', 'Williams', 'bob.williams@example.com', '2023-04-10'),
('Charlie', 'Brown', 'charlie.brown@example.com', '2023-05-12'),
('David', 'Jones', 'david.jones@example.com', '2023-06-25'),
('Eva', 'Garcia', 'eva.garcia@example.com', '2023-07-30'),
('Frank', 'Martinez', 'frank.martinez@example.com', '2023-08-15'),
('Grace', 'Davis', 'grace.davis@example.com', '2023-09-01'),
('Henry', 'Miller', 'henry.miller@example.com', '2023-09-10'),
('Isabella', 'Hernandez', 'isabella.hernandez@example.com', '2023-09-15'),
('Jack', 'Moore', 'jack.moore@example.com', '2023-09-20'),
('Kathy', 'Taylor', 'kathy.taylor@example.com', '2023-09-25'),
('Liam', 'Wilson', 'liam.wilson@example.com', '2023-09-30'),
('Mia', 'Anderson', 'mia.anderson@example.com', '2023-10-01'),
('Noah', 'Thomas', 'noah.thomas@example.com', '2023-10-02'),
('Olivia', 'Jackson', 'olivia.jackson@example.com', '2023-10-05'),
('Paul', 'White', 'paul.white@example.com', '2023-10-07'),
('Quinn', 'Harris', 'quinn.harris@example.com', '2023-10-08'),
('Rita', 'Clark', 'rita.clark@example.com', '2023-10-09');


INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Laptop', 'Electronics', 999.99, 50),
('Smartphone', 'Electronics', 599.99, 150),
('Tablet', 'Electronics', 399.99, 60),
('Headphones', 'Electronics', 149.99, 75),
('Monitor', 'Electronics', 299.99, 40),
('Printer', 'Electronics', 199.99, 25),
('Coffee Maker', 'Home Appliances', 89.99, 30),
('Blender', 'Home Appliances', 59.99, 20),
('Desk', 'Furniture', 249.99, 20),
('Chair', 'Furniture', 149.99, 45),
('Bookshelf', 'Furniture', 199.99, 15),
('Notebook', 'Stationery', 4.99, 200),
('Pen', 'Stationery', 1.99, 300),
('Eraser', 'Stationery', 0.99, 150),
('Backpack', 'Accessories', 39.99, 100),
('Camera', 'Electronics', 799.99, 10),
('Smartwatch', 'Electronics', 249.99, 70),
('Wireless Charger', 'Accessories', 29.99, 200),
('Bluetooth Speaker', 'Electronics', 59.99, 100),
('Gaming Console', 'Electronics', 499.99, 30);


INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2023-01-16 10:00:00', 999.99),
(2, '2023-02-21 11:30:00', 599.99),
(3, '2023-03-06 12:15:00', 399.99),
(4, '2023-04-11 14:00:00', 149.99),
(5, '2023-05-13 09:45:00', 89.99),
(6, '2023-06-26 10:15:00', 59.99),
(7, '2023-07-31 15:30:00', 299.99),
(8, '2023-08-16 10:30:00', 199.99),
(9, '2023-09-02 14:20:00', 249.99),
(10, '2023-09-11 16:45:00', 149.99),
(11, '2023-09-16 09:00:00', 399.99),
(12, '2023-09-21 13:30:00', 249.99),
(13, '2023-09-26 12:05:00', 59.99),
(14, '2023-09-27 14:15:00', 89.99),
(15, '2023-09-29 10:00:00', 19.99),
(16, '2023-10-01 11:20:00', 299.99),
(17, '2023-10-03 12:30:00', 499.99),
(18, '2023-10-04 13:10:00', 149.99),
(19, '2023-10-06 14:00:00', 59.99),
(20, '2023-10-08 15:00:00', 499.99);

INSERT INTO order_items (order_id, product_id, quantity, price_per_unit) VALUES
(1, 1, 1, 999.99),
(2, 2, 1, 599.99),
(3, 3, 1, 399.99),
(4, 4, 2, 74.99),
(5, 5, 1, 89.99),
(6, 6, 1, 59.99),
(7, 7, 3, 199.99),
(8, 8, 2, 99.99),
(9, 9, 1, 249.99),
(10, 10, 1, 149.99),
(11, 11, 1, 399.99),
(12, 12, 2, 124.99),
(13, 13, 1, 59.99),
(14, 14, 1, 89.99),
(15, 15, 1, 19.99),
(16, 16, 1, 299.99),
(17, 17, 1, 499.99),
(18, 18, 2, 119.99),
(19, 19, 3, 59.99),
(20, 20, 2, 99.99);


INSERT INTO product_reviews (product_id, customer_id, rating, review_text, review_date) VALUES
(1, 1, 5, 'Excellent laptop, very powerful.', '2023-01-17'),
(2, 2, 4, 'Great smartphone, very user-friendly.', '2023-02-22'),
(3, 3, 3, 'Good tablet but a bit pricey.', '2023-03-07'),
(4, 4, 4, 'Coffee maker works well, easy to use.', '2023-04-12'),
(5, 5, 5, 'Headphones have great sound quality.', '2023-05-14'),
(6, 6, 5, 'Printer is fast and reliable.', '2023-06-27'),
(7, 7, 3, 'Desk is sturdy, but hard to assemble.', '2023-07-31'),
(8, 8, 4, 'Chair is comfortable for long hours.', '2023-08-17'),
(9, 9, 2, 'Monitor is bright and clear.', '2023-09-03'),
(10, 10, 4, 'Nice quality Bluetooth speaker.', '2023-09-12'),
(11, 11, 5, 'Smartwatch is very helpful.', '2023-09-17'),
(12, 12, 3, 'Gaming console has great graphics.', '2023-09-22'),
(13, 13, 4, 'Backpack is spacious and stylish.', '2023-09-27'),
(14, 14, 2, 'Camera quality is average.', '2023-09-28'),
(15, 15, 5, 'E-reader is fantastic for books.', '2023-10-02'),
(16, 16, 4, 'Wireless charger is convenient.', '2023-10-04'),
(17, 17, 5, 'Blender works like a charm.', '2023-10-05'),
(18, 18, 4, 'Great quality skincare set.', '2023-10-06'),
(19, 19, 3, 'Good but not great dumbbells.', '2023-10-07'),
(20, 20, 4, 'Nice ergonomic chair.', '2023-10-09');


SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT * FROM product_reviews;
