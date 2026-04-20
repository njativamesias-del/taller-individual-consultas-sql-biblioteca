# Taller 1 - Consultas SQL Avanzadas

**Nombre:** Natalia Jativa

**Materia:** Bases de Datos II

**Profesor:** Jose Carvajal

---

## Introduccion

En este taller se desarrollan diferentes consultas SQL aplicadas a una base de datos de tipo biblioteca.  
El objetivo es reforzar el uso de sentencias SQL avanzadas para la manipulacion, consulta y analisis de datos.

Se trabajo con tablas relacionadas que representan usuarios, libros, prestamos y reservas, aplicando distintos enfoques para resolver cada requerimiento planteado.

---

## Objetivo

Aplicar conceptos fundamentales y avanzados de SQL como:

- Subconsultas  
- Operadores de conjunto  
- Expresiones condicionales  
- Funciones de agregacion  
- Funciones de fecha  
- Uso de JOINs para relacionar tablas  

---

## Estructura del proyecto

El repositorio contiene los siguientes archivos:

- `db_library.sql`  
  Script para la creacion de la base de datos, tablas y carga de datos iniciales.

- `consultas.sql`  
  Archivo que contiene la solucion de todas las consultas del taller organizadas por secciones.

- `README.md`  
  Documento descriptivo del proyecto.

---

## Instrucciones de ejecucion

1. Crear la base de datos:

CREATE DATABASE library_db;
USE library_db;


2. Ejecutar el archivo `db_library.sql` para crear las tablas e insertar los datos.

3. Ejecutar el archivo `consultas.sql` para visualizar los resultados de cada consulta.

---

## Desarrollo

Durante el desarrollo del taller se trabajaron diferentes tipos de consultas:

- Subconsultas para filtrar informacion basada en otras tablas  
- JOINs para relacionar entidades (usuarios, libros, prestamos y reservas)  
- Expresiones CASE para clasificar datos  
- Funciones como UPPER, CONCAT, DATEDIFF  
- Agrupaciones con GROUP BY y filtros con HAVING  

Esto permitio entender mejor como estructurar consultas mas completas y eficientes.

---

## Consultas desarrolladas

### 1. Subconsultas
- Obtener los nombres y apellidos de los usuarios que han reservado un libro de la categoria "Fiction".
- Mostrar el titulo y autor de los libros que estan prestados.

### 2. Operadores de conjunto
- Encontrar los titulos de los libros que han sido reservados, pero no prestados.
- Encontrar los titulos de los libros que han sido prestados, pero no reservados.

### 3. Expresiones condicionales
- Mostrar un listado de todos los libros con estado Disponible o Agotado.
- Clasificar usuarios como Activo o Sin actividad.

### 4. GROUP BY y HAVING
- Categorias con mas de 3 libros.
- Usuarios con mas de 2 reservas.

### 5. INNER JOIN
- Usuarios y libros prestados.
- Usuarios y libros reservados.

### 6. LEFT JOIN
- Libros con usuarios que reservaron.
- Usuarios con libros prestados.

### 7. RIGHT JOIN
- Libros con usuarios que reservaron incluyendo los que no tienen reservas.
- Usuarios con libros prestados incluyendo los que no tienen prestamos.

### 8. Funciones
- Titulos en mayusculas.
- Nombre completo concatenado.

### 9. Fechas
- Dias desde la reserva.
- Prestamos pendientes.

### 10. Agregacion
- Total de copias por categoria.
- Total de prestamos por usuario.

---

## Observaciones

- Algunas consultas pueden no mostrar resultados debido a los datos de prueba.
- Se utilizo phpMyAdmin con MySQL para ejecutar las consultas.
- Se corrigieron errores de comillas en el script original.

---

## Conclusion

Este taller permitio reforzar el uso de SQL en consultas avanzadas, manejo de relaciones entre tablas y organizacion del codigo para su presentacion en GitHub.
