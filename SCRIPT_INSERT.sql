USE Restaurante_ElPortu;

INSERT INTO CIUDAD (id_ciudad, nombre) VALUE
	(1,'Buenos Aires'),
	(2,'Cordoba'),
    (3,'Mendonza')
    
    ;
    
INSERT INTO DIRECCION (id_direccion, id_ciudad, barrio, calle_avenida, altura) VALUES 
	(1001,1,'Caballito','Av.Belgrano',2585),
    (1002,2,'Santa Marina','Av.Hipolito Yrigoyen',3200),
    (1003,3,'La Paz','Av.San Martin',1235)
    
    ;
    
INSERT INTO SUCURSAL (id_sucursal, id_direccion, codigo_sucursal, condicion) VALUES
	('BUE01',1001,'001','Funcionando'),
    ('COR02',1002,'002','Funcionando'),
    ('MEN03',1003,'003','Funcionando')
    ;
        

INSERT INTO MENU (id_menu, id_sucursal, nombre) VALUES
	(101,'BUE01','BACALAO GUISADO'),
    (102,'BUE01','FRANCESINHA'),
    (103,'BUE01','FEIJOADA'),
    (104,'BUE01','ALHEIRAS'),
    (105,'BUE01','BIFANAS'),
    
    (201,'COR02','BACALAO GUISADO'),
    (202,'COR02','FRANCESINHA'),
    (203,'COR02','FEIJOADA'),
    (204,'COR02','ALHEIRAS'),
    (205,'COR02','BIFANAS'),
    
    (301,'MEN03','BACALAO GUISADO'),
    (302,'MEN03','FRANCESINHA'),
    (303,'MEN03','FEIJOADA'),
    (304,'MEN03','ALHEIRAS'),
    (305,'MEN03','BIFANAS')
    
    ;
    
INSERT INTO CONSUMO (id_consumo, tipo) VALUES 
	(1,'DELIVERY'),
	(2,'COMER AQUI')
    
    ;
    
INSERT INTO SUMINISTROS (id_suministros, nombre, precio_unitario) VALUES
	(10,'PEZ',80.00),
    (20,'TOCINO',16.00),
    (30,'CERVEZA',5.00),
    (40,'POROTOS',20.00),
    (50,'VINO',75.00),
    (60,'CHORIZO',5.00)
    
    ;
    

INSERT INTO INVENTARIO (id_inventario, id_sucursal, id_suministros, cantidad) VALUES 
	(1,'BUE01',10,42),
    (2,'BUE01',20,38),
    (3,'BUE01',30,22),
    (4,'BUE01',40,50),
    (5,'BUE01',50,15),
    (6,'BUE01',60,16),
    
	(11,'COR02',10,50),
    (22,'COR02',20,15),
    (33,'COR02',30,30),
    (44,'COR02',40,16),
    (55,'COR02',50,25),
    (66,'COR02',60,10),
    
	(111,'MEN03',10,22),
    (222,'MEN03',20,20),
    (333,'MEN03',30,42),
    (444,'MEN03',40,18),
    (555,'MEN03',50,40),
    (666,'MEN03',60,25)
    
    ;
    
INSERT INTO TIPO_INGREDIENTES (id_tipoingrediente, tipo) VALUES
	(01,'MAR'),
    (02,'BEBIDAS CON ALCOHOL'),
    (03,'CARNICERIA'),
    (04,'LEGUMBRES')
	;
    
INSERT INTO INGREDIENTES (id_ingredientes, fecha_vencimiento, id_tipoingrediente, id_suministros) VALUES
	(1,'2023-08-12',01,10),
    (2,'2023-06-28',01,10),
    (3,'2024-03-15',01,10),
    (4,'2024-08-02',01,10),
    (5,'2024-12-19',01,10),
    (6,'2023-06-22',01,10)
    
    ;
    
INSERT INTO MESAS (num_mesa, capacidad, estado, mesa_VIP, reservada, id_sucursal) VALUES 
	(1,4,'DISPONIBLE',0,0,'BUE01'),
    (2,4,'DISPONIBLE',0,0,'BUE01'),
    (3,4,'DISPONIBLE',0,0,'BUE01'),
    (4,4,'DISPONIBLE',1,0,'BUE01'),
    (5,4,'DISPONIBLE',1,0,'BUE01'),
    
	(11,4,'DISPONIBLE',0,0,'COR02'),
    (22,4,'DISPONIBLE',0,0,'COR02'),
    (33,4,'DISPONIBLE',0,0,'COR02'),
    (44,4,'DISPONIBLE',1,0,'COR02'),
    (55,4,'DISPONIBLE',1,0,'COR02'),
    
	(111,4,'DISPONIBLE',0,0,'MEN03'),
    (222,4,'DISPONIBLE',0,0,'MEN03'),
    (333,4,'DISPONIBLE',0,0,'MEN03'),
    (444,4,'DISPONIBLE',1,0,'MEN03'),
    (555,4,'DISPONIBLE',1,0,'MEN03')
    
    ;
    
INSERT INTO PEDIDO (id_pedido, id_sucursal, fecha_pedido, id_consumo, hora_Pedido) VALUES
	('BP001','BUE01','2023-03-03',1,'19:20:00'),
    ('BP002','BUE01','2023-03-03',1,'19:30:25'),
    ('BP003','BUE01','2023-03-03',1,'19:45:51'),
    ('BP004','BUE01','2023-03-03',1,'19:59:10'),
    
    ('CP001','COR02','2023-03-04',1,'20:15:30'),
    ('CP002','COR02','2023-03-04',1,'20:35:12'),
    ('CP003','COR02','2023-03-04',1,'20:39:59'),
    ('CP004','COR02','2023-03-04',1,'20:58:10'),
    
    ('MP001','MEN03','2023-03-05',1,'19:30:12'),
    ('MP002','MEN03','2023-03-05',1,'20:10:45'),
    ('MP003','MEN03','2023-03-05',1,'20:40:16'),
    ('MP004','MEN03','2023-03-05',1,'21:10:37')
    
    ;
    
INSERT INTO COMER_AQUI (id_comeraqui, id_consumo, num_mesa) VALUES
	('CA001',2,1),
    ('CA002',2,2),
    ('CA003',2,3),
    ('CA004',2,4),
    ('CA005',2,5),
    
    ('CA011',2,1),
    ('CA022',2,2),
    ('CA033',2,3),
    ('CA044',2,4),
    ('CA055',2,5),
    
    ('CA111',2,1),
    ('CA222',2,2),
    ('CA333',2,3),
    ('CA444',2,4),
    ('CA555',2,5)
    
    ;
    
INSERT INTO DELIVERY (id_delivery, id_consumo, tiempo_entrega, gasto_envio) VALUE
	('DL001',1,'19:45:58',50.00),
    ('DL002',1,'20:18:30',25.00),
    ('DL003',1,'20:35:21',17.00),
    ('DL004',1,'21:15:42',100.00),
    ('DL005',1,'21:50:12',30.00)
    
    ;
    
    
INSERT INTO PERSONAS (id_persona, primer_nombre, primer_apellido, fecha_nacimiento, sexo, estado_civil, email) VALUE
	(01,'MIGUEL','ANZOLA','1978-12-05','Masculino','Casado','MIGUELANZOLA@GMAIL.COM'),
    (02,'MARIA','ROSE','1990-05-10','Femenino','Soltero','MARIA@HOTMAIL.COM'),
    (03,'CARLOS','GUTIERREZ','1990-04-08','Masculino','Casado','CARLOS@GMAIL.COM'),
    (04,'FRANCISCO','CALLEJAS','1980-08-05','Masculino','Casado','FRANLLEJAS@GMAIL.COM'),
    (05,'ANA','LOPEZ','1985-10-25','Femenino','Soltero','LOPEZANA@GMAIL.COM'),
    (06,'JOSE','PERALTA','1990-01-28','Masculino','Casado','JOSEP@GMAIL.COM'),
    (07,'ROBERTO','GALANTE','1993-12-28','Masculino','Soltero','GALANT@GMAIL.COM'),
    (08,'DAYANA','SILVA','1989-08-18','Femenino','Casado','SILDAYA@GMAIL.COM'),
    (09,'ROMINA','CITTA','1991-06-16','Femenino','Casado','ROCITTA@GMAIL.COM'),
    (10,'LEONARDO','GOMEZ','1995-09-25','Masculino','Soltero','GOMEZLEO@GMAIL.COM'),
    (11,'ESTEFANY','MENDOZA','1990-02-15','Femenino','Soltero','TETYMENDOZA@GMAIL.COM'),
    (12,'GASTON','TOVAR','1992-09-13','Masculino','Casado','GASTI@HOTMAIL.COM'),
    (13,'OSCAR','GARCIA','1978-04-11','Masculino','Casado','OSCGAR@HOTMAIL.COM'),
    (14,'SARA','PASTRANI','1999-10-21','Femenino','Soltero','PASTRANI@GMAIL.COM'),
    (15,'KENY','ANGULO','1978-02-20','Masculino','Casado','ANGULOKEN@GMAIL.COM')
    
    ;
    
    
INSERT INTO TELEFONO (id_telefono, num_telefono) VALUES
	(01,'1144662211'),
    (02,'1149691828'),
    (03,'1155213415'),
    (04,'1123851647'),
    (05,'1116283455'),
    (06,'1159651428'),
    (07,'1133052215'),
    (08,'1118293478'),
    (09,'1198756548'),
    (10,'1158910325'),
    (11,'1135097412'),
    (12,'1122980574'),
    (13,'1133770897'),
    (14,'1170580690'),
    (15,'1140589703')
    
    ;
    
INSERT INTO CARGO (id_cargo, nombre) VALUES
	(1,'GERENTE'),
    (2,'SUPERVISOR'),
    (3,'MESERO'),
    (4,'CAJERO'),
    (5,'COCINERO')
    
    ;
    
INSERT INTO EMPLEADO (id_empleado, id_persona, id_sucursal, id_cargo, dni, sueldo, estado_contrato) VALUES
	('EMP01',01,'BUE01',1,'25.355.178',380000.00,'Contratado'),
    ('EMP02',02,'BUE01',2,'30.175.228',290000.00,'Contratado'),
    ('EMP03',03,'BUE01',3,'45.205.123',180000.00,'Despedido'),
    ('EMP04',04,'BUE01',4,'63.852.111',200000.00,'Contratado'),
    ('EMP05',05,'BUE01',5,'95.680.597',220000.00,'Contratado'),
    
    ('EMP06',06,'COR02',1,'14.908.140',380000.00,'Contratado'),
    ('EMP07',07,'COR02',2,'25.125.441',290000.00,'Despedido'),
    ('EMP08',08,'COR02',3,'97.325.001',180000.00,'Contratado'),
    ('EMP09',09,'COR02',4,'99.158.785',200000.00,'Contratado'),
    ('EMP10',10,'COR02',5,'64.258.472',220000.00,'Contratado'),
    
    ('EMP11',11,'MEN03',1,'50.125.325',380000.00,'Contratado'),
    ('EMP12',12,'MEN03',2,'35.258.125',290000.00,'Contratado'),
    ('EMP13',13,'MEN03',3,'22.258.125',180000.00,'Contratado'),
    ('EMP14',14,'MEN03',4,'24.125.854',200000.00,'Contratado'),
    ('EMP15',15,'MEN03',5,'40.852.456',220000.00,'Contratado')
    
    ;
    
    
INSERT INTO JORNADA_LABORAL (id_jornada, tipo, horario_entrada, horario_salida) VALUES
	(1,'DIA','08:00:00','15:00:00'),
    (2,'NOCHE','15:00:00','23:00:00')
    
	;

INSERT INTO JORNADA_EMPLEADO VALUES
	('EMP01',1),
    ('EMP02',2),
    ('EMP04',2),
    ('EMP05',1),
    
    ('EMP06',2),
    ('EMP08',2),
    ('EMP09',2),
    ('EMP10',1),
    
    ('EMP11',1),
    ('EMP12',1),
    ('EMP13',1),
    ('EMP14',2),
    ('EMP15',2)
    
    ;
    
    
INSERT INTO CLIENTE (id_cliente, vip) VALUES
	('CC001',0),
    ('CC002',1),
    ('CC003',0)
    
	;
    
    
INSERT INTO RESERVACION (id_reservacion, id_cliente, hora, fecha, cantidad_personas, estado) VALUES
	(1,'CC001','18:23:00','2023-03-18',4,'PENDIENTE'),
    (2,'CC002','21:00:00','2023-03-25',7,'CANCELADO'),
	(3,'CC003','15:30:00','2023-04-08',4,'PENDIENTE')
    
    ;
    
INSERT INTO TIPO_PAGO (id_pago, tipo) VALUES
	(1,'EFECTIVO'),
    (2,'TARJETA DE CREDITO'),
    (3,'MERCADO PAGO'),
    (4,'TRANSFERENCIA')
    
    ;

    
INSERT INTO FACTURA (id_factura, id_pedido, id_pago, correo_empresa, cuit, nombre_empresa ,doc_cliente ,num_factura ,fecha_factura) VALUES
	('FT001','BP001',1,'restoelportu@gmail.com','1045389571359','RESTAURANTE ELPORTU','45.785.998','00089317','2023-03-21'),
    ('FT002','CP001',2,'restoelportu@gmail.com','1045389571359','RESTAURANTE ELPORTU','95.105.441','00090227','2023-03-30'),
    ('FT003','MP001',1,'restoelportu@gmail.com','1045389571359','RESTAURANTE ELPORTU','25.315.685','00089420','2023-04-08'),
    ('FT004','BP002',2,'restoelportu@gmail.com','1045389571359','RESTAURANTE ELPORTU','18.552.745','00090330','2023-04-15'),
    ('FT005','CP002',1,'restoelportu@gmail.com','1045389571359','RESTAURANTE ELPORTU','65.400.258','00091875','2023-04-19'),
    ('FT006','MP002',2,'restoelportu@gmail.com','1045389571359','RESTAURANTE ELPORTU','13.587.945','00092785','2023-04-25')
    
    ;