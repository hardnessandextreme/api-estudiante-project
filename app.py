from flask import Flask
from flask_restful import Api
from resources.estudiantes import EstudianteResource, EstudiantesResource, CiudadesResource, CiudadResource, IndexResource


app = Flask(__name__)
api = Api(app)

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:123@localhost/db_clase'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

from db import db
db.init_app(app)

api.add_resource(IndexResource, '/')
api.add_resource(EstudiantesResource, '/estudiantes/')
api.add_resource(EstudianteResource, '/estudiantes/<int:id_est>')
api.add_resource(CiudadesResource, '/ciudades/')
api.add_resource(CiudadResource, '/ciudades/<int:id_ciudad>')

if __name__ == '__main__':
    app.run(debug=True)
