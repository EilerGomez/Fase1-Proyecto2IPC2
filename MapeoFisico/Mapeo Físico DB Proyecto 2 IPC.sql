CREATE DATABASE Revistas;

use Revistas;

CREATE TABLE Usuario(
id int not null primary key auto_increment,
nombre varchar(70) not null,
contraseña varchar (60) not null,
puesto int not null
);

CREATE TABLE Revistas(
id int not null primary key auto_increment,
nombre varchar(70) not null,
contenido varchar(50) not null,
permisoReaccion boolean not null,
permisoComentarios boolean not null,
fehcaCreacion date not null,
permisoSuscripciones boolean not null,
precioAnual double not null,
precioMensual double not null,
idCreador int not null,
publicada boolean not null,
precioXWeb double not null,
categoria varchar(80) not null,
CONSTRAINT FK_TO_USUARIO FOREIGN KEY (idCreador) 
REFERENCES Usuario(id)
);

CREATE TABLE PagoRevistas(
id int not null primary key auto_increment,
idRevista int not null,
idSuscriptor int not null,
modoPago varchar(35) not null,
fechaPago date not null,
fechaVencimiento date not null
);

CREATE TABLE Suscripciones(
id int not null primary key auto_increment,
idSuscriptor int not null,
idRevista int not null,
fechaSuscripcion date not null,
CONSTRAINT FK_TO_SUSCRIPTOR FOREIGN KEY (idSuscriptor)
REFERENCES Usuario(id),
constraint FK_TO_REVISTAS foreign key (idRevista)
REFERENCES Revistas(id)
);

CREATE TABLE Anuncios(
id int not null primary key auto_increment,
nombre varchar(70) not null,
contenido varchar(60) not null
);

CREATE TABLE etiquetas (
id int not null primary key auto_increment,
nombre varchar(70) not null,
idRevista int not null,
constraint FK_TO_REVISTA foreign key (idRevista)
references Revistas(id)
);

CREATE TABLE eleccionTags(
id int not null primary key auto_increment,
idUsuario int not null,
idTag int not null,
constraint FK_TO_REVISTS foreign key (idTag)
references Revistas(id), foreign key (idUsuario)
references Usuario(id)
);
/*aqui empieza el mapeo físico de la creación del nuevo usuario*/
CREATE USER 'eiler'@'localhost' IDENTIFIED BY 'eiler123';
GRANT SELECT ON revistas.* TO 'eiler'@'localhost';
GRANT DELETE ON revistas.* TO 'eiler'@'localhost';
GRANT UPDATE ON revistas.* TO 'eiler'@'localhost';
GRANT INSERT ON revistas.* TO 'eiler'@'localhost';
/* EL HOSTNAME TIENE QUE SER 127.0.0.1 */
/* EL PUERTO TIENE QUE SER: 3306*/

/*agregar el primer usuario, el por defecto para que inicie el programa*/
use revistas;
insert into usuario (nombre,contraseña,puesto) values('admin','admin',3);
