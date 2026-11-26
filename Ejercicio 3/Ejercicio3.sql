-- Active: 1795109759645@@127.0.0.1@3306@ejercicio3
DROP DATABASE IF EXISTS ejercicio3;

CREATE DATABASE ejercicio3;

USE ejercicio3;

CREATE TABLE clientes(
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    dni VARCHAR(9) UNIQUE NOT NULL,
    telefono VARCHAR(9),
    email VARCHAR(100) UNIQUE,
    fecha_registro DATE DEFAULT CURRENT_DATE
);

CREATE TABLE habitaciones(
    numero_habitacion INT PRIMARY KEY,
    tipo ENUM('individual', 'doble', 'suite', 'familiar'),
    capacidad INT UNSIGNED NOT NULL,
    precio_noche DECIMAL(5,2) CHECK(precio_noche > 0),
    disponible BOOLEAN DEFAULT TRUE,
    descripcion VARCHAR(200)
);

CREATE TABLE reservas(
    id_cliente INT NOT NULL,
    numero_habitacion INT NOT NULL,
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (numero_habitacion) REFERENCES habitaciones(numero_habitacion),
    fecha_entrada DATE NOT NULL,
    fecha_salida DATE NOT NULL,
    estado ENUM('confirmada', 'cancelada', 'finalizada'),
    total DECIMAL(6,2) NOT NULL
);

CREATE TABLE servicios(
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(6,2) UNSIGNED,
    descripcion VARCHAR(150) NOT NULL
);

CREATE TABLE reserva_servicios(
    id_reserva INT NOT NULL,
    id_servicio INT NOT NULL,
    FOREIGN KEY (id_reserva) REFERENCES reservas(id_reserva),
    FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio),
    cantidad INT UNSIGNED DEFAULT 1,
    subtotal DECIMAL(6,2) NOT NULL

    
)

