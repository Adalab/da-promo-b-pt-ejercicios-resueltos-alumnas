CREATE SCHEMA `tienda_zapatillas`;
USE `tienda_zapatillas`;

CREATE TABLE Zapatillas(
	id_zapatillas INT AUTO_INCREMENT NOT NULL,
    modelo VARCHAR(45) NOT NULL,
    color VARCHAR (45) NOT NULL,
    PRIMARY KEY (id_zapatillas)
    );
    

CREATE TABLE Clientes(
	id_cliente INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    numero_telefono INT NOT NULL,
    email VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    ciudad VARCHAR(45),
    provincia VARCHAR(45) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    codigo_postal VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_cliente)
    );
    
CREATE TABLE Empleados(
	id_empleado INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    tienda VARCHAR(45) NOT NULL,
    salario INT,
    fecha_incorporacion DATE,
    PRIMARY KEY (id_empleado)
    );
    
    
CREATE TABLE Tabla_Facturas(
	id_factura INT AUTO_INCREMENT NOT NULL,
    numero_factura VARCHAR(45) NOT NULL,
    fecha DATE,
    id_zapatillas INT NOT NULL ,
		CONSTRAINT ´FK_id_zapatillas_Zapatillas´
        FOREIGN KEY (id_zapatillas)
        REFERENCES zapatillas(id_zapatillas),
    id_empleado INT NOT NULL,
		CONSTRAINT ´FK_id_empleado_Empleados´
        FOREIGN KEY (id_empleado)
        REFERENCES Empleados(id_empleado),
    id_cliente INT NOT NULL,
		CONSTRAINT ´FK_id_cliente_Clientes´
        FOREIGN KEY (id_cliente)
        REFERENCES Clientes(id_cliente),
    PRIMARY KEY(id_factura)
        );
        
        
	-- Ejercicios modificacion e insercion de datos
    
    ALTER TABLE Zapatillas -- Añadimos marca y talla a la tabla zapatillas
		ADD COLUMN marca VARCHAR(45) NOT NULL,
        ADD COLUMN talla INT NOT NULL;
    
    ALTER TABLE Empleados
		MODIFY salario FLOAT;
        
	ALTER TABLE Clientes -- Borra la columna de pais
		DROP COLUMN pais;
	
    ALTER TABLE Tabla_facturas
		ADD COLUMN total FLOAT;
    
    -- Ejercicio 2 Añadir datos
    
INSERT INTO Zapatillas (id_zapatillas, modelo, color, marca, talla)
	VALUES 
    (1, 'CQYUN', 'Negro', 'Nike', 42),
	(2, 'UOPMN', 'Rosas', 'Nike', 39),
	(3, 'OPNYT', 'Verdes', 'Adidas' , 35);


INSERT INTO Empleados (id_empleado, nombre, tienda, salario, fecha_incorporacion)
	VALUES
	(1, 'Laura', 'Alcobendas', 25987, '2010-09-03'),
	(2, 'Maria', 'Sevilla', NULL, '2001-04-11'),
	(3, 'Ester', 'Oviedo', 30165.98, '2000-11-29');
    
INSERT INTO clientes (id_cliente, nombre, numero_telefono, email, direccion, ciudad, provincia, codigo_postal)
VALUES
(1, 'Monica', 1234567289, 'monica@email.com', 'Calle Felicidad', 'Móstoles', 'Madrid', '28176'),
(2, 'Lorena', 289345678, 'lorena@email.com', 'Calle Alegria', 'Barcelona', 'Barcelona', '1246'),
(3, 'Carmen', 29846375, 'carmen@email.com', 'Calle del color', 'Vigo', 'Pontevedra', '23456')
;

INSERT INTO Tabla_Facturas (id_factura, numero_factura, fecha, id_zapatillas, id_empleado, id_cliente, total)
VALUES
(1, 123, '2001-12-11', 1, 2, 1, 54.98),
(2, 1234, '2005-05-23', 1, 1, 3, 89.91),
(3, 12345, '2015-09-18', 2, 3, 3, 76.23);