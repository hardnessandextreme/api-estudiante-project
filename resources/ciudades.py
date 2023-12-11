from flask_restful import Resource, reqparse
from models import CiudadModel


class CiudadesResource(Resource):
    def get(self):
        ciudades = CiudadModel.query.all()
        result = []

        for ciudad in ciudades:
            result.append(ciudad.json())

        return {'ciudades': result}

    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('nombre_ciudad', type=str, required=True)
        data = parser.parse_args()

        ciudad = CiudadModel(**data)
        ciudad.save_to_db()

        return ciudad.json(), 201

class CiudadResource(Resource):
    def get(self, id_ciudad):
        ciudad = CiudadModel.query.filter_by(id_ciudad=id_ciudad).first()
        if ciudad:
            return ciudad.json()
        return {'message': 'Ciudad no encontrada'}, 404

    def put(self, id_ciudad):
        parser = reqparse.RequestParser()
        parser.add_argument('nombre_ciudad', type=str, required=True)
        data = parser.parse_args()

        ciudad = CiudadModel.query.filter_by(id_ciudad=id_ciudad).first()
        if ciudad:
            ciudad.nombre_ciudad = data['nombre_ciudad']
            ciudad.save_to_db()
            return ciudad.json()
        return {'message': 'Ciudad no encontrada'}, 404