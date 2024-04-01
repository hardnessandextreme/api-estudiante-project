# Proyecto API de Estudiantes

Este proyecto (de la asignatura Integración de Aplicaciones API) consiste en una API desarrollada con Flask, que proporciona endpoints para administrar información sobre estudiantes y ciudades. La API permite realizar operaciones CRUD (Crear, Leer, Actualizar, Eliminar) tanto para estudiantes como para ciudades.

## Endpoints:

- **Estudiantes:**
  - `GET /estudiantes/`: Devuelve la lista de todos los estudiantes.
  - `GET /estudiantes/<int:id_est>`: Devuelve información detallada de un estudiante específico.
  - `POST /estudiantes/`: Endpoint para agregar un nuevo estudiante.
  - `PUT /estudiantes/<int:id_est>`: Endpoint para actualizar la información de un estudiante existente.
  - `DELETE /estudiantes/<int:id_est>`: Endpoint para eliminar un estudiante.

- **Ciudades:**
  - `GET /ciudades/`: Endpoint para obtener la lista de todas las ciudades.
  - `GET /ciudades/<int:id_ciudad>`: Endpoint para obtener información detallada de una ciudad específica.
  - `POST /ciudades/`: Endpoint para agregar una nueva ciudad.
  - `PUT /ciudades/<int:id_ciudad>`: Endpoint para actualizar el nombre de una ciudad existente.
  - `DELETE /ciudades/<int:id_ciudad>`: Endpoint para eliminar una ciudad.
