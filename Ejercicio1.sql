-- Active: 1795109759645@@127.0.0.1@3306@ejercicio1
CREATE DATABASE ejercicio1;


CREATE TABLE pub(
    cod_pub INT(5) PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    licencia_fiscal CHAR(8) NOT NULL,
    domicilio VARCHAR(50),
    fecha_apertura DATE NOT NULL,
    horario VARCHAR(50) NOT NULL,
    cod_localidad INT NOT NULL
);

CREATE TABLE titular(
    dni_titular VARCHAR(8) PRIMARY KEY,
    nombre  VARCHAR(10) NOT NULL,
    domicilio VARCHAR(10),
    cod_pub INT(10) NOT NULL
);


CREATE TABLE empleado(
    dni_empleado VARCHAR(8) PRIMARY KEY,
    nombre VARCHAR(10) NOT NULL,
    domicilio VARCHAR(10)
);

CREATE TABLE existencias(
    cod_articulo INT(10) PRIMARY KEY,
    nombre VARCHAR(10) NOT NULL,
    cantidad INT UNSIGNED NOT NULL,
    precio DECIMAL(5,2) CHECK(precio > 0) NOT NULL,
    cod_pub INT NOT NULL
);

CREATE TABLE localidad(
    cod_localidad INT PRIMARY KEY,
    nombre VARCHAR(75) NOT NULL
);

CREATE TABLE pub_empleado(
    cod_pub INT, 
    dni_empleado VARCHAR(8),
    funcion ENUM('camarero', 'serguridad', 'limipieza'),
    PRIMARY KEY (cod_pub, dni_empleado, funcion)
);

ALTER TABLE pub
    ADD CONSTRAINT FOREIGN KEY (cod_localidad)
    REFERENCES localidad(cod_localidad)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE titular
    ADD CONSTRAINT FOREIGN KEY (cod_pub)
    REFERENCES pub(cod_pub)
    ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE existencias
    ADD CONSTRAINT FOREIGN KEY (cod_pub)
    REFERENCES pub(cod_pub)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE pub_empleado
    ADD CONSTRAINT FOREIGN KEY (cod_pub)
    REFERENCES pub(cod_pub)
    ON DELETE CASCADE ON UPDATE CASCADE;