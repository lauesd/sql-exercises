-- Elimina la base de datos 'tienda' si existe, para evitar conflictos al crearla nuevamente.
DROP DATABASE IF EXISTS tienda;

-- Crea la base de datos 'tienda' con la codificación de caracteres UTF-8mb4.
CREATE DATABASE tienda CHARACTER SET utf8mb4;

-- Selecciona la base de datos 'tienda' para comenzar a trabajar con ella.
USE tienda;

-- Crea la tabla 'fabricante' para almacenar información sobre los fabricantes de los productos.
CREATE TABLE fabricante (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Identificador único del fabricante.
  nombre VARCHAR(100) NOT NULL -- Nombre del fabricante, no puede ser nulo.
);

-- Crea la tabla 'producto' para almacenar información sobre los productos disponibles en la tienda.
CREATE TABLE producto (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Identificador único del producto.
  nombre VARCHAR(100) NOT NULL, -- Nombre del producto, no puede ser nulo.
  precio DOUBLE NOT NULL, -- Precio del producto, no puede ser nulo.
  id_fabricante INT UNSIGNED NOT NULL, -- Identificador del fabricante del producto, no puede ser nulo.
  FOREIGN KEY (id_fabricante) REFERENCES fabricante(id) -- Establece una clave externa que referencia al identificador del fabricante en la tabla 'fabricante'.
);

-- Inserta datos de fabricantes en la tabla 'fabricante'.
INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

-- Inserta datos de productos en la tabla 'producto'.
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

-- Cambia a la base de datos 'tienda' para realizar las consultas.
USE tienda;

-- Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM producto;

-- Lista todas las columnas de la tabla producto.
SELECT * FROM producto;

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT nombre AS 'nombre de producto', precio AS 'euros', precio * 1.12 AS 'dólares' FROM producto;

-- Lista el identificador de los fabricantes que tienen productos en la tabla producto.
SELECT DISTINCT id_fabricante FROM producto;

-- Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre FROM fabricante ORDER BY nombre DESC;
