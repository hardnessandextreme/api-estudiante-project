from flask_restful import Resource


class IndexResource(Resource):
    def get(self):
        return {'message': 'Bienvenido a la API de estudiantes',
                'autor': 'Jonathan Quinte',
                'endpoints': {
                    'estudiantes': '/estudiantes/',
                    'estudiante': '/estudiantes/<int:id_est>',
                    'ciudades': '/ciudades/',
                    'ciudad': '/ciudades/<int:id_ciudad>'
                }}
