create database REGINA;
USE REGINA;

create table doctor (
id_doctor int(13) primary key not null auto_increment,
primer_apellido nchar(20),
segundo_apellido nchar(20),
nombre nvarchar(20),
fecha_nacim date,
cedula nvarchar(40),
correo nvarchar(40),
telefono nvarchar(10),
foto longblob
);
drop table doctor;

create table paciente (
clave int(13) primary key not null,
primer_apellido nchar(20),
segundo_apellido nchar(20),
nombre nvarchar(20),
fecha_nacim date,
curp nchar(18),
telefono nvarchar(10),
id_doctor int(13),
constraint fk_doctor foreign key (id_doctor) references doctor(id_doctor)
);
drop table paciente;

create table expediente (
id_expediente int primary key not null auto_increment,
clave_paciente int(13), 
constraint fk_paciente foreign key (clave_paciente) references paciente(clave),
id_doctor int(13),
constraint fk_expDoctor foreign key (id_doctor) references doctor(id_doctor),
 fecha datetime,
 motivo nvarchar(4000),
 diagnostico nvarchar(4000),
 tratamiento nvarchar(4000),
 comentario nvarchar(4000)
);
drop table expediente;

create table adminBDD (
	id_empleado int(10) primary key not null auto_increment,
    primer_apellido nchar(20),
    segundo_apellido nchar(20),
    nombre nvarchar(20),
    fecha_nacim date,
    telefono nvarchar(10)
);
drop table adminBDD;

create table perfiles (
	roles nchar(20),
    primary key (roles),
    id_empleadoBDD int(10), 
	constraint fk_perfEmpleBDD foreign key (id_empleadoBDD) references adminBDD(id_empleado),
	id_doctores int(13),
	constraint fk_perfDoctor foreign key (id_doctores) references doctor(id_doctor),
    contrasenia nvarchar(10),
    descripcion nvarchar(255)
);
drop table perfiles;