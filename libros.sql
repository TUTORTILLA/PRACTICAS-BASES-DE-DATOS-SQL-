-- Active: 1795028739374@@127.0.0.1@3306@libros
CREATE DATABASE IF NOT EXISTS libro;

CREATE TABLE libros(
    id INT(3),
    título VARCHAR(20) PRIMARY KEY ,
    autor VARCHAR(20),
    año INT(4),
    páginas VARCHAR(2000),
    editorial VARCHAR(20)
);


#Agregar nueva columna

ALTER TABLE libros
    ADD precio DECIMAL(5,2) DEFAULT '10';


ALTER Table libros
    DROP editorial; 

CREATE INDEX libros_por_autor
    ON libros(autor);

DROP INDEX libros_por_autor
    ON libros;


CREATE VIEW libros_populares AS
    SELECT titulo, autor, puntuación;
    FROM libros,
    WHERE puntuación >= 8;

DROP VIEW libros_populares; 





