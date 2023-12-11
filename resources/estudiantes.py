from flask_restful import Resource, reqparse
from models import EstudianteModel, CiudadModel


class EstudiantesResource(Resource):
    def get(self):
        estudiantes = EstudianteModel.query.all()
        result = []

        for estudiante in estudiantes:
            ciudad = CiudadModel.query.get(estudiante.fk_ciudad)
            ciudad_nombre = ciudad.nombre_ciudad if ciudad else None

            result.append({
                'ID': estudiante.id_est,
                'Nombre': estudiante.nombre_estudiante,
                'Apellido': estudiante.apellido_estudiante,
                'Cedula': estudiante.cedula,
                'Ciudad': ciudad_nombre
            })

        return {'estudiantes': result}

    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('nombre_estudiante', type=str, required=True)
        parser.add_argument('apellido_estudiante', type=str, required=True)
        parser.add_argument('cedula', type=str, required=True)
        parser.add_argument('fk_ciudad', type=int, required=True)
        data = parser.parse_args()

        estudiante = EstudianteModel(**data)
        estudiante.save_to_db()

        return estudiante.json(), 201

class EstudianteResource(Resource):
    def get(self, id_est):
        estudiante = EstudianteModel.query.filter_by(id_est=id_est).first()
        if estudiante:
            return estudiante.json()
        return {'message': 'Estudiante no encontrado'}, 404

    def put(self, id_est):
        parser = reqparse.RequestParser()
        parser.add_argument('nombre_estudiante', type=str, required=True)
        parser.add_argument('apellido_estudiante', type=str, required=True)
        parser.add_argument('cedula', type=str, required=True)
        parser.add_argument('fk_ciudad', type=int, required=True)
        data = parser.parse_args()

        estudiante = EstudianteModel.query.filter_by(id_est=id_est).first()
        if estudiante:
            estudiante.nombre_estudiante = data['nombre_estudiante']
            estudiante.apellido_estudiante = data['apellido_estudiante']
            estudiante.cedula = data['cedula']
            estudiante.fk_ciudad = data['fk_ciudad']
            estudiante.save_to_db()
            return estudiante.json()
        return {'message': 'Estudiante no encontrado'}, 404

    def delete(self, id_est):
        estudiante = EstudianteModel.query.filter_by(id_est=id_est).first()
        if estudiante:
            estudiante.delete_from_db()
            return {'message': 'Estudiante eliminado correctamente'}
        return {'message': 'Estudiante no encontrado'}, 404
