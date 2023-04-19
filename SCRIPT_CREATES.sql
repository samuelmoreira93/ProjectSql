CREATE SCHEMA Restaurante_ElPortu;
USE Restaurante_ElPortu;

# ------------------------------------  << CREACION DE TABLAS >> ------------------------------------------


CREATE TABLE CIUDAD(
	id_ciudad INTEGER NOT NULL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE DIRECCION(
	id_direccion INTEGER NOT NULL PRIMARY KEY,
    id_ciudad INTEGER NOT NULL,
    barrio VARCHAR(30) NOT NULL,
    calle_avenida VARCHAR (100) NOT NULL,
    altura INTEGER NOT NULL,
    FOREIGN KEY(id_ciudad) REFERENCES CIUDAD(id_ciudad)
);


CREATE TABLE SUCURSAL(
	id_sucursal VARCHAR(5) PRIMARY KEY,
    id_direccion INTEGER NOT NULL,
    codigo_sucursal VARCHAR(3) NOT NULL UNIQUE,
    condicion VARCHAR(15) NOT NULL,
    FOREIGN KEY(id_direccion) REFERENCES DIRECCION(id_direccion)
);

CREATE TABLE MENU(
	id_menu INTEGER PRIMARY KEY,
    id_sucursal VARCHAR(5) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    FOREIGN KEY(id_sucursal) REFERENCES SUCURSAL(id_sucursal)
);

CREATE TABLE CONSUMO(
	id_consumo INTEGER NOT NULL PRIMARY KEY,
    tipo VARCHAR (50) NOT NULL
);

CREATE TABLE SUMINISTROS(
	id_suministros INTEGER PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL UNIQUE,
    precio_unitario DECIMAL(13,2) NOT NULL,
    CHECK(nombre NOT LIKE '%[0-9@$%?-_!()=+#]%' AND precio_unitario > 0)
);


CREATE TABLE INVENTARIO(
	id_inventario INTEGER PRIMARY KEY,
    id_sucursal VARCHAR(5) NOT NULL,
    id_suministros INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    FOREIGN KEY(id_sucursal) REFERENCES SUCURSAL(id_sucursal),
    FOREIGN KEY(id_suministros) REFERENCES SUMINISTROS(id_suministros),
    UNIQUE(id_sucursal,id_suministros)
);


CREATE TABLE TIPO_INGREDIENTES(
	id_tipoingrediente INTEGER PRIMARY KEY,
    tipo VARCHAR(30) NOT NULL UNIQUE,
    CHECK(tipo NOT LIKE '%[0-9@$%?-_!()=+#]%')
);


CREATE TABLE INGREDIENTES(
	id_ingredientes INTEGER PRIMARY KEY,
    fecha_vencimiento DATE NOT NULL,
    id_tipoingrediente INTEGER NOT NULL,
    id_suministros INTEGER NOT NULL,
    FOREIGN KEY(id_tipoingrediente) REFERENCES TIPO_INGREDIENTES(id_tipoingrediente),
    FOREIGN KEY(id_suministros) REFERENCES SUMINISTROS(id_suministros)
);

CREATE TABLE MESAS(
	num_mesa INTEGER PRIMARY KEY,
    capacidad INTEGER NOT NULL,
    estado VARCHAR(10),
    mesa_VIP BIT NOT NULL DEFAULT 0,
    reservada BIT NOT NULL DEFAULT 0,
    id_sucursal VARCHAR(5) NOT NULL,
    FOREIGN KEY(id_sucursal) REFERENCES SUCURSAL(id_sucursal),
    CHECK(capacidad > 1 AND estado IN ('Ocupado','Disponible'))
);


CREATE TABLE PEDIDO(
	id_pedido VARCHAR(5) PRIMARY KEY,
    id_sucursal VARCHAR(5) NOT NULL,
    fecha_pedido DATE NOT NULL,
    id_consumo INTEGER NOT NULL,
    hora_Pedido TIME NOT NULL,
    FOREIGN KEY(id_sucursal) REFERENCES SUCURSAL(id_sucursal),
    FOREIGN KEY(id_consumo) REFERENCES CONSUMO(id_consumo)
);

CREATE TABLE COMER_AQUI(
	id_comeraqui VARCHAR(5) PRIMARY KEY,
    id_consumo INTEGER NOT NULL REFERENCES CONSUMO(id_consumo),
    num_mesa INTEGER NOT NULL,
	FOREIGN KEY(id_consumo) REFERENCES CONSUMO(id_consumo),
    FOREIGN KEY(num_mesa) REFERENCES MESAS(num_mesa)
);

CREATE TABLE DELIVERY(
	id_delivery VARCHAR(5) PRIMARY KEY,
    id_consumo INTEGER NOT NULL,
    tiempo_entrega TIME NOT NULL,
    gasto_envio DECIMAL(13,2) NOT NULL,
    FOREIGN KEY(id_consumo) REFERENCES CONSUMO(id_consumo)
);


CREATE TABLE PERSONAS(
	id_persona INT PRIMARY KEY,
    primer_nombre VARCHAR(50) NOT NULL,
    segundo_nombre VARCHAR(50),
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50),
    fecha_nacimiento DATE NOT NULL,
    sexo VARCHAR (10) NOT NULL CHECK(sexo IN('Masculino','Femenino')),
    estado_civil VARCHAR(10) CHECK(estado_civil IN('Soltero','Casado')),
    email VARCHAR(150) UNIQUE,
    CHECK(primer_nombre NOT LIKE '%[0-9@$%?-_!()=+#]%' AND segundo_nombre NOT LIKE '%[0-9@$%?-_!()=+#]%'
		AND primer_apellido NOT LIKE '%[0-9@$%?-_!()=+#]%' AND segundo_apellido NOT LIKE '%[0-9@$%?-_!()=+#]%'
        AND email LIKE '%_@_%._%')
    
);


CREATE TABLE TELEFONO(
	id_telefono INT PRIMARY KEY,
    num_telefono VARCHAR(10) UNIQUE NOT NULL

);


CREATE TABLE CARGO(
	id_cargo INT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL UNIQUE,
    CHECK(nombre NOT LIKE '%[0-9@$%?-_!()=+#]%')
    
);

CREATE TABLE EMPLEADO(
	id_empleado VARCHAR(5) PRIMARY KEY,
    id_persona INT NOT NULL REFERENCES PERSONAS(id_persona),
    id_sucursal VARCHAR(5) NOT NULL REFERENCES SUCURSAL(id_sucursal),
    id_cargo INT NOT NULL REFERENCES CARGO(id_cargo),
    dni VARCHAR(10) NOT NULL UNIQUE,
    sueldo DECIMAL(13,2) NOT NULL,
    estado_contrato VARCHAR(15) NOT NULL
    CHECK(estado_contrato IN('Contratado','Despedido'))
    
);

CREATE TABLE JORNADA_LABORAL (
	id_jornada INT PRIMARY KEY,
    tipo VARCHAR(10) NOT NULL UNIQUE,
    horario_entrada TIME NOT NULL UNIQUE,
    horario_salida TIME NOT NULL UNIQUE
    
);


CREATE TABLE JORNADA_EMPLEADO (
	id_empleado VARCHAR(5) NOT NULL REFERENCES EMPLEADO(id_empleado),
    id_jornada INT NOT NULL REFERENCES JORNADA_LABORAL(id_jornada),
    PRIMARY KEY (id_empleado, id_jornada)
    
);


CREATE TABLE CLIENTE(
	id_cliente VARCHAR(5) PRIMARY KEY,
    vip BIT NOT NULL DEFAULT 0,
    CHECK(vip IN (0,1))

);



CREATE TABLE RESERVACION (
	id_reservacion INT PRIMARY KEY,
    id_cliente VARCHAR(5) NOT NULL REFERENCES CLIENTE(id_cliente),
    hora TIME NOT NULL,
    fecha DATE NOT NULL,
    cantidad_personas INT NOT NULL,
    estado VARCHAR(10) CHECK(estado IN('CANCELADO','PENDIENTE')),
    UNIQUE(id_cliente,hora,fecha)
);

CREATE TABLE TIPO_PAGO(
	id_pago INT PRIMARY KEY,
    tipo VARCHAR(30) NOT NULL UNIQUE
    
);

CREATE TABLE FACTURA(
	id_factura VARCHAR(5) PRIMARY KEY,
    id_pedido VARCHAR(5) NOT NULL REFERENCES PEDIDO(id_pedido),
    id_pago INT NOT NULL REFERENCES TIPO_PAGO(id_pago),
    correo_empresa VARCHAR(150) NOT NULL DEFAULT 'restoelportu@gmail.com',
    cuit VARCHAR(13) NOT NULL DEFAULT '1045389571359',
    nombre_empresa VARCHAR (20) NOT NULL DEFAULT 'RESTAURANTE ELPORTU',
    doc_cliente VARCHAR(13) NOT NULL,
    num_factura VARCHAR(8) NOT NULL,
    fecha_factura DATE NOT NULL

);


# ------------------------------------  << CREACION DE VISTAS >> ------------------------------------------
-- VISTA 1

CREATE VIEW LISTA_SUCURSAL
AS
SELECT id_sucursal, id_direccion, codigo_sucursal FROM SUCURSAL;

SELECT * FROM LISTA_SUCURSAL;

-- VISTA 2

CREATE VIEW LISTA_SUMINISTROS
AS
SELECT id_suministros, nombre FROM SUMINISTROS;

SELECT * FROM LISTA_SUMINISTROS;

-- VISTA 3

CREATE VIEW LISTA_DELIVERY
AS
SELECT id_delivery, id_consumo, tiempo_entrega FROM DELIVERY;

SELECT * FROM LISTA_DELIVERY;

-- VISTA 4

CREATE VIEW LISTA_EMPLEADOS
AS
SELECT id_empleado, id_sucursal, id_persona, id_cargo, estado_contrato FROM EMPLEADO;

SELECT * FROM LISTA_EMPLEADOS;


-- VISTA 5

CREATE VIEW LISTA_INVENTARIO
AS
SELECT id_inventario, id_sucursal, id_suministros FROM INVENTARIO;

SELECT * FROM LISTA_INVENTARIO


# ------------------------------------  << CREACION DE FUNCIONES >> ------------------------------------------

-- FUNCION 1

DELIMITER $$
CREATE FUNCTION IDENTIDAD_EMPLEADO(idt_empleado VARCHAR(50))
  RETURNS INT
  DETERMINISTIC
BEGIN
  DECLARE IDENTIDAD INT;
  
  SET IDENTIDAD = (
    SELECT COUNT(*) 
    FROM PERSONAS 
    WHERE PERSONAS.sexo = idt_empleado);
    
  RETURN IDENTIDAD;
END$$

-- Retorna cuantos empleados son 'Masculinos' o 'Femenino'
SELECT IDENTIDAD_EMPLEADO('Femenino');


# ------------------------------------  << CREACION DE STORE PROCEDURES >> ------------------------------------------

-- INSERTA DATOS EN LA TABLA TIPO DE INGREDIENTES

DELIMITER //
CREATE PROCEDURE INSERTAR (IN id_tipoingrediente INT, tipo VARCHAR(20))
BEGIN
	INSERT INTO TIPO_INGREDIENTES (id_tipoingrediente, tipo) VALUES (id_tipoingrediente, tipo);
END//





-- ORDENA DE FORMA ASCENDENTE O DESCENDENTE LOS DATOS DE LA TABLA EMPLEADO
-- DEPENDIENTE DE LOS PARAMETROS QUE LE PASEMOS
-- NO IMPORTA SI LE PASAMOS MAYUSCULAS O MINUSCULAS

DELIMITER //
CREATE PROCEDURE ORDENAR (IN columna VARCHAR(20),IN condicion VARCHAR(5))
BEGIN
	SELECT * FROM EMPLEADO
    ORDER BY
    CASE WHEN columna = LCASE('id_empleado') AND condicion = UCASE('ASC') THEN id_empleado END,
    CASE WHEN columna = LCASE('id_empleado') AND condicion = UCASE('DESC') THEN id_empleado END DESC,
	CASE WHEN columna = LCASE('id_persona') AND condicion = UCASE('ASC') THEN id_persona END,
    CASE WHEN columna = LCASE('id_persona') AND condicion = UCASE('DESC') THEN id_persona END DESC,
    CASE WHEN columna = LCASE('id_sucursal') AND condicion = UCASE('ASC') THEN id_sucursal END,
    CASE WHEN columna = LCASE('id_sucursal') AND condicion = UCASE('DESC') THEN id_sucursal END DESC,
	CASE WHEN columna = LCASE('id_cargo') AND condicion = UCASE('ASC') THEN id_cargo END,
    CASE WHEN columna = LCASE('id_cargo') AND condicion = UCASE('DESC') THEN id_cargo END DESC,
    CASE WHEN columna = LCASE('dni') AND condicion = UCASE('ASC') THEN dni END,
    CASE WHEN columna = LCASE('dni') AND condicion = UCASE('DESC') THEN dni END DESC,
	CASE WHEN columna = LCASE('sueldo') AND condicion = UCASE('ASC') THEN sueldo END,
    CASE WHEN columna = LCASE('sueldo') AND condicion = UCASE('DESC') THEN sueldo END DESC,
	CASE WHEN columna = LCASE('estado_contrato') AND condicion = UCASE('ASC') THEN estado_contrato END,
    CASE WHEN columna = LCASE('estado_contrato') AND condicion = UCASE('DESC') THEN estado_contrato END DESC;

END//


# ------------------------------------  << CREACION DE TRIGGERS >> ------------------------------------------

--  TRIGGER DE INGREDIENTES 

-- TABLA DE AUDITORIA PARA INGREDIENTES
CREATE TABLE audit_tipo_ingredientes (
	id_audit INT PRIMARY KEY AUTO_INCREMENT,
    entity VARCHAR (100),
	id_entity INT,
    insert_dt DATETIME,
    created_by VARCHAR(100),
    last_update_dt DATETIME,
    last_update_by VARCHAR(100)
);
#SELECT * FROM audit_tipo_ingredientes;




-- REGISTRA QUE LOS INGRESOS DE NUEVOS INGREDIENTES
-- NO ESTEN REGISTRADO EN LA TABLA
DELIMITER //
CREATE TRIGGER tr_check_ingredientes
BEFORE INSERT ON TIPO_INGREDIENTES
FOR EACH ROW
BEGIN
	IF NEW.id_tipoingrediente <> NEW.id_tipoingrediente AND NEW.tipo <> NEW.tipo
		THEN
			SET NEW.tipo = NEW.tipo;
    END IF;

END //


-- REGISTRA LOS INGRESOS DE NUEVOS INGREDIENTES
-- ESPECIFICANDO QUE, QUIEN Y CUANDO SE HIZO EL INGRESO
DELIMITER %%
CREATE TRIGGER tr_insert_ingredientes
AFTER INSERT ON TIPO_INGREDIENTES
FOR EACH ROW
BEGIN
	INSERT INTO audit_tipo_ingredientes (entity, id_entity, insert_dt, created_by, last_update_dt, last_update_by)
	VALUES ('TIPO_INGREDIENTES', NEW.id_tipoingrediente, CURRENT_TIMESTAMP(), USER(), CURRENT_TIMESTAMP(), USER());
    
END %%

#INSERT INTO TIPO_INGREDIENTES (id_tipoingrediente, tipo)
#VALUES (08,'SIN_TAC');

#SELECT * FROM TIPO_INGREDIENTES;



-- TRIGGER DE PAGOS 

-- TABLA DE AUDITORIA PARA PAGOS
CREATE TABLE audit_tipo_pago (
	id_audit INT PRIMARY KEY AUTO_INCREMENT,
    entity VARCHAR (100),
	id_entity INT,
    insert_dt DATETIME,
    created_by VARCHAR(100),
    last_update_dt DATETIME,
    last_update_by VARCHAR(100)
);

#SELECT * FROM audit_tipo_pago;



-- CONTROLA QUE EL ID Y EL TIPO NO EXISTAN
-- EN LA TABLA TIPO_PAGO, EN CASO DE SER SI LO AGREGA
-- EN CASO CONTRARIO MANDA UN ERROR

DELIMITER $$
CREATE TRIGGER tr_check_tipos_pagos
BEFORE INSERT ON TIPO_PAGO
FOR EACH ROW
BEGIN
	IF NEW.id_pago <> NEW.id_pago AND NEW.tipo <> NEW.tipo
		THEN
			SET NEW.tipo = NEW.tipo;
    END IF;

END $$


-- REGISTRA LOS INGRESOS DE NUEVOS METODOS DE PAGO
-- ESPECIFICANDO QUE, QUIEN Y CUANDO SE HIZO EL INGRESO
DELIMITER %%
CREATE TRIGGER tr_insert_tipos_pagos
AFTER INSERT ON TIPO_PAGO
FOR EACH ROW
BEGIN
	INSERT INTO audit_tipo_pago (entity, id_entity, insert_dt, created_by, last_update_dt, last_update_by)
	VALUES ('TIPO_PAGO', NEW.id_pago, CURRENT_TIMESTAMP(), USER(), CURRENT_TIMESTAMP(), USER());
    
END %%

#INSERT INTO TIPO_PAGO VALUES (6,'VOUCHES');
#SELECT * FROM TIPO_PAGO;

