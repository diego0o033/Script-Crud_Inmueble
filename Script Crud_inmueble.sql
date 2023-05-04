-- ****************************************************************** --
--   DDL : Lenguaje de Definicón de Datos
-- ****************************************************************** --

-- verifico que no exista la bases de datos
show databases;


-- creo base de datos
create database crud_inmueble;


-- verifico que se creo la bd correctamente
show databases;



-- entro a la base de datos creada para poder crear las tablas
use crud_inmueble; 




-- controlo que no tenga tablas y sea accesible
show tables;



-- crear una tabla en la base de datos
create table inmueble( id_inmueble int not null
                      ,codigo_inmueble int not null
                      ,tipo_inmueble int not null
                      ,tipo_moneda decimal(8,2) not null
                      ,valor varchar(45)
                      , direccion varchar(20)
                      , altura int 
                      , localidad varchar(20)
                      , cantidad_ambientes int
                      , metros_cuadrados int
                      );
 
 create table tipo_inmueble( id_tipo_inmueble int not null
                      ,descripcion_inmueble varchar(20)
                      );                     
 
 create table tipo_moneda( id_tipo_moneda int not null
                      ,descripcion_moneda varchar(20)
                      );                          
-- controlo que se haya creado bien la tabla
show tables; 
 
-- Creo clave primaria y la hago autoincremental
alter table id_inmueble add primary key (id_inmueble);


-- Clave primaria: la hago autoincremental
alter table id_inmueble modify id_inmueble int auto_increment;

-- Creo clave primaria y la hago autoincremental
alter table id_tipo_inmueble add primary key (id_tipo_inmueble);


-- Clave primaria: la hago autoincremental
alter table id_tipo_inmueble modify id_tipo_inmueble int auto_increment;

-- Creo clave primaria y la hago autoincremental
alter table id_tipo_moneda add primary key (id_tipo_moneda);


-- Clave primaria: la hago autoincremental
alter table id_tipo_moneda modify id_tipo_moneda int auto_increment;


-- ****************************************************************** --
--   DML-DQL : Lenguaje de Manipulación y Consulta de Datos 
-- ****************************************************************** --

-- Verificamos si existe almacenado en nuestra bd el codigo de inmueble que queremos almacenar
select count(*) from inmueble where codigo_inmueble= ?;

-- Seleccionamos todos los registros de la tabla, ordenados de forma ascendente y los mostramos en la tabla
select codigo_inmueble,descripcion_inmueble,descripcion_moneda,valor,direccion,altura,localidad,cantidad_ambientes,metros_cuadrados  
from inmueble inner join tipo_inmueble on tipo_inmueble= tipo_inmueble.id_tipo_inmueble
inner join tipo_moneda on tipo_moneda= tipo_moneda.id_tipo_moneda 
order by codigo_inmueble asc;

-- Insertamos un registro del tipo inmueble en la bd (los datos los recibimos del formulario)
insert into inmueble (codigo_inmueble,tipo_inmueble,tipo_moneda,valor,direccion,altura,localidad,cantidad_ambientes,metros_cuadrados)
                    values (?,?,?,?,?,?,?,?,?);

-- Actualizamos un registro del tipo inmueble en la bd (el dato lo recibimos desde el formulario)
update inmueble set codigo_inmueble=?, tipo_inmueble=?, tipo_moneda=?, valor=?, direccion=?, altura=?, localidad=?,cantidad_ambientes=?,metros_cuadrados=? 
           where codigo_inmueble =  dtoinm.getCodigo_Inmueble();

-- Eliminamos un registro del tipo inmueble en la bd (el dato lo recibimos desde el formulario)
delete from inmueble where codigo_inmueble =  dtoinm.getCodigo_Inmueble();

-- Buscamos registros en la bd (los datos los recibimos desde el formulario)
select codigo_inmueble,descripcion_inmueble,descripcion_moneda,valor,direccion,altura,localidad,cantidad_ambientes,metros_cuadrados 
FROM inmueble inner join tipo_inmueble on tipo_inmueble= tipo_inmueble.id_tipo_inmueble 
inner join tipo_moneda on tipo_moneda= tipo_moneda.id_tipo_moneda 
 WHERE filtro_busqueda like valor_caja_buscar;

                    