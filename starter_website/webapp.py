from flask import Flask, render_template
from flask import request, redirect
from db_connector.db_connector import connect_to_database, execute_query
#create the web application
webapp = Flask(__name__)

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
    query = "SELECT orderID, customerID, dateOrdered, dateDelivered, totalPrice FROM Orders;"
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
    query = "SELECT orderID, customerID FROM Order_Products;"
    result = execute_query(db_connection, query).fetchall()
    print(result)
    return render_template('orderProducts.html', rows=result)

# Still can't figure out why adding a new product won't go through to backend
@webapp.route('/modifyProducts', methods=['POST', 'GET'])
def modifyProducts():
    db_connection = connect_to_database()
    if request.method == 'GET':
        query = 'SELECT productID, productName, brandName, price, category, sale, color from Products'
        result = execute_query(db_connection, query).fetchall()
        print(result)
        return render_template('modifyProducts.html', rows = result)

    elif request.method == 'POST':
        print("Add new products!")
        productName = request.form['productName']
        brandName = request.form['brandName']
        price = request.form['price']
        category = request.form['category']
        sale = request.form['sale']
        color = request.form['color']

        query = 'INSERT INTO Products (productName, brandName, price, category, sale, color) VALUES (%s,%s,%s,%s,%s,%s)'
        data = (productName, brandName, price, category, sale, color)
        execute_query(db_connection, query, data)
        return ('Product added!');

@webapp.route('/modifyOrders', methods=['POST','GET'])
def modifyOrders():
    db_connection = connect_to_database()
    if request.method == 'GET':
        query = 'SELECT orderID, customerID, dateOrdered, dateDelivered, totalPrice from Orders'
        result = execute_query(db_connection, query).fetchall()
        print(result)
        return render_template('modifyOrders.html', rows = result)

    elif request.method == 'POST':
        print("Add new order!")
        customerID = request.form['customerID']
        dateOrdered = request.form['dateOrdered']
        dateDelivered = request.form['dateDelivered']
        totalPrice = request.form['totalPrice']

        query = 'INSERT INTO Orders (customerID, dateOrdered, dateDelivered, totalPrice) VALUES (%s,%s,%s,%s)'
        data = (customerID, dateOrdered, dateDelivered, totalPrice)
        execute_query(db_connection, query, data)
        return ('Order added!')


@webapp.route('/modifyCustomers', methods=['POST','GET'])
def modifyCustomers():
    db_connection = connect_to_database()
    if request.method == 'GET':
        query = 'SELECT customerID from Customers'
        result = execute_query(db_connection, query).fetchall()
        print(result)
        return render_template('modifyCustomers.html', rows = result)

    elif request.method == 'POST':
        print("Add new order!")
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
        return ('Order added!')


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
        return ('Store added!')

@webapp.route('/deleteProduct/<int:id>')
def deleteProducts(id):
    db_connection = connect_to_database()
    query = "DELETE FROM Products WHERE productID = %s"
    data = (id,)
    result = execute_query(db_connection, query, data)
    return render_template('products.html', rows = result)