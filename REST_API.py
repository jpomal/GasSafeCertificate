
from flask import Flask
from flask import jsonify
from flask import request
from flask_pymongo import PyMongo
from flaskext import MySQL
import sqlalchemy

# use sqlalchemy to connect to databases

app = Flask(__name__)

mysql = MySQL()

app.config['MYSQL_DATABASE_USER'] = 'julian'
app.config['MYSQL_DATABASE_PASSWORD'] = 'bossman11'
app.config['MYSQL_DATABASE_DB'] = 'GasCert_DW'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

mysql.init_app(app)


@app.route('/')
def get():
    cur = mysql.connect().cursor()
    cur.execute('''select * from GasCert_DW.DimApplianceType''')
    r = [dict((cur.description[i][0], value)
              for i, value in enumerate(row)) for row in cur.fetchall()]
    return jsonify({'myCollection': r})


@app.route('/ApplianceType', methods=['GET'])
def get_all_applianceType():
    return ''


@app.route('/ApplianceType/{id}', methods=['GET'])
def get_one_applianceType():
    return ''


@app.route('/ApplianceType', methods=['POST'])
def add_applianceType():
    return ''


@app.route('/FlueType', methods=['GET'])
def get_all_flueType():
    return ''


@app.route('/FlueType/{id}', methods=['GET'])
def get_one_flueType():
    return ''


@app.route('/FlueType', methods=['POST'])
def add_flueType():
    return ''



@app.route('/Appliance', methods=['GET'])
def get_all_appliance():
    return ''


@app.route('/Appliance/{id}', methods=['GET'])
def get_one_appliance():
    return ''


@app.route('/Appliance', methods=['POST'])
def add_appliance():
    return ''


@app.route('/PersonType', methods=['GET'])
def get_all_personType():
    return ''


@app.route('/PersonType/{id}', methods=['GET'])
def get_one_personType():
    return ''


@app.route('/PersonType', methods=['POST'])
def add_personType():
    return ''


@app.route('/Address', methods=['GET'])
def get_all_address():
    return ''


@app.route('/Address/{id}', methods=['GET'])
def get_one_address():
    return ''


@app.route('/Address', methods=['POST'])
def add_address():
    return ''


@app.route('/Person', methods=['GET'])
def get_all_person():
    return ''


@app.route('/Person/{id}', methods=['GET'])
def get_one_person():
    return ''


@app.route('/Person', methods=['POST'])
def add_person():
    return ''


@app.route('/Certification', methods=['GET'])
def get_all_certification():
    return ''


@app.route('/Certification/{id}', methods=['GET'])
def get_one_certification():
    return ''


@app.route('/Certification', methods=['POST'])
def add_certification():
    return ''


@app.route('/DefectType', methods=['GET'])
def get_all_defectType():
    return ''


@app.route('/DefectType/{id}', methods=['GET'])
def get_one_defectType():
    return ''


@app.route('/DefectType', methods=['POST'])
def add_defectType():
    return ''


@app.route('/Defect', methods=['GET'])
def get_all_defect():
    return ''


@app.route('/Defect/{id}', methods=['GET'])
def get_one_defect():
    return ''


@app.route('/Defect', methods=['POST'])
def add_defect():
    return ''


@app.route('/InspectionDefect', methods=['GET'])
def get_all_inspectionDefect():
    return ''


@app.route('/InspectionDefect/{id}', methods=['GET'])
def get_one_inspectionDefect():
    return ''


@app.route('/InspectionDefect', methods=['POST'])
def add_inspectionDefect():
    return ''


@app.route('/Inspection', methods=['GET'])
def get_all_inspection():
    return ''


@app.route('/Inspection/{id}', methods=['GET'])
def get_one_inspection():
    return ''


@app.route('/Inspection', methods=['POST'])
def add_inspection():
    return ''


@app.route('/ApplianceInspected', methods=['GET'])
def get_all_applianceInspected():
    return ''


@app.route('/ApplianceInspected/{id}', methods=['GET'])
def get_one_applianceInspected():
    return ''


@app.route('/ApplianceInspected', methods=['POST'])
def add_applianceInspected():
    return ''



if __name__ == '__main__':
    app.run()
