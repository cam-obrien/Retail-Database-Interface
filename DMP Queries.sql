-- Queries for the LAX4U website


-- A) Data Definition Queries

CREATE TABLE Customers {
	customerID INT NOT NULL AUTO_INCREMENT,
	orderID INT NOT NULL,
	email varchar(320) NOT NULL,
	firstName varchar(255) NOT NULL,
	lastName varchar(255) NOT NULL,
	address varchar(255) NOT NULL,
	dob date,
	city varchar(55),
	state varchar(55),
	zipcode varchar(9)
	PRIMARY KEY (customerID),
	FOREIGN KEY (orderID) REFERENCES Orders(orderID),
	UNIQUE (customerID)
};

CREATE TABLE Orders {
	orderID INT NOT NULL AUTO_INCREMENT,
	customerID INT NOT NULL AUTO_INCREMENT,
	productID INT NOT NULL,
	dateOrdered DATE NOT NULL,
	dateDelivered DATE NOT NULL,
	totalPrice decimal(10,2) NOT NULL,
	PRIMARY KEY (orderID),
	FOREIGN KEY (customerID) REFERENCES CUSTOMERS(customerID),
	FOREIGN KEY (productID) REFERENCES PRODUCTS(productID),
	UNIQUE (orderID, productID)
};


CREATE TABLE Products {
	
}