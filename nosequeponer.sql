/*DDL */

/*Crea una nueva base de datos llamada delivery_db.*/

CREATE DATABASE delibery_db;
USE delibery_db;
/*
Ejercicio 2: Crear la Tabla Usuarios
Crea la tabla Usuarios con los siguientes campos:
ID: INT, clave primaria, autoincremental.
Nombre: VARCHAR(100), no puede ser nulo.
Email: VARCHAR(100), debe ser unico y no nulo.
Telefono: VARCHAR(20).
Direccion: VARCHAR(255), no puede ser nulo
*/
CREATE TABLE Usuarios(
     ID INT PRIMARY KEY AUTO_INCREMENT,
     Nombre VARCHAR(100) NOT NULL,
     Email VARCHAR(100) UNIQUE NOT NULL,
	 Telefono VARCHAR(20),
     Direccion VARCHAR(255) NOT NULL
);

CREATE TABLE Restaurantes(
     ID INT PRIMARY KEY AUTO_INCREMENT,
     Nombre VARCHAR(100) NOT NULL,
     Direccion VARCHAR(255) NOT NULL UNIQUE,
	 Telefono VARCHAR(20) NOT NULL
);

/*
Ejercicio 4: Crear la Tabla Productos con Clave Foranean
Crea la tabla Productos y asegurate de que restaurante_id sea una clave foranea que haga referencia al id de la tabla restaurantes.
ID: INT, Clave primaria, autoincremental.
Restaurante_id: INT, no puede ser nulo
Nombre: VARCHAR(100), no puede ser nulo
Descripcion: TEXT
Precio: Decimal(10, 2), no puede ser nulo
*/

CREATE TABLE Productos(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Restaurante_id INT,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    Precio DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Restaurante_id) REFERENCES Restaurantes(ID)
);

-- Tabla para registrar los pedidos. Se relaciona con usuarios y restaurantes.

CREATE TABLE Pedidos(
    ID INT PRIMARY KEY AUTO_INCREMENT, 
    Usuario_id INT NOT NULL,
	Restaurante_id INT,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Estado VARCHAR(50) DEFAULT 'Pendiente', -- Ej: Pendiente, En camino, Entregado, Cancelado
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(ID),
    FOREIGN KEY (Restaurante_id) REFERENCES Restaurantes(ID)
);

-- Tabla de "carrito de compras". Almacena que productos van en cada pedido.
CREATE TABLE Detalles_Pedido(
    ID INT PRIMARY KEY AUTO_INCREMENT, 
    Usuario_id INT NOT NULL,
    Producto_id INT NOT NULL,
    Cantidad INT NOT NULL,
    Precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(id),
    FOREIGN KEY (producto_id) REFERENCES Productos(id)
);