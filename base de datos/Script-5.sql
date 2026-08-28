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
