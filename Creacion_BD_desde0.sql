CREATE DATABASE Vuelos_humanitarios;

USE Vuelos_humanitarios;

create table Pais
(
IdPais char(50) primary key not null,

Nombre varchar(60) not null
)auto_increment=1;

create table Pasajero 
(
IdPasajero int auto_increment primary key,

Nombre varchar(60),

Apellido varchar(60),

Tipo_Documento varchar(60),

Num_Documento varchar(20),

Fecha_Nacimiento date,

IdPais char(50),

Telefono char(9),

Email varchar(50)
)auto_increment=1;


create table Pago
(IdPago int auto_increment primary key,
IdReserva int,
Fecha date,
IdPasajero int,
Monto decimal(8,2),
Tipo_Comprobante varchar(60),
Num_Comprobante varchar(60)
)auto_increment=1;


create table Reserva
(
IdReserva int auto_increment primary key,
Costo decimal(8,2),
Observacion varchar(60)
)auto_increment=1;


create table Vuelo
(
IdAvion int,
IdReserva int,
Nombre_Aeropuerto varchar(60),
Pais_Aeropuerto varchar(50),
Tarifa decimal(8,2),
Asiento varchar(10)
);


create table Avion
(
IdAvion int auto_increment primary key,
Aerolinea varchar(50),
Tipo varchar(60),
Capacidad varchar(40)
)auto_increment=1;


create table Usuario
(
IdUsuario int auto_increment primary key,
Nombres varchar(60),
Apellidos varchar(60),
Fecha_Nacimiento date,
Direccion varchar(70),
Telefono varchar(60),
User varchar(60),
Password varchar(60)
)auto_increment=1;

alter table Pasajero add foreign key (IdPais) references Pais(IdPais);

alter table Pago add foreign key (IdPasajero) references Pasajero(IdPasajero);

alter table Pago add foreign key (IdReserva) references Reserva(IdReserva);

alter table Vuelo add foreign key (IdAvion) references Avion(IdAvion);

alter table Vuelo add foreign key (IdReserva) references Reserva(IdReserva);


insert into Usuario(Nombres,Apellidos,Fecha_Nacimiento,Direccion,Telefono,User,Password) values 
('Aldo','Cardenas','1988-10-24','Av.Manzanilla 256','927158405','Aldo','123');


select * from Usuario;

insert Pais value ('PER','Peru');
insert Pais value ('CHI','Chile');

select * from Pais;

insert Pasajero value (null,'Aldo','Cardenas','DNI','45815911','1988-10-24','PER','927158405','cardenastaldo24@gmail.com');
insert Pasajero value ('Pas100','Aldo','Cardenas','DNI','95815911','1988-10-24','CHI','927158405','cardenastaldo24@gmail.com');
Insert into Pasajero (Nombre,Apellido,Tipo_Documento,Num_Documento,Fecha_Nacimiento,IdPais,Telefono,Email) values
('Aldo','Cardenas','DNI','45815911','1988-10-24','PER','92815405','cardenastaldo24@gmail.com');



select * from Pasajero;


select * from Pago;


select * from Vuelo;


select Nombre from pais;



