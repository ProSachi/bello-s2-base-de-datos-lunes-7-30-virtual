CREATE DATABASE ClaseAnalisis;
GO
USE ClaseAnalisis;
GO

CREATE TABLE Nomina (
    EmpleadoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50),
    Departamento VARCHAR(50),
    Cargo VARCHAR(50),
    SalarioBase DECIMAL(10,2),
    Bono DECIMAL(10,2)
);

INSERT INTO Nomina (Nombre, Departamento,Cargo, SalarioBase, Bono) VALUES
('Ana', 'IT', 'Desarrollador', 4000, 500),
('Luis', 'IT', 'Desarrollador', 4000, 0),
('Carlos', 'IT', 'Gerente', 7000, 1000),
('Marta', 'Ventas', 'Vendedor', 2000, 1500),
('Pedro', 'Ventas', 'Vendedor', 2000, 800),
('Sofía', 'Ventas', 'Gerente', 5000, 1200),
('Juan', 'RRHH', 'Reclutador', 3000, 200);
GO


SELECT *
FROM Nomina

SELECT TOP 4 *
FROM Nomina

SELECT DISTINCT Departamento
FROM Nomina

SELECT DISTINCT Cargo
FROM Nomina

SELECT Cargo, SalarioBase * 3 AS SalarioTrimestral
FROM Nomina

SELECT Nombre, SalarioBase + bono AS SalarioTrimestral
FROM Nomina

SELECT Nombre, Cargo + ' - ' + Departamento AS CargoDepartamente
FROM Nomina

SELECT COUNT(Nombre)
FROM Nomina

SELECT *
FROM Nomina

DELETE
FROM Nomina

SELECT *
FROM Nomina
WHERE nombre='Ana'

DELETE
FROM Nomina
WHERE nombre='Ana'

SELECT SUM(SalarioBase) AS SumatoriaSalarios
FROM Nomina


SELECT SUM(Bono) +SUM(SalarioBase) AS Salarios
FROM Nomina

SELECT AVG(SalarioBase) AS PromedioSalario
FROM Nomina

SELECT MIN(SalarioBase) AS SalarioMinimo
FROM Nomina

SELECT MAX(SalarioBase) AS SalarioMaximo
FROM Nomina

SELECT MAX(SalarioBase)
FROM Nomina
WHERE Departamento = 'IT'

SELECT MIN(SalarioBase)
FROM Nomina
WHERE Departamento = 'Ventas'

SELECT *
FROM Nomina
WHERE Departamento= 'IT'

SELECT DISTINCT Departamento
FROM Nomina

SELECT
    Departamento,
    SUM(SalarioBase) AS TotalSalario
FROM
    Nomina
GROUP BY
    Departamento

SELECT *
FROM Nomina

SELECT Cargo,
SUM(Bono) AS SumatoriaBono
FROM Nomina
GROUP BY Cargo

SELECT
    Departamento,
    SUM(SalarioBase) AS TotalSalario
FROM
    Nomina
WHERE
    Bono > 0
GROUP BY
    Departamento
HAVING 
SUM(SalarioBase) > 5000.00
ORDER BY TotalSalario ASC

CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,
    ClienteID INT,
    FechaPedido DATE,
    Monto DECIMAL(10, 2)
);

INSERT INTO Pedidos VALUES
(101, 1, '2025-08-01', 150000),
(102, 2, '2025-08-03', 75000),
(103, 1, '2025-08-05', 220000),
(104, 3, '2025-08-06', 500000),
(105, 2, '2025-08-10', 110000),
(106, 1, '2025-08-12', 80000);

SELECT *
FROM Pedidos

SELECT ClienteID,
SUM(Monto) AS SumatoriaMonto
FROM Pedidos
WHERE Monto > 75000
GROUP BY ClienteID
ORDER BY SumatoriaMonto ASC

