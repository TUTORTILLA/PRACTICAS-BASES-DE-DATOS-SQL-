-- Active: 1795028739374@@127.0.0.1@3306@empleados
-- Active: 1795028739374@@127.0.0.1@3306@empleados
CREATE DATABASE empleados;

CREATE TABLE empleados(
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    salario DECIMAL(7,2),
    departamento VARCHAR(50) NOT NULL
);


ALTER TABLE empleados
    ADD fecha_contrato DATE,
    ADD CONSTRAINT UNIQUE(nombre);

ALTER TABLE empleados
    MODIFY salario DECIMAL(7,2);

ALTER TABLE empleados
    DROP departamento;


CREATE INDEX salario_empleados
    ON empleados(salario);

DROP INDEX salario_empleados
    ON empleados;

CREATE VIEW empleados_por_departamento AS
    SELECT nombre, salario
    FROM empleados
    ORDER BY 2; 

DROP VIEW empleados_por_departamento;

DROP TABLE empleados;