-- Queries for the LAX4U website
-- A) Data Definition Queries
------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (
	customerID INT NOT NULL AUTO_INCREMENT,
	email varchar(255) NOT NULL,
	firstName varchar(255) NOT NULL,
	lastName varchar(255) NOT NULL,
	address varchar(255) NOT NULL,
	dob DATE,
	phone varchar(255),
	city varchar(55),
	state varchar(55),
	zipcode varchar(9),
	PRIMARY KEY (customerID),
	UNIQUE (customerID)
);
-- Customers dump
INSERT INTO Customers (customerID, email, firstName, lastName, address, dob, phone, city, state, zipcode)
VALUES (1, "sicklaxcoach@gmail.com", "Cody", "Langvin", "405 121st Ave", "1992/03/14", "5419783623", "Bend", "Oregon", "97703");

INSERT INTO Customers (customerID, email, firstName, lastName, address, dob, phone, city, state, zipcode)
VALUES (2, "paulrabil99@gmail.com", "Paul", "Rabil", "205 NW Cheddar St", "1985/12/14", "4205301297", "Prideville", "Maryland", "23005");

INSERT INTO Customers (customerID, email, firstName, lastName, address, dob, phone, city, state, zipcode)
VALUES (3, "tanzman@gmail.com", "Johnathan", "Tanz", "190 SE Yardsale Ln", "1998/04/20", "5032031027", "Bend", "Oregon", "97703");
------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------
-- Orders table
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
	orderID INT NOT NULL AUTO_INCREMENT,
	customerID INT,
	dateOrdered DATE NOT NULL,
	dateDelivered DATE NOT NULL,
	totalPrice decimal(10,2) NOT NULL,
	PRIMARY KEY (orderID)
);
-- Orders Dump
INSERT INTO Orders (orderID, customerID, dateOrdered, dateDelivered, totalPrice)
VALUES (1, 2, "2020/06/29", "2020/07/02", 204.99);

INSERT INTO Orders (orderID, customerID, dateOrdered, dateDelivered, totalPrice)
VALUES (2, 1, "2020/07/03", "2020/07/06", 109.99);

INSERT INTO Orders (orderID, customerID, dateOrdered, dateDelivered, totalPrice)
VALUES (3, 3, "2020/07/08", "2020/07/13", 204.99);
------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------
-- Products table
DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
	productID INT NOT NULL AUTO_INCREMENT,
	productName varchar(255) NOT NULL,
	brandName varchar(255) NOT NULL,
	price decimal(10,2) NOT NULL,
	category varchar(255),
	sale bool NOT NULL,
	color varchar(255) NOT NULL,
	PRIMARY KEY (productID)
);
-- Dump for Products table
INSERT INTO Products (productID, productName, brandName, price, category, sale, color) VALUES (1, "Lacrosse Stick", "STX", 149.99, "Equipment", False, "Silver/Black");
INSERT INTO Products (productID, productName, brandName, price, category, sale, color) VALUES (2, "T-Shirt", "Nike", 24.99, "Apparel", False, "Royal Blue");
INSERT INTO Products (productID, productName, brandName, price, category, sale, color) VALUES (3, "Cascade S Helmet", "Cascade", 289.99, "Equipment", False, "Matte Grey");
------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------
-- Order_Products table (Join table for Orders and Products)
DROP TABLE IF EXISTS Order_Products;
CREATE TABLE Order_Products (
	productID INT NOT NULL,
	orderID INT NOT NULL
);
-- Dump for Order_Products
INSERT INTO Order_Products (orderID, productID) VALUES (1, 2);
INSERT INTO Order_Products (orderID, productID) VALUES (2, 1);
INSERT INTO Order_Products (orderID, productID) VALUES (3, 3);
------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------
-- Stores table
DROP TABLE IF EXISTS Stores;
CREATE TABLE Stores (
	storeID INT NOT NULL AUTO_INCREMENT,
	city varchar(255) NOT NULL,
	state varchar(255) NOT NULL,
	address varchar(255) NOT NULL,
	hours varchar(255) NOT NULL,
	daysOpen varchar(255) NOT NULL,
	PRIMARY KEY (storeID)
);
-- Stores dump
INSERT INTO Stores (storeID, city, state, address, hours, daysOpen) VALUES (1, "125 Spooner St", "Portland", "Oregon", "Monday-Sunday", "10am-8pm");
------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------

-- Foreign keys for above tables
ALTER TABLE Orders ADD FOREIGN KEY (customerID) REFERENCES Customers(customerID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Orders ADD FOREIGN KEY (productID) REFERENCES Products(productID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Order_Products ADD FOREIGN KEY (productID) REFERENCES Products(productID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Order_Products ADD FOREIGN KEY (orderID) REFERENCES Orders(orderID) ON UPDATE CASCADE ON DELETE CASCADE;