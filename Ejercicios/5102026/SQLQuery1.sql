CREATE DATABASE Universidad

USE Universidad

CREATE TABLE Inventario( 
Codigo INT PRIMARY KEY, 
Producto VARCHAR(100) NOT NULL,
Precio DECIMAL(10,2) CHECK(Precio >= 0), 
Categoria VARCHAR(50),
);

ALTER TABLE Inventario ADD 
Stock INT CHECK(Stock >= 0)

ALTER TABLE Inventario ADD 
idAlmacen VARCHAR(50)

ALTER TABLE Inventario 
ALTER COLUMN idAlmacen VARCHAR(50) NOT NULL; 

CREATE TABLE Almacen(
idAlmacen VARCHAR(50),
nombreAlmacen VARCHAR(50),
ciudadAlmacen VARCHAR(50)
);

ALTER TABLE Almacen 
ALTER COLUMN idAlmacen VARCHAR(50) NOT NULL; 

ALTER TABLE Almacen 
ADD CONSTRAINT PK_Almacen PRIMARY KEY (idAlmacen) 

--Eliminar tabla
--DROP TABLE Almacen

--Poblar Almacen
INSERT INTO Almacen (idAlmacen, nombreAlmacen, ciudadAlmacen)
VALUES 
('ALM-001', 'Almacén Central Norte', 'Bogotá'),
('ALM-002', 'Centro de Distribución Sur', 'Medellín'),
('ALM-003', 'Almacén Principal Occidente', 'Cali'),
('ALM-004', 'Logística Costa', 'Barranquilla'),
('ALM-005', 'Almacén Satélite Oriente', 'Bucaramanga');

--Poblar la base de datos
INSERT INTO Inventario (Codigo, Producto, Precio, Categoria, idAlmacen) VALUES 
(9, 'Laptop Dell', 1200.00, 'Computacion', 'ALM-004'), 
(2, 'Mouse Inalámbrico', 25.00, 'Accesorios'), 
(3, 'Teclado Mecánico', 80.00, 'Accesorios'), 
(4, 'Monitor 24', 200.00, 'Computacion'), 
(5, 'Cable HDMI', 15.00, 'Accesorios');

-- Recuperación de datos
SELECT *
FROM Inventario
WHERE codigo = 6

--update de un datos de una tabla
UPDATE Inventario
SET idAlmacen = 'ALM-001'
WHERE codigo = 1

UPDATE Inventario
SET idAlmacen = 'ALM-002'
WHERE codigo = 2

UPDATE Inventario
SET idAlmacen = 'ALM-003'
WHERE codigo = 3

UPDATE Inventario
SET idAlmacen = 'ALM-004'
WHERE codigo = 4

UPDATE Inventario
SET idAlmacen = 'ALM-005'
WHERE codigo = 5

UPDATE Inventario
SET idAlmacen = 'ALM-005'
WHERE codigo = 6

SELECT *
FROM Almacen

SELECT *
FROM Inventario
WHERE Precio >= 50.00


--columnas calculadas y uso de funciones de agregación
SELECT Categoria,
SUM(Precio) as valorInvetario
FROM Inventario
GROUP BY Categoria
ORDER BY valorInvetario ASC


ALTER TABLE Inventario 
ADD CONSTRAINT FK_inventario FOREIGN KEY (idAlmacen)
REFERENCES Almacen(idAlmacen)


--inner join
SELECT *
FROM Inventario
WHERE Stock IS NULL

ALTER TABLE Inventario 
ALTER COLUMN Stock INT NOT NULL; 

UPDATE Inventario
SET Stock = 0
WHERE Stock IS NULL

UPDATE Inventario
SET Stock = 16
WHERE Codigo = 2

ALTER TABLE Inventario 
ALTER COLUMN Stock INT NOT NULL; 

SELECT *
FROM Almacen


--Inner join La ciudad donde estan mis productos
SELECT i.Producto, a.ciudadAlmacen
FROM Inventario i
INNER JOIN Almacen a
ON i.idAlmacen = a.idAlmacen



