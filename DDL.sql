-- Queries for the LAX4U website


-- A) Data Definition Queries

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (
	customerID INT NOT NULL AUTO_INCREMENT,
	orderID INT NOT NULL,
	email varchar(255) NOT NULL,
	firstName varchar(255) NOT NULL,
	lastName varchar(255) NOT NULL,
	address varchar(255) NOT NULL,
	dob DATE,
	phone int,
	city varchar(55),
	state varchar(55),
	zipcode varchar(9),
	PRIMARY KEY (customerID),
	UNIQUE (customerID)
);

INSERT INTO Customers (customerID, orderID, email, firstName, lastName, address, dob, phone, city, state, zipcode)
VALUES (1, 2, "sicklaxcoach@gmail.com", "Cody", "Langvin", "405 121st Ave", 03/14/1992, 5419783623, "Bend", "Oregon", "97703");

INSERT INTO Orders (orderID, customerID, dateOrdered, dateDelivered, totalPrice)
VALUES (1, 2, 06/29/2020, 07/02/2020, 204.99);


DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
	orderID INT NOT NULL AUTO_INCREMENT,
	customerID INT NOT NULL,
	productID INT NOT NULL,
	dateOrdered DATE NOT NULL,
	dateDelivered DATE NOT NULL,
	totalPrice decimal(10,2) NOT NULL,
	PRIMARY KEY (orderID),
	UNIQUE (orderID, productID)
);

DROP TABLE IF EXISTS Customer_Orders;
CREATE TABLE Customer_Orders (
	customerID INT NOT NULL,
	orderID INT NOT NULL
);

ALTER TABLE Customer_Orders ADD FOREIGN KEY (customerID) REFERENCES Customers(customerID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Customer_Orders ADD FOREIGN KEY (orderID) REFERENCES Orders(orderID) ON UPDATE CASCADE ON DELETE CASCADE;


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

DROP TABLE IF EXISTS Order_Products;
CREATE TABLE Order_Products (
	productID INT NOT NULL,
	orderID INT NOT NULL
);

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

INSERT INTO Stores (storeID, city, state, address, hours, daysOpen) VALUES (1, "125 Spooner St", "Portland", "Oregon", "Monday-Sunday", "10am-8pm");

ALTER TABLE Customers ADD FOREIGN KEY (orderID) REFERENCES Orders(orderID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Orders ADD FOREIGN KEY (customerID) REFERENCES Customers(customerID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Orders ADD FOREIGN KEY (productID) REFERENCES Products(productID) ON UPDATE CASCADE ON DELETE CASCADE;
--ALTER TABLE Order_Products ADD FOREIGN KEY (productID) REFERENCES Products(productID) ON UPDATE CASCADE ON DELETE CASCADE;
--ALTER TABLE Order_Products ADD FOREIGN KEY (orderID) REFERENCES Orders(orderID) ON UPDATE CASCADE ON DELETE CASCADE;

