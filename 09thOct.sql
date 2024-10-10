create database NormalForms;
use NormalForms;
-- 1st Normal Form
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    CustomerEmail VARCHAR(100),
    OrderDate DATE,
    ShippingAddress VARCHAR(200)
);

INSERT INTO Orders (OrderID, CustomerName, CustomerEmail, OrderDate, ShippingAddress)
VALUES
    (1, 'John Doe', 'johndoe@example.com', '2024-01-15', '123 Elm Street, Cityville'),
    (2, 'Jane Smith', 'janesmith@example.com', '2024-01-16', '456 Oak Avenue, Townsville'),
    (3, 'Bob Johnson', 'bobjohnson@example.com', '2024-01-17', '789 Maple Road, Villagetown'),
    (4, 'Alice Brown', 'alicebrown@example.com', '2024-01-18', '101 Birch Lane, Hamletville'),
    (5, 'Chris White', 'chriswhite@example.com', '2024-01-19', '202 Pine Street, Metropolis'),
    (6, 'Emily Green', 'emilygreen@example.com', '2024-01-20', '303 Cedar Boulevard, Big City'),
    (7, 'Frank Black', 'frankblack@example.com', '2024-01-21', '404 Spruce Circle, Smalltown'),
    (8, 'Grace Blue', 'graceblue@example.com', '2024-01-22', '505 Redwood Drive, Forestville'),
    (9, 'Henry Yellow', 'henryyellow@example.com', '2024-01-23', '606 Cypress Way, Littletown'),
    (10, 'Ivy Orange', 'ivyorange@example.com', '2024-01-24', '707 Palm Street, Oceanview'),
    (11, 'Jack Purple', 'jackpurple@example.com', '2024-01-25', '808 Fir Avenue, Rivertown'),
    (12, 'Karen Red', 'karenred@example.com', '2024-01-26', '909 Ash Court, Mountaintown'),
    (13, 'Leo Silver', 'leosilver@example.com', '2024-01-27', '1010 Bamboo Street, Laketown'),
    (14, 'Mia Gold', 'miagold@example.com', '2024-01-28', '1111 Chestnut Road, Desertville'),
    (15, 'Nathan Gray', 'nathangray@example.com', '2024-01-29', '1212 Mahogany Lane, Hillcity'),
    (16, 'Olivia Pink', 'oliviapink@example.com', '2024-01-30', '1313 Redwood Avenue, Riverdale'),
    (17, 'Peter Blue', 'peterblue@example.com', '2024-02-01', '1414 Birch Boulevard, Valleytown'),
    (18, 'Quinn Violet', 'quinnviolet@example.com', '2024-02-02', '1515 Spruce Circle, Mountcity'),
    (19, 'Rachel Indigo', 'rachelindigo@example.com', '2024-02-03', '1616 Palm Street, Oceantown'),
    (20, 'Sam Silver', 'samsilver@example.com', '2024-02-04', '1717 Cedar Way, Sunsettown');

select * from orders;


CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    BookTitle VARCHAR(200),
    Author VARCHAR(100),
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- 2nd Normal Form
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    BookTitle VARCHAR(200),
    Author VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Books (BookID, BookTitle, Author, Price)
VALUES
    (1, 'To Kill a Mockingbird', 'Harper Lee', 10.99),
    (2, '1984', 'George Orwell', 8.99),
    (3, 'The Great Gatsby', 'F. Scott Fitzgerald', 12.49),
    (4, 'Pride and Prejudice', 'Jane Austen', 9.75),
    (5, 'The Catcher in the Rye', 'J.D. Salinger', 11.50),
    (6, 'Moby Dick', 'Herman Melville', 13.30),
    (7, 'War and Peace', 'Leo Tolstoy', 14.00),
    (8, 'The Odyssey', 'Homer', 7.25),
    (9, 'The Hobbit', 'J.R.R. Tolkien', 10.00),
    (10, 'Brave New World', 'Aldous Huxley', 8.50),
    (11, 'The Lord of the Rings', 'J.R.R. Tolkien', 15.99),
    (12, 'Crime and Punishment', 'Fyodor Dostoevsky', 9.99),
    (13, 'The Brothers Karamazov', 'Fyodor Dostoevsky', 10.99),
    (14, 'Frankenstein', 'Mary Shelley', 6.99),
    (15, 'The Picture of Dorian Gray', 'Oscar Wilde', 8.49),
    (16, 'Dracula', 'Bram Stoker', 7.99),
    (17, 'Les Misérables', 'Victor Hugo', 14.75),
    (18, 'Wuthering Heights', 'Emily Brontë', 9.99),
    (19, 'The Divine Comedy', 'Dante Alighieri', 11.25),
    (20, 'The Iliad', 'Homer', 8.75);

SELECT * FROM bOOKS;
drop table OrderDetails;
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    BookID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO OrderDetails (OrderDetailID, OrderID, BookID, Quantity)
VALUES
    (1, 1, 1, 2),  -- Order 1 contains 2 copies of Book 1
    (2, 1, 3, 1),  -- Order 1 contains 1 copy of Book 3
    (3, 2, 2, 3),  -- Order 2 contains 3 copies of Book 2
    (4, 3, 4, 1),  -- Order 3 contains 1 copy of Book 4
    (5, 4, 5, 4),  -- Order 4 contains 4 copies of Book 5
    (6, 5, 1, 1),  -- Order 5 contains 1 copy of Book 1
    (7, 6, 7, 2),  -- Order 6 contains 2 copies of Book 7
    (8, 7, 9, 1),  -- Order 7 contains 1 copy of Book 9
    (9, 8, 6, 2),  -- Order 8 contains 2 copies of Book 6
    (10, 9, 8, 3); -- Order 9 contains 3 copies of Book 8


-- 3rd Normal Form
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    CustomerEmail VARCHAR(100)
);

INSERT INTO Customers (CustomerID, CustomerName, CustomerEmail)
VALUES
    (1, 'John Doe', 'johndoe@example.com'),
    (2, 'Jane Smith', 'janesmith@example.com'),
    (3, 'Bob Johnson', 'bobjohnson@example.com'),
    (4, 'Alice Brown', 'alicebrown@example.com'),
    (5, 'Chris White', 'chriswhite@example.com'),
    (6, 'Emily Green', 'emilygreen@example.com'),
    (7, 'Frank Black', 'frankblack@example.com'),
    (8, 'Grace Blue', 'graceblue@example.com'),
    (9, 'Henry Yellow', 'henryyellow@example.com'),
    (10, 'Olivia Pink', 'oliviapink@example.com');
SELECT * FROM Customers;
DESCRIBE ORDERS;
ALTER TABLE Orders
ADD CustomerID INT;
DESCRIBE ORDERS;
SET SQL_SAFE_UPDATES = 0;


UPDATE Orders
SET CustomerID = (
    SELECT CustomerID 
    FROM Customers 
    WHERE Orders.CustomerName = Customers.CustomerName 
    AND Orders.CustomerEmail = Customers.CustomerEmail
);
SELECT * FROM ORDERS; 


ALTER TABLE Orders
DROP COLUMN CustomerName,
DROP COLUMN CustomerEmail;

SELECT * FROM ORDERS;
ALTER TABLE Orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);

DESCRIBE Orders;

