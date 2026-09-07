CREATE DATABASE colegio2;
GO

USE colegio
GO

--Tabla estudiantes
CREATE TABLE estudiantes(
documento INT NOT NULL,
nombre VARCHAR(50),
apellido VARCHAR(30),
correo VARCHAR(70)
);
GO

ALTER TABLE estudiantes ALTER COLUMN documento INT NOT NULL;
ALTER TABLE estudiantes ADD CONSTRAINT PK_estudiantes PRIMARY KEY (documento);



CREATE TABLE calificaciones(
idCalificaciones INT PRIMARY KEY IDENTITY(1,1),
nota DECIMAL(2,1),
fechaCalificacion DATE
);

CREATE TABLE profesores(
idProfesores INT PRIMARY KEY IDENTITY(1,1), 
nombre VARCHAR(50),
apellido VARCHAR(50),
email VARCHAR(30)
);

CREATE TABLE cursos(
idCurso INT PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(50),
calificaciones_id INT FOREIGN KEY REFERENCES calificaciones(idCalificaciones),
profesores_id INT FOREIGN KEY REFERENCES profesores(idprofesores),
);


ALTER TABLE cursos ADD estudiantes_id INT FOREIGN KEY REFERENCES estudiantes(documento);

ALTER TABLE cursos ADD CONSTRAINT Fk_estudiantes 
FOREIGN KEY(estudiantes_id) REFERENCES estudiantes(documento)




