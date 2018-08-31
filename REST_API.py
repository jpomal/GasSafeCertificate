
from flask import Flask
from flask import jsonify
from flask import request
from flask_pymongo import PyMongo
from flaskext import MySQL
import sqlalchemy

# use sqlalchemy to connect to databases

app = Flask(__name__)

mysql = MySQL()

app.config['MYSQL_DATABASE_USER'] = 'my_user'
app.config['MYSQL_DATABASE_PASSWORD'] = 'my_password'
app.config['MYSQL_DATABASE_DB'] = 'my_database'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

mysql.init_app(app)


@app.route('/')
def get():
    cur = mysql.connect().cursor()
    cur.execute('''select * from my_database.my_table''')
    r = [dict((cur.description[i][0], value)
              for i, value in enumerate(row)) for row in cur.fetchall()]
    return jsonify({'myCollection': r})


@app.route('/ApplianceType', methods=['GET'])
def get_all_applianceType():
    return ''


@app.route('/ApplianceType/', methods=['GET'])
def get_one_applianceType(type):
    return ''


@app.route('/ApplianceType', methods=['POST'])
def add_appliance_type():
    return ''

if __name__ == '__main__':
    app.run()