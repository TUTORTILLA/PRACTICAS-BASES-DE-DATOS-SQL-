DROP DATABASE IF EXISTS veterinario;
CREATE DATABASE veterinario;
USE veterinario;
CREATE TABLE perros (
    nombre VARCHAR(25),
    dni_dueño CHAR(9),
    color_pelaje VARCHAR(25),
    tipo_pelaje ENUM('corto', 'largo', 'lana'),
    sexo ENUM('M', 'F'),
    es_adoptado BOOLEAN,
    PRIMARY KEY(nombre, dni_dueño)
);
CREATE TABLE veterinarios (
    num_colegiado CHAR(25) PRIMARY KEY,
    fecha_incorporacion DATE DEFAULT CURRENT_DATE,
    especialidad ENUM('caninos', 'felinos', 'pequeños mamíferos', 'anfibios y reptiles', 'bovinos y ovinos', 'equinos')
);
ALTER TABLE perros
    ADD COLUMN veterinario CHAR(25),
    ADD CONSTRAINT FOREIGN KEY (veterinario)
    REFERENCES veterinarios(num_colegiado)
    ON DELETE SET NULL ON UPDATE CASCADE,
    ADD COLUMN raza VARCHAR(50);
CREATE TABLE auxiliares (
    cod_auxiliar CHAR(15) PRIMARY KEY,
    hora_entrada TIME DEFAULT '09:00:00',
    hora_salida TIME DEFAULT '17:00:00',
    salario DECIMAL(7,2) DEFAULT 1400
);
CREATE TABLE al_cargo (
    veterinario CHAR(25),
    auxiliar CHAR(15),
    PRIMARY KEY(veterinario, auxiliar),
    FOREIGN KEY (veterinario)
    REFERENCES veterinarios(num_colegiado)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (auxiliar)
    REFERENCES auxiliares(cod_auxiliar)
    ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE tratamiento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_perro VARCHAR(25),
    dni_dueño CHAR(9),
    veterinario CHAR(25),
    precio DECIMAL(6,2) UNSIGNED NOT NULL,
    fecha_fin DATE DEFAULT CURRENT_DATE,
    descripcion VARCHAR(500),
    FOREIGN KEY (nombre_perro,dni_dueño)
    REFERENCES perros(nombre,dni_dueño)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (veterinario)
    REFERENCES veterinarios(num_colegiado)
    ON DELETE SET NULL ON UPDATE CASCADE
);
CREATE TABLE sala_consulta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion TEXT
);
ALTER TABLE tratamiento
    ADD COLUMN sala_consulta INT,
    ADD CONSTRAINT FOREIGN KEY (sala_consulta)
    REFERENCES sala_consulta(id)
    ON DELETE SET NULL ON UPDATE CASCADE,
    ADD COLUMN descuento INT(3) DEFAULT 0;
