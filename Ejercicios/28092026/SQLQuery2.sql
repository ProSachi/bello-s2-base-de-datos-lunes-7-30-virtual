CREATE DATABASE DISNEY

USE DISNEY

-- Creación de la tabla Usuarios
CREATE TABLE Usuarios (
    UsuarioID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    FechaRegistro DATE NOT NULL DEFAULT GETDATE(),
    Pais NVARCHAR(30) NOT NULL
);

-- Inserción de datos (incluye los IDs 1, 2, 3 y 4 utilizados en Reproducciones)
INSERT INTO Usuarios (Nombre, Email, FechaRegistro, Pais) VALUES
('Ana Gómez', 'ana.gomez@email.com', '2025-11-15', 'Colombia'),
('Carlos Pérez', 'carlos.perez@email.com', '2025-12-01', 'México'),
('Laura Martínez', 'laura.m@email.com', '2026-01-05', 'Argentina'),
('Diego Torres', 'diego.t@email.com', '2026-01-08', 'Chile'),
('Sofía Ramírez', 'sofia.r@email.com', '2026-02-20', 'Colombia');

-- Creación de la tabla Series
CREATE TABLE Series (
    SerieID INT IDENTITY(1,1) PRIMARY KEY,
    Titulo NVARCHAR(50) NOT NULL UNIQUE,
    Genero NVARCHAR(30) NOT NULL,
    ClasificacionEdad NVARCHAR(10) NOT NULL,
    AnioLanzamiento INT NOT NULL,
    CONSTRAINT CK_Genero_Series CHECK (Genero IN ('Sci-Fi', 'Comedia', 'Terror', 'Drama', 'Acción'))
);

-- Inserción de datos (incluye las series presentes en el ejercicio)
INSERT INTO Series (Titulo, Genero, ClasificacionEdad, AnioLanzamiento) VALUES
('Dark', 'Sci-Fi', '+16', 2017),
('The Office', 'Comedia', '+13', 2005),
('Arrastrame al Infierno', 'Terror', '+16', 2009),
('Friends', 'Comedia', 'TP', 1994),
('Stranger Things', 'Sci-Fi', '+16', 2016);


-- Reestructuración de Reproducciones con integridad referencial
CREATE TABLE Reproducciones_V2 (
    ReproduccionID INT IDENTITY(1,1) PRIMARY KEY,
    UsuarioID INT NOT NULL,
    SerieID INT NOT NULL,
    MinutosVistos INT NOT NULL,
    Fecha DATE NOT NULL DEFAULT GETDATE(),
    
    CONSTRAINT FK_Reproducciones_Usuarios FOREIGN KEY (UsuarioID) 
        REFERENCES Usuarios(UsuarioID),
    CONSTRAINT FK_Reproducciones_Series FOREIGN KEY (SerieID) 
        REFERENCES Series(SerieID),
    CONSTRAINT CK_MinutosVistos CHECK (MinutosVistos > 0)
);

-- Poblado utilizando subconsultas para mapear los títulos a sus respectivos SerieID
INSERT INTO Reproducciones_V2 (UsuarioID, SerieID, MinutosVistos, Fecha) VALUES
(4, (SELECT SerieID FROM Series WHERE Titulo = 'Arrastrame al Infierno'), 45, '2026-03-10'),
(1, (SELECT SerieID FROM Series WHERE Titulo = 'Dark'), 60, '2026-01-11'),
(2, (SELECT SerieID FROM Series WHERE Titulo = 'The Office'), 20, '2026-01-10'),
(2, (SELECT SerieID FROM Series WHERE Titulo = 'The Office'), 2, '2026-01-12'),
(3, (SELECT SerieID FROM Series WHERE Titulo = 'Dark'), 50, '2026-01-10'),
(4, (SELECT SerieID FROM Series WHERE Titulo = 'Friends'), 25, '2026-01-11');

SELECT *
FROM Series

SELECT *
FROM Usuarios

SELECT *
FROM Reproducciones_V2

SELECT u.Nombre, r.MinutosVistos, r.Fecha
FROM Reproducciones_V2 r
INNER JOIN Usuarios u
ON r.UsuarioID=u.UsuarioID


SELECT s.Titulo, r.MinutosVistos, r.Fecha
FROM Reproducciones_V2 r
INNER JOIN Series s
ON r.SerieID = s.SerieID

SELECT SerieID, MinutosVistos, Fecha
FROM Reproducciones_V2

SELECT u.Nombre, s.Titulo, r.Fecha
FROM USUARIOS u
INNER JOIN Reproducciones_V2 r
ON u.UsuarioID = r.UsuarioID
INNER JOIN Series s
ON r.SerieID = s.SerieID




--ejercicio de constraint, para que se usan
/* que los constraint son reglas que nos permiten
proteger la información que vamos a almacenar */




