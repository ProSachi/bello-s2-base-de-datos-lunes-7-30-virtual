CREATE DATABASE RedSocialDB
go

USE RedSocialDB
go

CREATE TABLE usuarios_publicaciones(
id_usuarios INT,
id_publicaciones INT,
);
go

CREATE TABLE Usuarios(
id_usuario VARCHAR(30),
nickname VARCHAR(30) NOT NULL UNIQUE,
email VARCHAR(20) NOT NULL UNIQUE,
CONSTRAINT PRIMARIA PRIMARY KEY (id_usuario)
);
GO


CREATE TABLE publicaciones(
id_publicaciones INT PRIMARY KEY IDENTITY(1,1),
tipo_contenido VARCHAR(30),
contenido VARCHAR(MAX),
fecha_publicacion DATE DEFAULT GETDATE(),
usuario_id VARCHAR(30) FOREIGN KEY REFERENCES usuarios_publicaciones(id_usuario)
);

INSERT INTO Usuarios(id_usuario, nickname,email) VALUES
('asd123', 'sachi', 'syosa@cesde.net')

INSERT INTO publicaciones(tipo_contenido, contenido, usuario_id) VALUES
('Videos', 'Un video donde juega halo','asd123')

INSERT INTO publicaciones(tipo_contenido, contenido, usuario_id) VALUES
('Imagenes', 'Una imagen donde juega halo','daniela')

SELECT *
FROM Usuarios

SELECT *
FROM publicaciones





CREATE TABLE Citas_Medicas(
Documento INT FOREIGN KEY REFERENCES Pacientes(Documento),
Licencia_Medica INT FOREIGN KEY REFERENCES Medicos(Licencia_Medica),
CONSTRAINT NOMBREDELCONSTRAINT PRIMARY KEY(Documento,Licencia_Medica) 
);

