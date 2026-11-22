-- 1. Crear Base de Datos
CREATE DATABASE IF NOT EXISTS proyecto_tienda;
USE proyecto_tienda;

-- 2. Crear Tablas

-- Tabla: CLIENTE_REGISTRADO 
CREATE TABLE CLIENTE_REGISTRADO (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Edad INT NOT NULL,
    Correo VARCHAR(100) NOT NULL UNIQUE,
    Contrasena VARCHAR(255) NOT NULL
);

-- Tabla: PROVEEDOR 
CREATE TABLE PROVEEDOR (
    ID_Proveedor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Pais VARCHAR(50)
);

-- Tabla: PRODUCTO 
CREATE TABLE PRODUCTO (
    ID_Producto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    Descripcion TEXT,
    Fecha_lanzamiento DATE,
    ID_Proveedor INT,
    FOREIGN KEY (ID_Proveedor) REFERENCES PROVEEDOR(ID_Proveedor)
);

-- Tabla: CARRITO_COMPRA 
CREATE TABLE CARRITO_COMPRA (
    ID_Articulo INT AUTO_INCREMENT PRIMARY KEY,
    Fecha_Articulo DATETIME DEFAULT CURRENT_TIMESTAMP,
    Cantidad INT NOT NULL DEFAULT 1,
    ID_Cliente INT NOT NULL,
    ID_Producto INT NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES CLIENTE_REGISTRADO(ID_Cliente),
    FOREIGN KEY (ID_Producto) REFERENCES PRODUCTO(ID_Producto)
);

-- Tabla: TRANSACCION 
CREATE TABLE TRANSACCION (
    ID_Transaccion INT AUTO_INCREMENT PRIMARY KEY,
    Fecha_Transaccion DATETIME DEFAULT CURRENT_TIMESTAMP,
    Total DECIMAL(10, 2) NOT NULL,
    ID_Cliente INT NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES CLIENTE_REGISTRADO(ID_Cliente)
);

-- Tabla: DETALLE_TRANSACCION 
CREATE TABLE DETALLE_TRANSACCION (
    Folio_Detalle_Transaccion INT AUTO_INCREMENT PRIMARY KEY,
    Cantidad INT NOT NULL,
    Subtotal DECIMAL(10, 2) NOT NULL,
    ID_Transaccion INT NOT NULL,
    ID_Producto INT NOT NULL,
    FOREIGN KEY (ID_Transaccion) REFERENCES TRANSACCION(ID_Transaccion),
    FOREIGN KEY (ID_Producto) REFERENCES PRODUCTO(ID_Producto)
);

-- 3. Insertar datos de prueba 

INSERT INTO CLIENTE_REGISTRADO (Nombre, Edad, Correo, Contrasena) VALUES 
('Carlos Mendoza', 22, 'carlos.mendoza@correo.com', '12345'),
('Ana Sofía López', 25, 'ana.lopez@correo.com', '12345'),
('Luis Fernando Ruiz', 20, 'luis.ruiz@correo.com', '12345');

INSERT INTO PROVEEDOR (Nombre, Pais) VALUES 
('Valve Corporation', 'Estados Unidos'),
('CD Projekt Red', 'Polonia'),
('Team Cherry', 'Australia');

INSERT INTO PRODUCTO (Nombre, Precio, Descripcion, Fecha_lanzamiento, ID_Proveedor) VALUES 
('Portal 2', 199.00, 'Juego de puzles y plataformas en primera persona.', '2011-04-18', 1),
('The Witcher 3: Wild Hunt', 499.00, 'RPG de mundo abierto y fantasía oscura.', '2015-05-18', 2),
('Hollow Knight', 179.99, 'Aventura de acción clásica en 2D a través de un vasto mundo interconectado.', '2017-02-24', 3);