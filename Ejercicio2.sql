DROP DATABASE IF EXISTS veterinario;

CREATE DATABASE veterinario;

USE veterinario;

CREATE TABLE perros(
    nombre VARCHAR(25) NOT NULL,
    dni_dueño CHAR(9),
    color_pelaje VARCHAR(25),
    tipo_pelaje ENUM('corto', 'largo', 'lana')
);