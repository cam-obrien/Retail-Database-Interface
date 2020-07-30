from flask import Flask, render_template
from flask import request, redirect
from db_connector.db_connector import connect_to_database, execute_query
#create the web application
webapp = Flask(__name__)

#provide a route where requests on the web application can be addressed
@webapp.route('/hello')
#provide a view (fancy name for a function) which responds to any requests on this route
def hello():
    return "Welcome to my website brotha"

@webapp.route('/orders')
def orders():
    return render_template('orders.html')

@webapp.route('/products')
def products():
    return render_template('products.html')

@webapp.route('/customers')
def customers():
    return render_template('customers.html')

@webapp.route('/orderproducts')
def orderProducts():
    return render_template('orderProducts.html')

@webapp.route('/modifycustomers')
def modifyCustomers():
    return render_template('modifyCustomers.html')

@webapp.route('/modifyproducts')
def modifyProducts():
    return render_template('modifyProducts.html')

@webapp.route('/modifystores')
def modifyStores():
    return render_template('modifyStores.html')

@webapp.route('/modifyorders')
def modifyOrders():
    return render_template('modifyOrders.html')

@webapp.route('/stores')
def stores():
    return render_template('stores.html')

@webapp.route('/')
def index():
    return render_template('index.html')

@webapp.route('/home')
def home():
    return render_template('index.html')