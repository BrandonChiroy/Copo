-- Create database
CREATE DATABASE ProductosDB;
GO

USE ProductosDB;
GO

-- Create table: Categoria
CREATE TABLE Categoria (
    CodigoCategoria INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL
);

-- Create table: Producto
CREATE TABLE Producto (
    CodigoProducto INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    CodigoCategoria INT NOT NULL,
    FOREIGN KEY (CodigoCategoria) REFERENCES Categoria(CodigoCategoria)
);

-- Create table: Venta
CREATE TABLE Venta (
    CodigoVenta INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATETIME NOT NULL,
    CodigoProducto INT NOT NULL,
    FOREIGN KEY (CodigoProducto) REFERENCES Producto(CodigoProducto)
);


SELECT * FROM sys.sql_logins WHERE name = 'ProductosDBUser';
SELECT * FROM sys.sql_logins WHERE name = 'ProductsLogin';


CREATE DATABASE ProductosDB;
GO

USE ProductosDB;
GO

-- Temporarily allow manual inserts into the Categoria table
SET IDENTITY_INSERT Categoria ON;

-- Insert dummy data into Categoria table
INSERT INTO Categoria (CodigoCategoria, Nombre)
VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books'),
(4, 'Home & Kitchen'),
(5, 'Sports');

-- Turn off IDENTITY_INSERT for Categoria
SET IDENTITY_INSERT Categoria OFF;

-- Temporarily allow manual inserts into the Producto table
SET IDENTITY_INSERT Producto ON;

-- Insert dummy data into Producto table
INSERT INTO Producto (CodigoProducto, Nombre, CodigoCategoria)
VALUES
(1, 'Smartphone', 1),
(2, 'Laptop', 1),
(3, 'T-shirt', 2),
(4, 'Jeans', 2),
(5, 'Fiction Book', 3),
(6, 'Cookware Set', 4),
(7, 'Soccer Ball', 5),
(8, 'Yoga Mat', 5);

-- Turn off IDENTITY_INSERT for Producto
SET IDENTITY_INSERT Producto OFF;

-- Temporarily allow manual inserts into the Venta table
SET IDENTITY_INSERT Venta ON;

-- Insert dummy data into Venta table
INSERT INTO Venta (CodigoVenta, Fecha, CodigoProducto)
VALUES
(1, '2019-01-15', 1),
(2, '2019-02-20', 2),
(3, '2019-03-10', 3),
(4, '2019-04-25', 4),
(5, '2019-05-30', 5),
(6, '2019-06-18', 6),
(7, '2019-07-05', 7),
(8, '2019-08-22', 8),
(9, '2019-09-11', 1),
(10, '2019-10-16', 2);

-- Turn off IDENTITY_INSERT for Venta
SET IDENTITY_INSERT Venta OFF;













CREATE TABLE Categoria (
    CodigoCategoria INT PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL
);

CREATE TABLE Producto (
    CodigoProducto INT PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    CodigoCategoria INT NOT NULL,
    FOREIGN KEY (CodigoCategoria) REFERENCES Categoria(CodigoCategoria)
);

CREATE TABLE Venta (
    CodigoVenta INT PRIMARY KEY,
    Fecha DATE NOT NULL,
    CodigoProducto INT NOT NULL,
    FOREIGN KEY (CodigoProducto) REFERENCES Producto(CodigoProducto)
);


USE ProductosDB;
GO

GRANT SELECT ON dbo.Venta TO ProductsLogin;
GRANT SELECT ON dbo.Producto TO ProductsLogin;
GRANT SELECT ON dbo.Categoria TO ProductsLogin;



SELECT c.Nombre AS NombreCategoria
FROM Venta v
JOIN Producto p ON v.CodigoProducto = p.CodigoProducto
JOIN Categoria c ON p.CodigoCategoria = c.CodigoCategoria
WHERE v.Fecha = (
    SELECT MAX(Fecha)
    FROM Venta
);