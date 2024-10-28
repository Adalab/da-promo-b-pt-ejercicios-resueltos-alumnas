CREATE SCHEMA ejercicios_2;
USE ejercicios_2;

-- Ejercicio 1 Crear la tabla
CREATE TABLE empleada (
	id_empleada  INT NOT NULL,
    salario VARCHAR(4),
    nombre VARCHAR (15),
    apellido VARCHAR (20),
    pais VARCHAR (15),
    PRIMARY KEY (id_empleada)
	);
	
-- Ejercicio 2 
CREATE TABLE personas (
    id INT NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    nombre VARCHAR(255),
    edad INT CHECK (edad > 16),
    ciudad varchar(255) DEFAULT 'Madrid'
);

-- Ejercicio 3
CREATE TABLE Empleadas (
	id_empleada  INT NOT NULL,
    salario VARCHAR(4),
    nombre VARCHAR (15),
    apellido VARCHAR (20),
    pais VARCHAR (15),
    PRIMARY KEY (id_empleada)
	);
    
    CREATE TABLE empleadas_en_proyectos (
	id_empleadas INT NOT NULL
	id_proyecto VARCHAR (
    
    
    
    
    
-- Ejercicios segunda parte clase invertida

CREATE TABLE t1 (a INTEGER, b CHAR(10));

-- Renombra la t1 a t2
ALTER TABLE t1 RENAME TO t2;
