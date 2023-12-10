from db import db

class EstudianteModel(db.Model):
    __tablename__ = 'tbm_estudiantes'

    id_est = db.Column(db.Integer, primary_key=True)
    nombre_estudiante = db.Column(db.String(50))
    apellido_estudiante = db.Column(db.String(50))
    cedula = db.Column(db.String(10))
    fk_ciudad = db.Column(db.Integer)

    
    def save_to_db(self):
        db.session.add(self)
        db.session.commit()

    def delete_from_db(self):
        db.session.delete(self)
        db.session.commit()
    
    def json(self):
        ciudad = CiudadModel.query.get(self.fk_ciudad)
        ciudad_nombre = ciudad.nombre_ciudad if ciudad else None
        
        return {
            'ID': self.id_est,
            'Nombre': self.nombre_estudiante,
            'Apellido': self.apellido_estudiante,
            'Cedula': self.cedula,
            'Ciudad': ciudad_nombre
        }


class CiudadModel(db.Model):
    __tablename__ = 'tbm_ciudades'

    id_ciudad = db.Column(db.Integer, primary_key=True)
    nombre_ciudad = db.Column(db.String(50))
    
    def save_to_db(self):
        db.session.add(self)
        db.session.commit()
    
    def json(self):
        return {
            'ID': self.id_ciudad,
            'Nombre': self.nombre_ciudad
        }
