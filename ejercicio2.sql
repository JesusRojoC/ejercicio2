-- ESTRUCTURA DE LA BASE DE DATOS - INICIO
CREATE TABLE CLIENTES (
    
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    ciudad VARCHAR(45) NOT NULL,
    domicilio VARCHAR(100) NOT NULL,
    fecha_nac DATE NOT NULL,
    fecha_reg DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    vendedor INT
);


CREATE TABLE CONTACTOS(
    id INT NOT NULL,
    numero_telefonico VARCHAR(100) NOT NULL,
    correo VARCHAR(45) NOT NULL,
    
    CONSTRAINT fk_cliente_id FOREIGN KEY (id) REFERENCES CLIENTES (id),
    CONSTRAINT fk_vendedor_id FOREIGN KEY (id) REFERENCES VENDEDOR (id)
);

CREATE TABLE VENDEDOR (
    
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    ciudad VARCHAR(45) NOT NULL,
    domicilio VARCHAR(100) NOT NULL,
    fecha_nac DATE NOT NULL,
    id_tienda INT NOT NULL,
    CONSTRAINT fk_tienda_vendedor FOREIGN KEY (id_tienda) REFERENCES TIENDA (id)
);

CREATE TABLE TIENDA(
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    pais VARCHAR(45) NOT NULL,
    ciudad VARCHAR(45) NOT NULL,
    domicilio VARCHAR(100) NOT NULL  
);

-- ESTRUCTURA DE LA BASE DE DATOS - FIN


-- INSERTAR DATOS - INICIO
INSERT INTO TIENDA(pais, ciudad, domicilio)
VALUES
("Mexico", "Guadalajara", "Calle 1"),
("Mexico", "CDMX", "Calle 2");

INSERT INTO VENDEDOR(nombre, apellidos,pais, ciudad, domicilio, fecha_nac, id_tienda)
VALUES
("Francisco", "Ramirez", "Mexico", "Guadalajara", "Calle 4", "1976/12/16", 1),
("Jose", "Cardenas", "Mexico", "Guadalajara", "Calle 51", "1998/12/01", 1),
("Francisco", "Rojo", "Mexico", "Guadalajara", "Calle 14", "1998/12/16", 1),
("Camilo", "Perez", "Mexico", "CDMX", "Calle 134", "1989/12/26", 2),
("Francisco", "Cardenas", "Mexico", "CDMX", "Calle 4", "1976/12/16", 2),
("Jesus", "Rubio", "Mexico", "CDMX", "Calle 11", "1988/12/16", 2),
("Francisco", "Cardenas", "Mexico", "CDMX", "Calle 4", "1976/12/16", 2);

INSERT INTO CLIENTES(nombre, apellidos, pais, ciudad, domicilio, fecha_nac, fecha_reg, vendedor)
VALUES
("Maria", "Ramirez", "Mexico","CDMX","callee 302", "1990/12/09",now(), 4),
("Brenda", "Rubio", "Mexico","CDMX","calle 02", "1980/12/09",now(), 5),
("Jose", "Villa", "Mexico","CDMX","calle 092", "1991/12/29",now(), 6)

("Karen", "Reyes", "Mexico","Guadalajara","calee 32", "1990/12/09",now(), 2),
("Pedro", "Reyes", "Mexico","Guadalajara","calle 102", "1990/12/09",now(), 3),
("Juan", "Reyes", "Mexico","Guadalajara","calle 132", "1990/12/29",now(), 1);

INSERT INTO CONTACTOS(id, numero_telefonico, correo) 
VALUES

(2, "33440088", "micorreo@gmail.com"),
(3, "33449977", "hola2@gmail.com"),
(4, "38749988", "correo@gmail.com"),
(5, "33019988", "hi@gmail.com"),
(6, "33449098", "hola_9@gmail.com"),
(1, "33449988", "hola@gmail.com");


-- INSERTAR DATOS - FIN


-- OBTENER CANTIDAD DE VENDEDORES Y CLIENTES
SELECT TIENDA.id as tienda, COUNT(VENDEDOR.id) as SUMA_VENDEDORES, COUNT(CLIENTES.id) AS SUMA_CLIENTES
FROM TIENDA JOIN VENDEDOR ON TIENDA.ID = VENDEDOR.id_tienda 
JOIN CLIENTES ON CLIENTES.vendedor = VENDEDOR.ID
GROUP BY TIENDA.id;

-- INSERTAR UN NUEVO CLIENTE
INSERT INTO CLIENTES(nombre, apellidos, pais, ciudad, domicilio, fecha_nac, fecha_reg, vendedor)
VALUES
("Marta", "Rojas", "Mexico","CDMX","callee 1302", "1970/12/09",now(), 4);

-- MODIFICAR INFORMACIÓN DE VENDEDOR
UPDATE VENDEDOR SET nombre = "Ramiro" where id = 2;

-- ELIMINAR CONTACTO DE UNCLIENTE
DELETE FROM CONTACTOS WHERE id = 1;

-- Generar una consulta para obtener a los vendedores que tenga clientes que se hayan registrado sobre el mes en curso
SELECT * FROM CLIENTES WHERE MONTH(fecha_reg) = MONTH(NOW());

