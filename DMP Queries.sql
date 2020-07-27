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
	FOREIGN KEY (orderID) REFERENCES Orders(orderID) ON UPDATE CASCADE ON DELETE CASCADE,
	UNIQUE (customerID)
);
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
	orderID INT NOT NULL AUTO_INCREMENT,
	customerID INT NOT NULL,
	productID INT NOT NULL,
	dateOrdered DATE NOT NULL,
	dateDelivered DATE NOT NULL,
	totalPrice decimal(10,2) NOT NULL,
	PRIMARY KEY (orderID),
	UNIQUE (orderID, productID),
	FOREIGN KEY (customerID) REFERENCES Customers(customerID) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (productID) REFERENCES Products(productID) ON UPDATE CASCADE ON DELETE CASCADE,
);

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

-- The Foreign Keys for this table do not get inserted. To create this table, take the FOREIGN KEY lines out,
-- enter the CREATE TABLE query, then use ALTER TABLE command to add the FOREIGN KEYS.
DROP TABLE IF EXISTS Order_Products;
CREATE TABLE Order_Products (
	productID INT NOT NULL,
	orderID INT NOT NULL
	FOREIGN KEY (productID) REFERENCES Products(productID) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (orderID) REFERENCES Orders(orderID) ON UPDATE CASCADE ON DELETE CASCADE
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


-- B) INSERT INTO queries to get ready to populate the tables
------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Customers (customerID, orderID, email, firstName, lastName, address, dob, phone, city, state, zipcode)
VALUES (:customerIDInput, :orderIDInput, :emailInput, :firstNameInput, :lastNameInput, :addressInput, :dobInput, :phoneInput, :cityInput, :stateInput, :zipcodeInput);

INSERT INTO Orders (orderID, customerID, productID, dateOrdered, dateDelivered, totalPrice)
VALUES (:orderIDInput, :customerIDInput, :productIDInput, :dateOrderedInput, :dateDeliveredInput, :totalPriceInput);

INSERT INTO Products (productID, productName, brandName, price, category, sale, color)
VALUES (:productInput, :productNameInput, :brandNameInput, :priceInput, :categoryInput, :saleInput, :colorInput);

INSERT INTO Stores (storeID, city, state, address, hours, daysOpen)
VALUES (:storeIDInput, :cityInput, :stateInput, :addressInput, :hoursInput, :daysOpenInput);
------------------------------------------------------------------------------------------------------------------------------------------------------
-- SELECT STATEMENTS to view all of the entries via View Orders/Customers/Stores/Products button
-- For "View Orders" button
SELECT orderID AS "Order ID", customerID AS "Customer ID", dateOrdered AS "Date Ordered", dateDelivered AS "Date Delivered", totalPrice AS "Total Price" FROM Orders;
-- For "View Products" button
SELECT productID AS "Product ID", productName AS "Product Name", brandName AS "Brand Name", price AS "Price", category AS "Category", sale AS "On Sale", color AS "Color" FROM Products;
-- For "View Customers" button
SELECT customerID AS "Customer ID", orderID AS "Order ID", email AS "Email", firstName AS "First Name", lastName AS "Last Name", address AS "Address", dob AS "DOB", phone AS "Phone", city AS "City", state AS "State", zipcode AS "Zipcode" FROM Customers;
-- For "View Stores" button
SELECT storeID AS "Store ID", city AS "City", state AS "State", address AS "Address", hours AS "Hours", daysOpen AS "Days Open" FROM Stores;
------------------------------------------------------------------------------------------------------------------------------------------------------
-- Need to add remaining queries including: Update (For the edit button), DELETE (For the delete button) and anything else we need for all the tables.

-- Also not sure wtf we supposed to do with the Order_Products table... Confusing since it is a Join Table.