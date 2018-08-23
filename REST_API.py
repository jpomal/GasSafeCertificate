
from flask import Flask
from flask import jsonify
from flask import request
from flask_pymongo import PyMongo
from flaskext import MySQL

app = Flask(__name__)

mysql = MySQL()

app.config['MYSQL_DATABASE_USER'] = 'my_user'
app.config['MYSQL_DATABASE_PASSWORD'] = 'my_password'
app.config['MYSQL_DATABASE_DB'] = 'my_database'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

#mongo = PyMongo(app)

# app.config['MONGO_DBNAME'] = 'GasCertDW'
# app.config['MONGO_URI'] = 'mongodb://localhost:27017/GasCertDW'

mysql.init_app(app)


@app.route('/')
def get():
    cur = mysql.connect().cursor()
    cur.execute('''select * from my_database.my_table''')
    r = [dict((cur.description[i][0], value)
              for i, value in enumerate(row)) for row in cur.fetchall()]
    return jsonify({'myCollection' : r})


@app.route('/ApplianceType', methods=['GET'])
def get_all_stars():
    star = mongo.db.stars
    output = []
    for s in star.find():
        output.append({'name': s['name'], 'distance': s['distance']})
    return jsonify({'result': output})


@app.route('/ApplianceType/', methods=['GET'])
def get_one_star(name):
    star = mongo.db.stars
    s = star.find_one({'name' : name})
    if s:
      output = {'name' : s['name'], 'distance': s['distance']}
    else:
      output = "No such name"
    return jsonify({'result' : output})


@app.route('/ApplianceType', methods=['POST'])
def add_star():
    star = mongo.db.stars
    name = request.json['name']
    distance = request.json['distance']
    star_id = star.insert({'name': name, 'distance': distance})
    new_star = star.find_one({'_id': star_id })
    output = {'name': new_star['name'], 'distance': new_star['distance']}
    return jsonify({'result': output})

if __name__ == '__main__':
    app.run()