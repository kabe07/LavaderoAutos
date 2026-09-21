create table servicio(
id_servicio BIGSERIAL primary key,
nombre VARCHAR(12) not null unique ,
descripion VARCHAR(255),
activo BOOLEAN not null default true
);

create table cliente(
id_clente BIGSERIAL primary key,
NOMBRE VARCHAR(50) not null,
TELEFONO VARCHAR(12) not null
);

create table vehiculo(
id_vehiculo BIGSERIAL primary key,
tipovehiculo varchar(25)not null,
marca varchar(50) ,
modelo varchar(50) ,
patente varchar(12) not null unique
);

ALTER TABLE cliente
RENAME COLUMN id_clente TO id_cliente;


create table cliente_vehiculo(
id_cliente bigint not null,
id_vehiculo bigint not null,
primary key(id_cliente, id_vehiculo),

foreign key (id_cliente)
	references cliente (id_cliente),

foreign key (id_vehiculo)
	references vehiculo (id_vehiculo)
);

create table tarifaServicio(
id_tarifa serial primary key,
id_servicio int not null,
tipo_vehiculo varchar(25) not null,
nivel_suciedad varchar(30) not null,
precio decimal(10,2) not null,
duracion_base interval not null,
constraint fk_servicio
foreign key (id_servicio)
references servicio (id_servicio)
);

create table turno(
id_turno serial primary key,
hora_inicio timestamp not null,
id_tarifa integer not null,
duracion_final interval not null,
id_vehiculo bigint not null,
id_cliente bigint not null,
precio_final decimal(10,2) not null,
trabajadores int not null,
estado varchar(30) not null check(estado in ('Pendiente','Confirmado','En Proceso','Finalizado')),
constraint fk_tarifa
foreign key (id_tarifa)
references tarifaServicio(id_tarifa),
constraint fk_vehiculo
foreign key (id_vehiculo)
references vehiculo(id_vehiculo),
constraint fk_cliente
foreign key (id_cliente)
references cliente(id_cliente)
);

create table  bloqueoHorario(
id_bloqueo serial not null,
fechaHoraInicio timestamp not null,
fechaHoraFin timestamp not null);


