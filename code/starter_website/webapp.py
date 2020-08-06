from flask import Flask, render_template, url_for
from flask import request, redirect
from db_connector.db_connector import connect_to_database, execute_query
#create the web application
webapp = Flask(__name__)


####################################### READ/VIEW FUNCTIONALITY ##############################################
@webapp.route('/')
@webapp.route('/home')
@webapp.route('/index.html')
def index():
    return render_template('index.html')

@webapp.route('/products')
def products():
    print("Fetching and rendering products webpage")
    db_connection = connect_to_database()
    query = "SELECT productID, productName, brandName, price, category, sale, color FROM Products;"
    result = execute_query(db_connection, query).fetchall()
    print(result)
    return render_template('products.html', rows=result)

@webapp.route('/orders')
def orders():
    print("Fetching and rendering orders webpage")
    db_connection = connect_to_database()
    query = "SELECT orderID, customerID, productID, dateOrdered, dateDelivered, totalPrice FROM Orders;"
    result = execute_query(db_connection, query).fetchall()
    print(result)
    return render_template('orders.html', rows=result)

@webapp.route('/customers')
def customers():
    print("Fetching and rendering customers webpage")
    db_connection = connect_to_database()
    query = "SELECT customerID, email, firstName, lastName, address, dob, phone, city, state, zipcode FROM Customers;"
    result = execute_query(db_connection, query).fetchall()
    print(result)
    return render_template('customers.html', rows=result)

@webapp.route('/stores')
def stores():
    print("Fetching and rendering stores webpage")
    db_connection = connect_to_database()
    query = "SELECT storeID, address, city, state, daysOpen, hours FROM Stores;"
    result = execute_query(db_connection, query).fetchall()
    print(result)
    return render_template('stores.html', rows=result)

@webapp.route('/orderProducts')
def orderProducts():
    print("Fetching and rendering orderProducts webpage")
    db_connection = connect_to_database()
    query = "SELECT orderID, productID FROM Order_Products;"
    result = execute_query(db_connection, query).fetchall()

    return render_template('orderProducts.html', rows=result)
####################################### END OF SELECT/READ FUNCTIONALITY ##############################################
####################################### GET/POST FUNCTIONALITY ##############################################
@webapp.route('/modifyProducts', methods=['POST', 'GET'])
def modifyProducts():
    db_connection = connect_to_database()
    if request.method == 'GET':
        query = 'SELECT productID, productName, brandName, price, category, sale, color from Products'
        result = execute_query(db_connection, query).fetchall()
        print(result)
        return render_template('modifyProducts.html', rows = result)
    elif request.method == 'POST':
        print("Add new product!")
        productName = request.form['productName']
        brandName = request.form['brandName']
        price = request.form['price']
        category = request.form['category']
        sale = request.form['sale']
        color = request.form['color']
        query = 'INSERT INTO Products (productName, brandName, price, category, sale, color) VALUES (%s,%s,%s,%s,%s,%s)'
        data = (productName, brandName, price, category, sale, color)
        execute_query(db_connection, query, data)
        return redirect(url_for('products'))

@webapp.route('/modifyOrders', methods=['POST','GET'])
def modifyOrders():
    db_connection = connect_to_database()
    if request.method == 'GET':
        query = 'SELECT orderID, customerID, productID, dateOrdered, dateDelivered, totalPrice from Orders'
        result = execute_query(db_connection, query).fetchall()
        print(result)
        return render_template('modifyOrders.html', rows = result)

    elif request.method == 'POST':
        print("Add new order!")
        customerID = request.form['customerID']
        productID = request.form['productID']
        dateOrdered = request.form['dateOrdered']
        dateDelivered = request.form['dateDelivered']
        totalPrice = request.form['totalPrice']

        query = 'INSERT INTO Orders (customerID, productID, dateOrdered, dateDelivered, totalPrice) VALUES (%s,%s,%s,%s,%s)'
        data = (customerID, productID, dateOrdered, dateDelivered, totalPrice)
        execute_query(db_connection, query, data)
        return redirect(url_for('orders'))

@webapp.route('/modifyCustomers', methods=['POST','GET'])
def modifyCustomers():
    db_connection = connect_to_database()
    if request.method == 'GET':
        query = 'SELECT customerID from Customers'
        result = execute_query(db_connection, query).fetchall()
        print(result)
        return render_template('modifyCustomers.html', rows = result)

    elif request.method == 'POST':
        print("Add new customer")
        email = request.form['email']
        firstName = request.form['firstName']
        lastName = request.form['lastName']
        address = request.form['address']
        dob = request.form['dob']
        phone = request.form['phone']
        city = request.form['city']
        state = request.form['state']
        zipcode = request.form['zipcode']

        query = 'INSERT INTO Customers (email, firstName, lastName, address, dob, phone, city, state, zipcode) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)'
        data = (email, firstName, lastName, address, dob, phone, city, state, zipcode)
        execute_query(db_connection, query, data)
        return redirect(url_for('customers'))

@webapp.route('/modifyStores', methods=['POST','GET'])
def modifyStores():
    db_connection = connect_to_database()
    if request.method == 'GET':
        query = 'SELECT storeID from Stores'
        result = execute_query(db_connection, query).fetchall()
        print(result)
        return render_template('modifyStores.html', rows = result)

    elif request.method == 'POST':
        print("Add new store!")
        address = request.form['address']
        city = request.form['city']
        state = request.form['state']
        daysOpen = request.form['daysOpen']
        hours = request.form['hours']

        query = 'INSERT INTO Stores (address, city, state, daysOpen, hours) VALUES (%s,%s,%s,%s,%s)'
        data = (address, city, state, daysOpen, hours)
        execute_query(db_connection, query, data)
        return redirect(url_for('stores'))

####################################### END OF GET/POST FUNCTIONALITY ################################################
####################################### ALL OF THE DELETE FUNCTIONALITY ##############################################
@webapp.route('/deleteProduct/<int:id>')
def deleteProduct(id):
    db_connection = connect_to_database()
    query = "DELETE FROM Products WHERE productID = %s"
    data = (id,)
    result = execute_query(db_connection, query, data)
    return redirect(url_for('products'))

@webapp.route('/deleteOrder/<int:id>')
def deleteOrder(id):
    db_connection = connect_to_database()
    query = "DELETE FROM Orders WHERE orderID = %s"
    data = (id,)
    result = execute_query(db_connection, query, data)
    return redirect(url_for('orders'))

@webapp.route('/deleteCustomer/<int:id>')
def deleteCustomer(id):
    db_connection = connect_to_database()
    query = "DELETE FROM Customers WHERE customerID = %s"
    data = (id,)
    result = execute_query(db_connection, query, data)
    return redirect(url_for('customers'))

@webapp.route('/deleteStore/<int:id>')
def deleteStore(id):
    db_connection = connect_to_database()
    query = "DELETE FROM Stores WHERE storeID = %s"
    data = (id,)
    result = execute_query(db_connection, query, data)
    return redirect(url_for('stores'))


@webapp.route('/deleteOrders/<int:id>')
def deleteOrders(id):
    db_connection = connect_to_database()
    query = "DELETE FROM Orders WHERE orderID = %s"
    data = (id,)
    result = execute_query(db_connection, query, data)
    return redirect(url_for('orderProducts'))
####################################### END OF DELETE FUNCTIONALITY##############################################################
####################################### START OF UPDATE FUNCTIONALITY##############################################################
@webapp.route('/updateProduct/<int:id>', methods=['POST','GET'])
def updateProduct(id):
    print('In the function')
    db_connection = connect_to_database()
    #display existing data
    if request.method == 'GET':
        print('The GET request')
        product_query = 'SELECT productID, productName, brandName, price, category, sale, color from Products WHERE productID = %s'  % (id)
        product_result = execute_query(db_connection, product_query).fetchone()

        if product_result == None:
            return "No product found!"

        return render_template('updateProduct.html', product = product_result)
    
    elif request.method == 'POST':
        print('The POST request')
        productID = request.form['productID']
        productName = request.form['productName']
        brandName = request.form['brandName']
        price = request.form['price']
        category = request.form['category']
        sale = request.form['sale']
        color = request.form['color']

        query = "UPDATE Products SET productName = %s, brandName = %s, price = %s, category = %s, sale = %s, color = %s WHERE productID = %s"
        data = (productName, brandName, price, category, sale, color, productID)
        result = execute_query(db_connection, query, data)
        return redirect(url_for('products'))


@webapp.route('/updateOrder/<int:id>', methods=['POST','GET'])
def updateOrder(id):
    print('In the function')
    db_connection = connect_to_database()
    #display existing data
    if request.method == 'GET':
        print('The GET request')
        order_query = 'SELECT orderID, customerID, productID, dateOrdered, dateDelivered, totalPrice from Orders WHERE orderID = %s'  % (id)
        order_result = execute_query(db_connection, order_query).fetchone()

        if order_result == None:
            return "No order found!"

        return render_template('updateOrder.html', order = order_result)
    
    elif request.method == 'POST':
        print('The POST request')
        orderID = request.form['orderID']
        customerID = request.form['customerID']
        productID = request.form['productID']
        dateOrdered = request.form['dateOrdered']
        dateDelivered = request.form['dateDelivered']
        totalPrice = request.form['totalPrice']

        query = "UPDATE Orders SET customerID = %s, productID = %s, dateOrdered = %s, dateDelivered = %s, totalPrice = %s WHERE orderID = %s"
        data = (customerID, productID, dateOrdered, dateDelivered, totalPrice, orderID)
        result = execute_query(db_connection, query, data)
        return redirect(url_for('orders'))


@webapp.route('/updateCustomer/<int:id>', methods=['POST','GET'])
def updateCustomer(id):
    print('In the function')
    db_connection = connect_to_database()
    #display existing data
    if request.method == 'GET':
        print('The GET request')
        customer_query = 'SELECT customerID, email, firstName, lastName, address, dob, phone, city, state, zipcode from Customers WHERE customerID = %s'  % (id)
        customer_result = execute_query(db_connection, customer_query).fetchone()

        if customer_result == None:
            return "No customer found!"

        return render_template('updateCustomer.html', customer = customer_result)
    
    elif request.method == 'POST':
        print('The POST request')
        customerID = request.form['customerID']
        email = request.form['email']
        firstName = request.form['firstName']
        lastName = request.form['lastName']
        address = request.form['address']
        dob = request.form['dob']
        phone = request.form['phone']
        city = request.form['city']
        state = request.form['state']
        zipcode = request.form['zipcode']

        query = "UPDATE Customers SET email = %s, firstName = %s, lastName = %s, address = %s, dob = %s, phone = %s, city = %s, state = %s, zipcode = %s WHERE customerID = %s"
        data = (email, firstName, lastName, address, dob, phone, city, state, zipcode, customerID)
        result = execute_query(db_connection, query, data)
        return redirect(url_for('customers'))

@webapp.route('/updateStore/<int:id>', methods=['POST','GET'])
def updateStore(id):
    print('In the function')
    db_connection = connect_to_database()
    #display existing data
    if request.method == 'GET':
        print('The GET request')
        store_query = 'SELECT storeID, address, city, state, daysOpen, hours FROM Stores WHERE storeID = %s'  % (id)
        store_result = execute_query(db_connection, store_query).fetchone()

        if store_result == None:
            return "No such person found!"

        return render_template('updateStore.html', store = store_result)
    
    elif request.method == 'POST':
        print('The POST request')
        storeID = request.form['storeID']
        address= request.form['address']
        city = request.form['city']
        state = request.form['state']
        daysOpen = request.form['daysOpen']
        hours = request.form['hours']

        query = "UPDATE Stores SET address = %s, city = %s, state = %s, daysOpen = %s, hours = %s WHERE storeID = %s"
        data = (address, city, state, daysOpen, hours, storeID)
        result = execute_query(db_connection, query, data)
        return redirect(url_for('stores'))


@webapp.route('/updateOrders/<int:id>', methods=['POST','GET'])
def updateOrders(id):
    print('In the function')
    db_connection = connect_to_database()
    #display existing data
    if request.method == 'GET':
        print('The GET request')
        orders_query = 'SELECT orderID, productID FROM Order_Products WHERE orderID = %s'  % (id)
        orders_result = execute_query(db_connection, orders_query).fetchone()

        if orders_result == None:
            return "No order found!"

        return render_template('updateOrders.html', orders = orders_result)
    
    elif request.method == 'POST':
        print('The POST request')
        orderID = request.form['orderID']
        productID = request.form['productID']

        query = "UPDATE Order_Products SET productID = %s WHERE orderID = %s"
        data = (productID, orderID)
        result = execute_query(db_connection, query, data)
        return redirect(url_for('orderProducts'))