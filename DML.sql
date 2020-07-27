
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