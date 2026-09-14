CREATE DATABASE LogisticaExpress

USE LogisticaExpress

CREATE TABLE productos(
id_producto INT PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(30) NOT NULL,
stock INT NOT NULL CHECK(stock>0),
fecha_ingreso_lote DATE default GETDATE(),
id_almacen INT 
);

CREATE TABLE almacen(
id_almacen INT PRIMARY KEY IDENTITY(1,1),
ubicacion VARCHAR(30) NOT NULL UNIQUE,
departamente VARCHAR(30) NOT NULL UNIQUE,
);

ALTER TABLE productos ADD CONSTRAINT FK_almacen 
FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen);


INSERT INTO productos(nombre, stock, id_almacen) VALUES 
('Atum',30, 1);

INSERT INTO productos(nombre, stock, fecha_ingreso_lote, id_almacen) VALUES 
('Atum',30, '2026-09-14', 2);


CREATE TABLE almacen(
id_almacen INT PRIMARY KEY IDENTITY(1,1),
ubicacion VARCHAR(30) NOT NULL UNIQUE,
departamente VARCHAR(30) NOT NULL UNIQUE,
);

INSERT INTO almacen(ubicacion, departamente) VALUES 
('calle 45', 'Antioquia'),
('carrera 10', 'choco')

-- Asegúrate de omitir 'id_almacen' ya que es autoincremental por IDENTITY(1,1)
INSERT INTO almacen (ubicacion, departamente) 
VALUES 
    ('Bodega Central', 'Logística'),
    ('Zona Franca', 'Inventarios'),
    ('Puerto Seco', 'Distribución'),
    ('Sector Norte', 'Operaciones');

ALTER TABLE productos ADD CONSTRAINT FK_almacen 
FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen);

SELECT *
FROM productos

SELECT *
FROM almacen


