create database REGINA;
USE REGINA;
drop table usuario;

create table rol (
id_r int primary key not null,
descripcion varchar(16)
);

create table usuario (
id_usuario int primary key not null auto_increment,
usuario varchar(24),
contraseña varchar(16), 
id_rol int not null, 
constraint fk_usuario_rol foreign key (id_rol) references rol(id_r)
);

create table modulo (
id_modulo int primary key not null auto_increment,
descripcion varchar(16)
);

create table permiso(
id_permiso int primary key not null auto_increment,
descripcion varchar(16),
id_modulo int, constraint fk_modulo foreign key(id_modulo) references modulo(id_modulo)
);

create table rol_permiso (
id int primary key not null auto_increment,
id_rol int, constraint fk_rol foreign key(id_rol) references usuario(id_rol),
id_permiso int, constraint fk_permiso foreign key(id_permiso) references permiso(id_permiso)
);

create table doctor (
id_doctor int(13) primary key not null auto_increment,
primer_apellido nvarchar(40),
segundo_apellido nvarchar(40),
nombre nvarchar(40),
edad int(8),
cedula nvarchar(40),
correo nvarchar(40),
foto longblob
);

create table usuario_doctor (
id_udorctor int primary key not null auto_increment,
id_usuario int, constraint fk_udoctor foreign key(id_usuario) references usuario(id_usuario),
id_doctor int, constraint fk_docusuario foreign key(id_doctor) references doctor(id_doctor)
);

create table paciente (
clave int(13) primary key not null,
primer_apellido nvarchar(40),
segundo_apellido nvarchar(40),
nombre nvarchar(40),
edad int(8),
curp nvarchar(40),
telefono int(16),
foto longblob,
id_doctor int, constraint fk_doctor foreign key (id_doctor) references doctor(id_doctor)
);

create table expediente (
id_expediente int primary key not null auto_increment,
clave_paciente int(13), 
constraint fk_paciente foreign key (clave_paciente) references paciente(clave),
 fecha datetime,
 motivo nvarchar(100),
 diagnostico nvarchar(100),
 tratamiento nvarchar(100),
 comentario nvarchar(150)
);

select * from rol_permiso;