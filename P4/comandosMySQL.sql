 
--Para conectar a nuestra base de datos (como root):
--mysql -h 127.0.0.1 -P 3306 -u root -p

--Para crear una base de datos llamada SIBW
--create database SIBW;

--Para dar permisos a esa base de datos a un usuario (y no entrar como root, que es peligroso)

--CREATE USER 'albertolg'@'%' IDENTIFIED BY 'practicas,sibw';
--GRANT create, delete, drop, index, insert, select, update ON SIBW.* TO 'albertolg'@'%';

--Para salir del cliente MySQL
--exit


--Para entrar como el usuario que acabamos de crear
--mysql -h 127.0.0.1 -P 3306 -u albertolg -p

--Para que el usuario use la BD SIBW
--use SIBW

--Creamos una tabla para los productos

CREATE TABLE Imagen(
  idImagen INT AUTO_INCREMENT PRIMARY KEY,
  nombreImagen VARCHAR(100),
  href VARCHAR(100),
  src VARCHAR(100) NOT NULL,
  class VARCHAR(100) NOT NULL
);

CREATE TABLE OtrasImagenes(
  idImagen INT AUTO_INCREMENT PRIMARY KEY,
  nombreImagen VARCHAR(100),
  href VARCHAR(100),
  src VARCHAR(100) NOT NULL,
  class VARCHAR(100) NOT NULL
);

CREATE TABLE Producto(
  idProducto INT AUTO_INCREMENT PRIMARY KEY,
  nombreProducto VARCHAR(100) NOT NULL,
  marca VARCHAR(100) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  cuerpo VARCHAR(10000) DEFAULT NULL,
  idImagen INT NOT NULL,
  FOREIGN KEY (idImagen) REFERENCES Imagen(idImagen)
);

/*Creamos una tabla para los usuarios donde rango es el tipo de usuario (registrado, moderador...) e superusuario nos indica si es o no superususario */
CREATE TABLE Usuario(
	usname VARCHAR(100) PRIMARY KEY,
	email VARCHAR(100) NOT NULL,
	passwd VARCHAR(100) NOT NULL,
	nombre VARCHAR(100),
	apellido VARCHAR(100),
	sexo VARCHAR(10),
	fechaNacimiento DATE,
	rango INT NOT NULL,
	superusuario INT NOT NULL DEFAULT 0,
	CONSTRAINT maximo_rango CHECK (rango < 5),
	CONSTRAINT es_superusuario CHECK (superusuario = 1 OR superusuario = 0)
	
);

--Creamos una tabla para los comentarios
CREATE TABLE Comentarios(
  idComentario INT AUTO_INCREMENT PRIMARY KEY,
  usname VARCHAR(100) NOT NULL,
  fecha datetime NOT NULL,
  cuerpo VARCHAR(10000) NOT NULL,
  idProducto INT NOT NULL,
  FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
  FOREIGN KEY (usname) REFERENCES Usuario(usname)	
);

CREATE TABLE PalabraProhibida(
  idPalabra INT PRIMARY KEY AUTO_INCREMENT,
  palabra VARCHAR(100) NOT NULL
);

CREATE TABLE ImagenProducto( idProducto INT, idImagen INT, PRIMARY KEY (idProducto, idImagen), FOREIGN KEY (idProducto) REFERENCES Producto(idProducto), FOREIGN KEY (idImagen) REFERENCES OtrasImagenes(idImagen));

CREATE TABLE Etiqueta(
	etiqueta VARCHAR(100),
	idProducto INT,
	FOREIGN KEY(idProducto) REFERENCES Producto(idProducto),
	PRIMARY KEY (etiqueta, idProducto)
);

--Insercion rutas Imagenes
insert into Imagen (nombreImagen,href,src,class) values("Piscina para perros", "/producto.php?pr=1", "images/piscina.jpg", "piscina");
insert into Imagen (nombreImagen,href,src,class) values("Maiz mordedor", "/producto.php?pr=2", "images/maiz.jpg", "maiz");
insert into Imagen (nombreImagen,href,src,class) values("Sillon para perros", "/producto.php?pr=3", "images/sillon.jpg", "sillon");
insert into Imagen (nombreImagen,href,src,class) values("Rastreador de mascotas", "/producto.php?pr=4", "images/rastreador.jpg", "rastreador");
insert into Imagen (nombreImagen,href,src,class) values("Casa para pajaros", "/producto.php?pr=5", "images/casa.jpg", "casa");
insert into Imagen (nombreImagen,href,src,class) values("Bebedor colibries", "/producto.php?pr=6", "images/colibri.jpg", "colibri");
insert into Imagen (nombreImagen,href,src,class) values("Mochila portagatos", "/producto.php?pr=7", "images/gatos.jpg", "gatos");
insert into Imagen (nombreImagen,href,src,class) values("Pecera", "/producto.php?pr=8", "images/pecera.jpg", "pecera");
insert into Imagen (nombreImagen,href,src,class) values("Prenda para cobayas", "/producto.php?pr=9", "images/cobaya.jpg", "cobayas");


INSERT INTO OtrasImagenes(nombreImagen,href,src,class) VALUES ("piscinaPerroProducto","/producto.php?pr=1","images/producto-piscina1.jpg","producto-piscina1");
INSERT INTO OtrasImagenes(nombreImagen,href,src,class) VALUES ("piscinaPerroProducto","/producto.php?pr=1","images/producto-piscina2.jpg","producto-piscina2");
INSERT INTO OtrasImagenes(nombreImagen,href,src,class) VALUES ("Pagina del producto","https://acortar.link/lf8E0d","images/masinfo.png","masinfo");


--Insercion productos
INSERT INTO Producto(nombreProducto, marca, precio, cuerpo, idImagen) VALUES("Piscina para perros", "AJKMEI", 39.99, "Piscina segura y duradera para mascotas:La bañera para mascotas está hecha de tela de PVC de sabor extra resistente de alta calidad que es segura y no tóxica, duradera y resistente a los arañazos. El tablero de madera comprimido de alta resistencia de 0.45 cm de grosor incorporado agrega soporte, fortaleciendo toda la piscina y no colapsará. Bañera antideslizante y resistente para mascotas: El material del fondo está engrosado y la superficie inferior tiene una textura antideslizante y resistente al desgaste. Cuando el perro salta a la piscina o el niño juega en la niños piscina, evita que el perro y el niño se deslicen y hace que la Bañera para mascota sea más fuerte, esta piscina para perros resistirá el uso diario sin fugas ni colapsar, incluso cuando está llena. Piscina de remo para perros portátil y plegable: La piscina para baño se puede abrir y plegar fácilmente, sin necesidad de inflar, la bañera de baño fácil de transportar adopta un diseño de drenaje en espiral, gira y abre, ¡conveniente para drenar! La cubierta de drenaje está bien sellada, no hay necesidad de preocuparse por las fugas de agua. Bañera multipropósito para ducha de mascotas para niños: esta piscina para niños se puede usar en interiores y exteriores, no solo como una piscina para gatos, una bañera para perros, un estanque para peces, una bañera para bebés, bañera para niños, bar de juguetes para niños , pozos de bolas para niños, bañeras para bebés. Llenos de agua, arena o bolas de mar como un hoyo de bolas para proporcionar un buen entretenimiento para niños y mascotas, pueden divertirse juntos. Opera incluso cuando se usa bajo cero, y es adecuado para diversos entornos. Piscina de baño para perros resistente al frío y a los rayos UV: No se roms. dura más. 100% de satisfacción, proporcionamos reemplazo o reembolso y servicio al cliente de por vida, ordene su piscina de baño Kiddie con absoluta confianza. Si hay algún problema de calidad, contáctenos y le ofreceremos una solución de inmediato.",1);



INSERT INTO Etiqueta VALUES ("Perros", 1);
INSERT INTO Etiqueta VALUES ("Verano", 1);

--lobo
INSERT INTO Usuario VALUES ("albertollamas", "alberto@correo.es", "$2y$10$p4yAYFnBGHfhpTBrtWet1OdNB2kR.Zv3bWyxkxyo1vlNYBWeITVpC", "Alberto", "Llamas", "Masculino", "2001-11-10", 4, 1); 
--superuusario

--mexico
INSERT INTO Usuario VALUES ("luisilloelpillo", "luisito@comunica.com", "$2y$10$0UmH/e72n6kTrTItCQyZouIs1ZmahbzJOauQwLIS9jjG76lLkO9mK", "Luis", "Pillo", "Masculino", "1996-09-01", 3, 0); 
--gestor de sitio

--multiverso
INSERT INTO Usuario VALUES ("spiderman", "peterparker@marvel.us", "$2y$10$ChXXhUBqstw4kU3YbiCTWe3P4rAS8sgDCvqtk7RICO68H3cxr6vNO", "Peter", "Parker", "Masculino", "1999-01-01", 2, 0);
--moderador

--actriz
INSERT INTO Usuario VALUES ("blanquitadinamita", "blancasuarez@actriz.es", "$2y$10$q9CuGoHpnNir9959.6pcSua2qOYzpZFCA9BYVRPKFOk/GokuC0Ko6", "Blanca", "Suarez", "Femenino", "1990-06-23", 1, 0); 
--usuario registrado


INSERT INTO Comentarios(usname,fecha,cuerpo,idProducto) VALUES("blanquitadinamita", "2022-02-27 16:48:23", "La compré como cuna para que mis cachorros estuviesen a salvo ahora que aún no son independientes. Como idea no está mal, pero al no tener estabilidad para esta función, la tuve q devolver y comprar otro modelo con barillas y patas.", 1);

INSERT INTO Comentarios(usname,fecha,cuerpo,idProducto) VALUES("luisilloelpillo", "2022-01-11 13:12:43", "Necesitaba una pequeña piscina para mi perrita que se bañara y se refrescara por las tardes en la terraza. Vi este producto y no destacaba por ser muy complejo, pero se veía bastante económico que era también en lo que me estaba fijando. Cuando me llegó me gustó porque me entra justo entre las dos paredes que era el miedo que yo tenía, que no me cupiera ahí. La he llenado tras tirarme toda la tarde con cubos y pues la perrita le da cosa meterse, pero ya va de vez en cuando y se mete un poco, eso si me pone toda la terraza perdida de agua. Los muros son resistentes y de buen material, en ese sentido estoy contento. Me ha parecido un buen producto", 1);



INSERT INTO ImagenProducto VALUES(1,1);
INSERT INTO ImagenProducto VALUES(1,2);
INSERT INTO ImagenProducto VALUES(1,3);


