CREATE DATABASE netflix

USE netflix

CREATE TABLE Reproducciones (
    UsuarioID INT,
    Serie VARCHAR(50), 
    Genero VARCHAR(30),
    MinutosVistos INT,
    Fecha DATE
);

ALTER TABLE Reproducciones ALTER COLUMN Serie 
NVARCHAR(50) NOT NULL;

ALTER TABLE Reproducciones ALTER COLUMN Genero 
NVARCHAR(30) NOT NULL;

ALTER TABLE Reproducciones
ADD CONSTRAINT CK_Gener CHECK (Genero IN ('Sci-Fi', 'Comedia', 'Terror'));

ALTER TABLE Reproducciones ADD CONSTRAINT Fecha 
DEFAULT GETDATE();

ALTER TABLE Reproducciones ADD CONSTRAINT MinutosVistos 
CHECK (MinutosVistos>0) ;

ALTER TABLE Reproducciones ALTER COLUMN MinutosVistos 
INT NOT NULL;

INSERT INTO Reproducciones VALUES 
(4, 'Arrastrame al Infierno', 'Terror', 45, '2026-03-10'), 
(1, 'Dark', 'Sci-Fi', 60, '2026-01-11'),
(2, 'The Office', 'Comedia', 20, '2026-01-10'), 
(2, 'The Office', 'Comedia', 2, '2026-01-12'),
(3, 'Dark', 'Sci-Fi', 50, '2026-01-10'), 
(4, 'Friends', 'Comedia', 25, '2026-01-11');

SELECT *
FROM Reproducciones

/*  */
SELECT *
FROM Reproducciones
WHERE MinutosVistos < 30

SELECT MinutosVistos -10 AS MENOSCREDITOS
FROM Reproducciones
WHERE MinutosVistos < 30

SELECT DISTINCT(Genero)
FROM Reproducciones

SELECT COUNT(Genero)
FROM Reproducciones

SELECT SUM(MinutosVistos)
FROM Reproducciones

SELECT Genero,
SUM(MinutosVistos) AS total_minutos
FROM Reproducciones
WHERE MinutosVistos >= 5
GROUP BY Genero
HAVING SUM(MinutosVistos) > 44

SELECT *
FROM Reproducciones


