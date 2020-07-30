-- B) INSERT INTO queries to get ready to populate the tables
------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Customers (customerID, email, firstName, lastName, address, dob, phone, city, state, zipcode)
VALUES (:customerIDInput, :emailInput, :firstNameInput, :lastNameInput, :addressInput, :dobInput, :phoneInput, :cityInput, :stateInput, :zipcodeInput);

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
SELECT customerID AS "Customer ID", email AS "Email", firstName AS "First Name", lastName AS "Last Name", address AS "Address", dob AS "DOB", phone AS "Phone", city AS "City", state AS "State", zipcode AS "Zipcode" FROM Customers;
-- For "View Stores" button
SELECT storeID AS "Store ID", city AS "City", state AS "State", address AS "Address", hours AS "Hours", daysOpen AS "Days Open" FROM Stores;
------------------------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE Statements to update orders/customers/stores/prducts
-- For edit Customers buttons
UPDATE Customers;
SET customerID = :customerIDInput, email = :emailInput, firstName = :firstNameInput, lastName = :lastNameInput, address = :addressInput, dob = :dobInput, phone = :phoneInput, city = :cityInput, state = :stateInput, zipcode = :zipcodeInput;
WHERE customerID = :selectedCustomerID;

-- For edit Orders buttons
UPDATE Orders;
SET orderID = :orderIDInput, customerID = :customerIDInput, productID = :productIDInput, dateOrdered = :dateOrderedInput, dateDelivered = :dateDeliveredInput, totalPrice = :totalPriceInput;
WHERE orderID = :selectedOrderID;

-- For edit Products buttons
UPDATE Products;
SET productID = :productIDInput, productName = :productNameInput, brandName = :brandNameInput, price = :priceInput, category = :categoryInput, sale = :saleInput, color = :colorInput;
WHERE productID = :selectedProductID;

-- For edit Stores buttons
UPDATE Stores;
SET storeID = :storeIDInput, city = :cityInput, state = :stateInput, address = :addressInput, hours = :hoursInput, daysOpen = :daysOpenInput;
WHERE storeID = :selectedStoreID;

------------------------------------------------------------------------------------------------------------------------------------------------------
-- DELETE Statements to update orders/customers/stores/prducts
-- For delete Customers buttons
DELETE FROM Customers WHERE customerID = :selectedCustomerID;

-- For delete Orders buttons
DELETE FROM Orders WHERE orderID = :selectedOrderID;

-- For delete Products buttons
DELETE FROM Products WHERE productID = :selectedProductID;

-- for delete Stores buttons
DELETE FROM Stores WHERE storeID = :selectedStoreID;