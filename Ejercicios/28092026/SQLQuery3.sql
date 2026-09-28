CREATE DATABASE colegio

CREATE TABLE estudiantes (
identificacion VARCHAR(15) PRIMARY KEY,
tipo_identificacion VARCHAR(10),
nombre VARCHAR(50) NOT NULL,    -- NOMBRE APELLIDO
correo VARCHAR(50) NOT NULL UNIQUE,
direccion VARCHAR(50) NOT NULL,
telefono VARCHAR(50),
acudiente VARCHAR(50) NOT NULL ,
);



CREATE TABLE tipo_identificacion(
idtipo INT IDENTITY(1,1) PRIMARY KEY,
tipo_identificacion VARCHAR(30) NOT NULL UNIQUE 
CHECK(tipo_identificacion IN ('cedula', 'cedulaExtranjeria', 'pasaporte')
)


/* FRONT END  */