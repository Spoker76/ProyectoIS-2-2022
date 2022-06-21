/*
	Script de base de datos.
    Proyecto de Ingeniería de software - II PAC 2022.
    Grupo #4.
    Ing. Néstor Luque.
*/

/*  
	@@@@@@@@@@@@@@@@@@@@@@@@@@
    
	DDL de la base de datos...  
    
    @@@@@@@@@@@@@@@@@@@@@@@@@@
*/

DROP DATABASE IF EXISTS DB_PROYECTO_INS;

CREATE DATABASE IF NOT EXISTS DB_PROYECTO_INS;

USE DB_PROYECTO_INS;

CREATE TABLE USUARIO(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    primerNombre VARCHAR(20) NOT NULL,
    segundoNombre VARCHAR(20),
    primerApellido VARCHAR(20) NOT NULL,
    segundoApellido VARCHAR(20),
    correo VARCHAR(40) NOT NULL,
    telefono VARCHAR(25) NOT NULL,
    pass VARCHAR(40) NOT NULL,
    tipo BOOL NOT NULL,
    activo BOOL NOT NULL,
    foto LONGBLOB
);

CREATE TABLE CATEGORIA(
	idCategoria INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(30) NOT NULL
);

CREATE TABLE PRODUCTO(
	idProducto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    fecha DATE NOT NULL,
    costo DECIMAL(8,2) NOT NULL,
    descripcion TINYTEXT,
    activo BOOL NOT NULL,
    idCategoria INT,
    idUsuario INT,
    FOREIGN KEY (idCategoria) REFERENCES CATEGORIA(idCategoria),
    FOREIGN KEY (idUsuario) REFERENCES USUARIO(idUsuario)
);

CREATE TABLE FOTO(
	idFoto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    image LONGBLOB,
    idProducto INT NOT NULL,
    FOREIGN KEY (idProducto) REFERENCES PRODUCTO(idProducto)
);

CREATE TABLE DIRECCION(
	idDireccion INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idUsuario INT,
    idProducto INT,
    departamento VARCHAR(20),
    municipio VARCHAR(30),
    barrio VARCHAR(50),
    referencia TINYTEXT,
    FOREIGN KEY (idProducto) REFERENCES PRODUCTO(idProducto),
    FOREIGN KEY (idUsuario) REFERENCES USUARIO(idUsuario)
);

CREATE TABLE CALIFICACION(
	idCalificacion INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    calificacion INT NOT NULL,
    emisor INT NOT NULL,
    receptor INT NOT NULL,
    FOREIGN KEY (emisor) REFERENCES USUARIO(idUsuario),
    FOREIGN KEY (receptor) REFERENCES USUARIO(idUsuario)
);

CREATE TABLE DENUNCIA(
	idDenuncia INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    descripcion TINYTEXT NOT NULL,
    emisor INT NOT NULL,
    receptor INT NOT NULL,
    activa BOOL NOT NULL,
    FOREIGN KEY (emisor) REFERENCES USUARIO(idUsuario),
    FOREIGN KEY (receptor) REFERENCES USUARIO(idUsuario)
);

CREATE TABLE SUSCRIPCION(
	idSuscripcion INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idUsuario INT NOT NULL,
    idCategoria INT NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES USUARIO(idUsuario),
    FOREIGN KEY (idCategoria) REFERENCES CATEGORIA(idCategoria)
);

CREATE TABLE CHAT(
	idChat INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    user1 INT NOT NULL,
    user2 INT NOT NULL,
    FOREIGN KEY (user1) REFERENCES USUARIO(idUsuario),
    FOREIGN KEY (user2) REFERENCES USUARIO(idUsuario)
);

CREATE TABLE MENSAJE(
	idMensaje INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idChat INT NOT NULL,
    tiempo TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    mensaje TINYTEXT NOT NULL,
    FOREIGN KEY (idChat) REFERENCES CHAT(idChat)
);

/*  
	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    
	DML de la base de datos...
		Todos los grupos de inserts contienen una descripcion
		de la lógica utilizada para generar los registros ;).
    
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
*/

/*
	Insercion en la tabla de usuarios.
		Los 5 primeros son admins y los últimos 4 son usuarios normales baneados.
*/

insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (1, 'Jehanna', 'Alison', 'Joseff', 'Fayne', 'afayne0@mozilla.org', '896-235-0185', '8h1vfbcIn', true, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (2, 'Vilhelmina', 'Earl', 'Potkin', 'Endecott', 'eendecott1@europa.eu', '383-919-1089', 'L3ATcDC1', true, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (3, 'Banky', 'Clevie', 'Marcus', 'Stripling', 'cstripling2@sitemeter.com', '808-846-8609', 'zq2do03R', true, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (4, 'Wynne', 'Thayne', 'Wyson', 'Moulden', 'tmoulden3@ted.com', '839-268-1417', '39ABMXB', true, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (5, 'Dilly', 'Alecia', 'Powers', 'Goodhall', 'agoodhall4@reference.com', '833-588-4367', 'C0F3jCdZhw', true, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (6, 'Joellyn', 'Lillian', 'Anyene', 'Gingell', 'lgingell5@wufoo.com', '481-832-8623', 'QOYH7y59Rh', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (7, 'Adriana', 'Alessandra', 'Conman', 'Jeskin', 'ajeskin6@pbs.org', '676-648-2755', 'VxkgvygRd', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (8, 'Caresse', 'Biddie', 'Marriott', 'Couth', 'bcouth7@google.com', '597-183-4839', 'asIv7qKb', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (9, 'Onida', 'Marcie', 'Bromwich', 'Millyard', 'mmillyard8@scribd.com', '192-320-3345', 'IVhPR9', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (10, 'Gennie', 'Wilmar', 'Salmen', 'Scarff', 'wscarff9@wordpress.com', '364-793-3732', 'KCWL3Ep8', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (11, 'Roley', 'Franz', 'Ridgeway', 'Drysdale', 'fdrysdalea@google.com.au', '815-620-3236', 'rXSbevHAIKWp', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (12, 'Belicia', 'Hilary', 'Gosby', 'Sircomb', 'hsircombb@drupal.org', '582-571-8101', 'VKvOgsW7', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (13, 'Bastien', 'Myrtle', 'Harwin', 'Geeraert', 'mgeeraertc@baidu.com', '101-233-8023', 'u8eSXHpqV2T', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (14, 'Agatha', 'Lynea', 'Matchett', 'Klimowicz', 'lklimowiczd@princeton.edu', '306-271-6912', 'gAoqKbo', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (15, 'Jamaal', 'Kimberli', 'Hargess', 'Bakesef', 'kbakesefe@usda.gov', '893-169-0913', '8XWdh3q23FNV', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (16, 'Merrie', 'Marietta', 'Pirazzi', 'Brogioni', 'mbrogionif@live.com', '886-566-1103', 'rD4pz4COa', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (17, 'Brook', 'Flossie', 'Monini', 'Itzik', 'fitzikg@ucla.edu', '673-412-1272', 'se9cJOqA4KV', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (18, 'Hagen', 'Ax', 'Stanwix', 'Calcraft', 'acalcrafth@cisco.com', '505-696-6423', '3ztBJfqsp', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (19, 'Harman', 'Karoly', 'Tupman', 'Mercy', 'kmercyi@shareasale.com', '566-186-9646', 'fiDQ4kSOx08t', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (20, 'Shirlene', 'Milton', 'Ruperti', 'Letertre', 'mletertrej@blogtalkradio.com', '215-845-0337', 'tFPWPE', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (21, 'Sydelle', 'Audra', 'Urry', 'Fandrey', 'afandreyk@ebay.co.uk', '806-740-5882', 'peh98hmS4ZG', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (22, 'Fernanda', 'Evangelin', 'Duffield', 'Paeckmeyer', 'epaeckmeyerl@plala.or.jp', '575-444-9096', 'adEc6O', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (23, 'Mabel', 'Halley', 'Sydes', 'Hedingham', 'hhedinghamm@si.edu', '184-593-7867', 'c6xbYAys8gF', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (24, 'Jonah', 'Faye', 'Stummeyer', 'Basilotta', 'fbasilottan@dmoz.org', '951-157-5341', 'oc1kNZeum', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (25, 'Caroljean', 'Nikaniki', 'Brampton', 'Soar', 'nsoaro@mapy.cz', '187-980-8568', 'n9Arj2cJ1e3', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (26, 'Elsworth', 'Almeta', 'Warby', 'Thoresby', 'athoresbyp@icq.com', '861-679-1632', '38YpYxn5O5wE', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (27, 'Angie', 'Atlante', 'Moakler', 'MacNeice', 'amacneiceq@archive.org', '424-703-8244', 'JuUJDJRu1', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (28, 'Kathy', 'Loralyn', 'McBrearty', 'McGennis', 'lmcgennisr@sohu.com', '931-374-6985', '1tY9KmV3Y', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (29, 'Marlo', 'Natal', 'Stairmond', 'Wilbraham', 'nwilbrahams@mail.ru', '701-500-3769', '5OdpE7', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (30, 'Camellia', 'Monah', 'Cherm', 'Kovelmann', 'mkovelmannt@4shared.com', '479-699-6752', 'AzVRiL', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (31, 'Kissiah', 'Lucas', 'Linham', 'Kinnock', 'lkinnocku@rakuten.co.jp', '314-528-8082', 'MCHMe95LIY3X', false, true);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (32, 'Ruthe', 'Trevar', 'Bessant', 'Bloggett', 'tbloggettv@pinterest.com', '341-740-7727', 'If7tJzys', false, false);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (33, 'Aurore', 'Humfrid', 'Clayfield', 'McIlwraith', 'hmcilwraithw@google.co.uk', '508-554-6196', 'gNGTk7n', false, false);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (34, 'Mignon', 'Erskine', 'McFade', 'Reinhard', 'ereinhardx@boston.com', '441-762-9546', 'XHZsyAcAvmB', false, false);
insert into USUARIO (idUsuario, primerNombre, segundoNombre, primerApellido, segundoApellido, correo, telefono, pass, tipo, activo) values (35, 'Guendolen', 'Ernesta', 'Stoodley', 'Haggis', 'ehaggisy@vkontakte.ru', '701-825-6699', 'UsMtsZ2H', false, false);

/*
	Insercion en la tabla de categorias...
		Vienen de acuerdo al enunciado del proyecto.
*/

insert into CATEGORIA (idCategoria, nombre) values (1, 'Inmuebles');
insert into CATEGORIA (idCategoria, nombre) values (2, 'Vehiculos');
insert into CATEGORIA (idCategoria, nombre) values (3, 'Hogar');
insert into CATEGORIA (idCategoria, nombre) values (4, 'Moda');
insert into CATEGORIA (idCategoria, nombre) values (5, 'Futuros padres');
insert into CATEGORIA (idCategoria, nombre) values (6, 'Mascotas');
insert into CATEGORIA (idCategoria, nombre) values (7, 'Electronica');
insert into CATEGORIA (idCategoria, nombre) values (8, 'Servicios');
insert into CATEGORIA (idCategoria, nombre) values (9, 'Negocios');
insert into CATEGORIA (idCategoria, nombre) values (10, 'Empleo');

/*
	Insercion en la tabla de productos...
		Se encuentran entre las 10 categorias.
		Los usuarios desde el 6 hasta el 15 son vendedores.
*/

insert into PRODUCTO (idProducto, nombre, fecha, costo, descripcion, activo, idCategoria, idUsuario) values (1, 'Olive - Spread Tapenade', '2021-10-08', 4328.11, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', true, 2, 7);
insert into PRODUCTO (idProducto, nombre, fecha, costo, descripcion, activo, idCategoria, idUsuario) values (2, 'Veal - Osso Bucco', '2022-02-15', 8828.88, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', true, 2, 15);
insert into PRODUCTO (idProducto, nombre, fecha, costo, descripcion, activo, idCategoria, idUsuario) values (3, 'Haggis', '2022-01-19', 6649.21, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', false, 4, 7);
insert into PRODUCTO (idProducto, nombre, fecha, costo, descripcion, activo, idCategoria, idUsuario) values (4, 'Flower - Potmums', '2022-05-23', 488.06, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', true, 5, 12);
insert into PRODUCTO (idProducto, nombre, fecha, costo, descripcion, activo, idCategoria, idUsuario) values (5, 'Dc Hikiage Hira Huba', '2021-11-18', 4610.57, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', false, 4, 15);
insert into PRODUCTO (idProducto, nombre, fecha, costo, descripcion, activo, idCategoria, idUsuario) values (6, 'Pasta - Bauletti', '2021-09-28', 4977.65, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', true, 1, 7);
insert into PRODUCTO (idProducto, nombre, fecha, costo, descripcion, activo, idCategoria, idUsuario) values (7, 'Cheese - Woolwich Goat', '2022-03-24', 1041.77, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', false, 1, 8);
insert into PRODUCTO (idProducto, nombre, fecha, costo, descripcion, activo, idCategoria, idUsuario) values (8, 'Longos - Chicken Wings', '2022-02-20', 4947.2, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', false, 1, 8);
insert into PRODUCTO (idProducto, nombre, fecha, costo, descripcion, activo, idCategoria, idUsuario) values (9, 'Wasabi Paste', '2021-07-29', 7588.73, 'In congue. Etiam justo. Etiam pretium iaculis justo.', true, 4, 6);
insert into PRODUCTO (idProducto, nombre, fecha, costo, descripcion, activo, idCategoria, idUsuario) values (10, 'Island Oasis - Lemonade', '2022-01-30', 1997.0, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', false, 4, 15);
insert into PRODUCTO (idProducto, nombre, fecha, costo, descripcion, activo, idCategoria, idUsuario) values (11, 'Blackberries', '2022-02-07', 576.32, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', true, 5, 9);
insert into PRODUCTO (idProducto, nombre, fecha, costo, descripcion, activo, idCategoria, idUsuario) values (12, 'Soup - Chicken', '2022-04-17', 885.24, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', false, 5, 13);
insert into PRODUCTO (idProducto, nombre, fecha, costo, descripcion, activo, idCategoria, idUsuario) values (13, 'Tart - Raisin', '2022-05-15', 9068.19, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', false, 1, 6);
insert into PRODUCTO (idProducto, nombre, fecha, costo, descripcion, activo, idCategoria, idUsuario) values (14, 'Celery', '2021-08-11', 3371.26, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', true, 5, 15);
insert into PRODUCTO (idProducto, nombre, fecha, costo, descripcion, activo, idCategoria, idUsuario) values (15, 'Flour - Chickpea', '2021-09-16', 5381.92, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', false, 9, 12);
insert into PRODUCTO (idProducto, nombre, fecha, costo, descripcion, activo, idCategoria, idUsuario) values (16, 'Caviar - Salmon', '2021-09-02', 4301.42, 'Fusce consequat. Nulla nisl. Nunc nisl.', true, 8, 6);
insert into PRODUCTO (idProducto, nombre, fecha, costo, descripcion, activo, idCategoria, idUsuario) values (17, 'Rhubarb', '2021-11-14', 1782.04, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', false, 4, 14);
insert into PRODUCTO (idProducto, nombre, fecha, costo, descripcion, activo, idCategoria, idUsuario) values (18, 'Beef - Tender Tips', '2021-11-26', 3912.75, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', true, 7, 8);
insert into PRODUCTO (idProducto, nombre, fecha, costo, descripcion, activo, idCategoria, idUsuario) values (19, 'Vaccum Bag 10x13', '2022-05-10', 5817.0, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', false, 8, 9);
insert into PRODUCTO (idProducto, nombre, fecha, costo, descripcion, activo, idCategoria, idUsuario) values (20, 'Towel - Roll White', '2022-05-05', 8714.66, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', true, 7, 7);
insert into PRODUCTO (idProducto, nombre, fecha, costo, descripcion, activo, idCategoria, idUsuario) values (21, 'Rice - Long Grain', '2021-11-19', 7687.61, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', false, 7, 6);

/*
	Inserción en la tabla de fotos...
		Los campos de imagen se generaron NULL por defecto.
*/

insert into FOTO (idFoto, image, idProducto) values (1, null, 10);
insert into FOTO (idFoto, image, idProducto) values (2, null, 12);
insert into FOTO (idFoto, image, idProducto) values (3, null, 5);
insert into FOTO (idFoto, image, idProducto) values (4, null, 17);
insert into FOTO (idFoto, image, idProducto) values (5, null, 8);
insert into FOTO (idFoto, image, idProducto) values (6, null, 10);
insert into FOTO (idFoto, image, idProducto) values (7, null, 11);
insert into FOTO (idFoto, image, idProducto) values (8, null, 18);
insert into FOTO (idFoto, image, idProducto) values (9, null, 2);
insert into FOTO (idFoto, image, idProducto) values (10, null, 5);
insert into FOTO (idFoto, image, idProducto) values (11, null, 3);
insert into FOTO (idFoto, image, idProducto) values (12, null, 5);
insert into FOTO (idFoto, image, idProducto) values (13, null, 15);
insert into FOTO (idFoto, image, idProducto) values (14, null, 5);
insert into FOTO (idFoto, image, idProducto) values (15, null, 20);
insert into FOTO (idFoto, image, idProducto) values (16, null, 17);
insert into FOTO (idFoto, image, idProducto) values (17, null, 6);
insert into FOTO (idFoto, image, idProducto) values (18, null, 3);
insert into FOTO (idFoto, image, idProducto) values (19, null, 6);
insert into FOTO (idFoto, image, idProducto) values (20, null, 3);

/*
	Insercion en la tabla de direcciones...
		Los registros del 1 al 35 corresponden a usuarios y del 36 al 55 a productos.
        Los municipios, barrios y referencias tienen valores por default.
        Si es direccion de usuario o de producto se diferencia mediante cual campo es null de la llave foránea.
*/

insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (1, 1,null, 'Islas de la bahía', 'Tela', 'Colonia 2', 'Frente al negocio');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (2, 2,null, 'Yoro', 'Comayagua', 'Colonia 2', 'Cerca de la cancha');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (3, 3,null, 'Valle', 'Amapala', 'Colonia 2', 'Cerca de la pulperia');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (4, 4,null, 'Atlántida', 'Tegucigalpa', 'Barrio 2', 'Cerca de la cancha');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (5, 5,null, 'OlanchoSanta barbara', 'San pedro sula', 'Barrio 1', 'Cerca de la cancha');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (6, 6,null, 'Intibucá', 'San pedro sula', 'Colonia 1', 'Cerca de la cancha');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (7, 7,null, 'OlanchoSanta barbara', 'Amapala', 'Barrio 2', 'Cerca de la pulperia');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (8, 8,null, 'La paz', 'San pedro sula', 'Colonia 2', 'Cerca de la pulperia');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (9, 9,null, 'Gracias a dios', 'Amapala', 'Barrio 2', 'Cerca de la pulperia');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (10, 10,null, 'Intibucá', 'Amapala', 'Barrio 2', 'Cerca de la pulperia');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (11, 11,null, 'Atlántida', 'Tegucigalpa', 'Colonia 1', 'Cerca de la pulperia');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (12, 12,null, 'Choluteca', 'La ceiba', 'Barrio 1', 'Frente al negocio');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (13, 13,null, 'Cortés', 'Comayagua', 'Barrio 1', 'Cerca de la pulperia');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (14, 14,null, 'Ocotepeque', 'Comayagua', 'Colonia 2', 'Cerca de la cancha');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (15, 15,null, 'Lempira', 'La ceiba', 'Colonia 1', 'Frente al negocio');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (16, 16,null, 'Colón', 'Tela', 'Colonia 1', 'Cerca de la cancha');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (17, 17,null, 'Islas de la bahía', 'La ceiba', 'Colonia 2', 'Cerca de la cancha');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (18, 18,null, 'Cortés', 'La ceiba', 'Barrio 1', 'Frente al negocio');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (19, 19,null, 'Atlántida', 'Comayagua', 'Colonia 2', 'Frente al negocio');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (20, 20,null, 'Intibucá', 'Tegucigalpa', 'Barrio 1', 'Frente al negocio');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (21, 21,null, 'Francisco Morazán', 'Comayagua', 'Colonia 2', 'Cerca de la pulperia');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (22, 22,null, 'Cortés', 'Amapala', 'Colonia 1', 'Cerca de la cancha');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (23, 23,null, 'El paraiso', 'La ceiba', 'Colonia 1', 'Cerca de la pulperia');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (24, 24,null, 'Valle', 'Tegucigalpa', 'Colonia 2', 'Cerca de la pulperia');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (25, 25,null, 'Ocotepeque', 'Comayagua', 'Barrio 2', 'Cerca de la pulperia');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (26, 26,null, 'Islas de la bahía', 'Comayagua', 'Barrio 1', 'Cerca de la cancha');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (27, 27,null, 'Ocotepeque', 'La ceiba', 'Barrio 1', 'Frente al negocio');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (28, 28,null, 'Atlántida', 'La ceiba', 'Colonia 2', 'Frente al negocio');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (29, 29,null, 'OlanchoSanta barbara', 'La ceiba', 'Colonia 1', 'Cerca de la cancha');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (30, 30,null, 'Yoro', 'Amapala', 'Colonia 2', 'Cerca de la cancha');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (31, 31,null, 'La paz', 'Tegucigalpa', 'Colonia 2', 'Frente al negocio');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (32, 32,null, 'Lempira', 'Tela', 'Colonia 2', 'Frente al negocio');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (33, 33,null, 'Copán', 'San pedro sula', 'Barrio 2', 'Cerca de la cancha');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (34, 34,null, 'Francisco Morazán', 'Comayagua', 'Barrio 1', 'Cerca de la cancha');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (35, 35,null, 'Gracias a dios', 'Amapala', 'Colonia 1', 'Frente al negocio');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (36, null,1, 'Gracias a dios', 'San pedro sula', 'Barrio 1', 'Cerca de la pulperia');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (37, null,2, 'Copán', 'Comayagua', 'Barrio 1', 'Frente al negocio');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (38, null,3, 'Intibucá', 'Tela', 'Barrio 1', 'Cerca de la pulperia');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (39, null,4, 'Islas de la bahía', 'La ceiba', 'Barrio 1', 'Cerca de la pulperia');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (40, null,5, 'El paraiso', 'La ceiba', 'Colonia 1', 'Frente al negocio');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (41, null,6, 'Valle', 'Tela', 'Barrio 2', 'Frente al negocio');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (42, null,7, 'Atlántida', 'Comayagua', 'Barrio 2', 'Frente al negocio');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (43, null,8, 'La paz', 'Amapala', 'Barrio 2', 'Cerca de la cancha');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (44, null,9, 'Cortés', 'San pedro sula', 'Colonia 1', 'Cerca de la pulperia');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (45, null,10, 'Ocotepeque', 'Amapala', 'Barrio 2', 'Frente al negocio');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (46, null,11, 'OlanchoSanta barbara', 'San pedro sula', 'Colonia 1', 'Cerca de la cancha');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (47, null,12, 'Yoro', 'Tegucigalpa', 'Colonia 2', 'Cerca de la cancha');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (48, null,13, 'Copán', 'San pedro sula', 'Colonia 2', 'Cerca de la cancha');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (49, null,14, 'Copán', 'Tela', 'Barrio 1', 'Frente al negocio');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (50, null,15, 'Colón', 'San pedro sula', 'Barrio 1', 'Cerca de la cancha');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (51, null,16, 'Intibucá', 'San pedro sula', 'Barrio 1', 'Cerca de la pulperia');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (52, null,17, 'Copán', 'La ceiba', 'Barrio 1', 'Cerca de la pulperia');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (53, null,18, 'Atlántida', 'La ceiba', 'Colonia 2', 'Cerca de la cancha');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (54, null,19, 'Lempira', 'La ceiba', 'Barrio 2', 'Cerca de la cancha');
insert into DIRECCION (idDireccion,  idUsuario, idProducto, departamento, municipio, barrio, referencia) values (55, null,20, 'Copán', 'Amapala', 'Barrio 1', 'Cerca de la pulperia');

/*
	Inserción en la tabla de calificaciones...
		Los usuarios no pueden calificarse a si mismos.
*/

insert into CALIFICACION (idCalificacion, calificacion, emisor, receptor) values (1, 1, 16, 15);
insert into CALIFICACION (idCalificacion, calificacion, emisor, receptor) values (2, 4, 6, 15);
insert into CALIFICACION (idCalificacion, calificacion, emisor, receptor) values (3, 5, 8, 9);
insert into CALIFICACION (idCalificacion, calificacion, emisor, receptor) values (4, 5, 29, 11);
insert into CALIFICACION (idCalificacion, calificacion, emisor, receptor) values (5, 5, 17, 8);
insert into CALIFICACION (idCalificacion, calificacion, emisor, receptor) values (6, 4, 34, 9);
insert into CALIFICACION (idCalificacion, calificacion, emisor, receptor) values (7, 2, 6, 13);
insert into CALIFICACION (idCalificacion, calificacion, emisor, receptor) values (8, 1, 32, 26);
insert into CALIFICACION (idCalificacion, calificacion, emisor, receptor) values (9, 5, 7, 35);
insert into CALIFICACION (idCalificacion, calificacion, emisor, receptor) values (10, 2, 27, 15);
insert into CALIFICACION (idCalificacion, calificacion, emisor, receptor) values (11, 1, 8, 10);
insert into CALIFICACION (idCalificacion, calificacion, emisor, receptor) values (12, 2, 6, 28);
insert into CALIFICACION (idCalificacion, calificacion, emisor, receptor) values (13, 1, 27, 19);
insert into CALIFICACION (idCalificacion, calificacion, emisor, receptor) values (14, 3, 23, 21);
insert into CALIFICACION (idCalificacion, calificacion, emisor, receptor) values (15, 5, 27, 20);
insert into CALIFICACION (idCalificacion, calificacion, emisor, receptor) values (16, 2, 13, 14);
insert into CALIFICACION (idCalificacion, calificacion, emisor, receptor) values (17, 1, 19, 20);
insert into CALIFICACION (idCalificacion, calificacion, emisor, receptor) values (18, 3, 30, 31);
insert into CALIFICACION (idCalificacion, calificacion, emisor, receptor) values (19, 1, 9, 34);
insert into CALIFICACION (idCalificacion, calificacion, emisor, receptor) values (20, 5, 29, 24);

/*
	Insercion en la tabla de denuncias...
		Los usuarios del 32 al 35 tienen denuncias, por tanto han sido baneados.
*/

insert into DENUNCIA (idDenuncia, descripcion, emisor, receptor, activa) values (1, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 17, 34, true);
insert into DENUNCIA (idDenuncia, descripcion, emisor, receptor, activa) values (2, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 19, 35,true);
insert into DENUNCIA (idDenuncia, descripcion, emisor, receptor, activa) values (3, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 27, 32,true);
insert into DENUNCIA (idDenuncia, descripcion, emisor, receptor, activa) values (4, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 30, 32,true);
insert into DENUNCIA (idDenuncia, descripcion, emisor, receptor, activa) values (5, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 9, 34,true);
insert into DENUNCIA (idDenuncia, descripcion, emisor, receptor, activa) values (6, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 17, 34,true);
insert into DENUNCIA (idDenuncia, descripcion, emisor, receptor, activa) values (7, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 11, 35,true);
insert into DENUNCIA (idDenuncia, descripcion, emisor, receptor, activa) values (8, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 25, 35,true);

/*
	Insercion en la tabla de suscripciones...
		Solo los usuarios normales pueden suscribirse, los admins no.
*/

insert into SUSCRIPCION (idSuscripcion, idUsuario, idCategoria) values (1, 35, 3);
insert into SUSCRIPCION (idSuscripcion, idUsuario, idCategoria) values (2, 10, 9);
insert into SUSCRIPCION (idSuscripcion, idUsuario, idCategoria) values (3, 7, 10);
insert into SUSCRIPCION (idSuscripcion, idUsuario, idCategoria) values (4, 25, 8);
insert into SUSCRIPCION (idSuscripcion, idUsuario, idCategoria) values (5, 26, 8);
insert into SUSCRIPCION (idSuscripcion, idUsuario, idCategoria) values (6, 7, 4);
insert into SUSCRIPCION (idSuscripcion, idUsuario, idCategoria) values (7, 34, 9);
insert into SUSCRIPCION (idSuscripcion, idUsuario, idCategoria) values (8, 6, 4);
insert into SUSCRIPCION (idSuscripcion, idUsuario, idCategoria) values (9, 28, 10);
insert into SUSCRIPCION (idSuscripcion, idUsuario, idCategoria) values (10, 19, 8);
insert into SUSCRIPCION (idSuscripcion, idUsuario, idCategoria) values (11, 33, 4);
insert into SUSCRIPCION (idSuscripcion, idUsuario, idCategoria) values (12, 23, 6);
insert into SUSCRIPCION (idSuscripcion, idUsuario, idCategoria) values (13, 12, 4);
insert into SUSCRIPCION (idSuscripcion, idUsuario, idCategoria) values (14, 20, 10);
insert into SUSCRIPCION (idSuscripcion, idUsuario, idCategoria) values (15, 33, 9);
insert into SUSCRIPCION (idSuscripcion, idUsuario, idCategoria) values (16, 16, 5);
insert into SUSCRIPCION (idSuscripcion, idUsuario, idCategoria) values (17, 20, 6);
insert into SUSCRIPCION (idSuscripcion, idUsuario, idCategoria) values (18, 35, 8);
insert into SUSCRIPCION (idSuscripcion, idUsuario, idCategoria) values (19, 22, 5);
insert into SUSCRIPCION (idSuscripcion, idUsuario, idCategoria) values (20, 34, 10);
insert into SUSCRIPCION (idSuscripcion, idUsuario, idCategoria) values (21, 15, 4);