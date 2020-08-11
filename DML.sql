-- B) INSERT INTO queries to get ready to populate the tables
------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Customers (email, firstName, lastName, address, dob, phone, city, state, zipcode) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s);

INSERT INTO Orders (customerID, productID, dateOrdered, dateDelivered, totalPrice) VALUES (%s,%s,%s,%s,%s);

INSERT INTO Products (productName, brandName, price, category, sale, color) VALUES (%s,%s,%s,%s,%s,%s);

INSERT INTO Stores (address, city, state, daysOpen, hours) VALUES (%s,%s,%s,%s,%s);
------------------------------------------------------------------------------------------------------------------------------------------------------
-- SELECT STATEMENTS to view all of the entries via View Orders/Customers/Stores/Products button
-- For "View Orders" button
SELECT orderID, customerID, productID, dateOrdered, dateDelivered, totalPrice FROM Orders;

SELECT productID, productName, brandName, price, category, sale, color FROM Products;

SELECT customerID, email, firstName, lastName, address, dob, phone, city, state, zipcode FROM Customers;

SELECT storeID, address, city, state, daysOpen, hours FROM Stores;
------------------------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE Statements to update orders/customers/stores/prducts
-- For edit Customers buttons
UPDATE Customers SET email = %s, firstName = %s, lastName = %s, address = %s, dob = %s, phone = %s, city = %s, state = %s, zipcode = %s WHERE customerID = %s;

-- For edit Orders buttons
UPDATE Orders SET customerID = %s, productID = %s, dateOrdered = %s, dateDelivered = %s, totalPrice = %s WHERE orderID = %s;

-- For edit Products buttons
UPDATE Products SET productName = %s, brandName = %s, price = %s, category = %s, sale = %s, color = %s WHERE productID = %s;

-- For edit Stores buttons
UPDATE Stores SET address = %s, city = %s, state = %s, daysOpen = %s, hours = %s WHERE storeID = %s;

--For edit Order_Products button
UPDATE Order_Products SET productID = %s WHERE orderID = %s;
------------------------------------------------------------------------------------------------------------------------------------------------------
-- DELETE Statements to update orders/customers/stores/prducts
-- For delete Customers buttons
DELETE FROM Customers WHERE customerID = %s;

-- For delete Orders buttons
DELETE FROM Orders WHERE orderID = %s;

-- For delete Products buttons
DELETE FROM Products WHERE productID = %s;

-- for delete Stores buttons
DELETE FROM Stores WHERE storeID = %s;