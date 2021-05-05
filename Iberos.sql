DROP DATABASE iberos;

CREATE DATABASE IF NOT EXISTS iberos;

USE iberos;

CREATE TABLE oppidum ( Nombre VARCHAR(40) NOT NULL , Localizacion VARCHAR(120) NOT NULL , PRIMARY KEY (Nombre(40), Localizacion(40)));

CREATE TABLE territorio ( Nombre VARCHAR(120) NOT NULL , Extension_km2 FLOAT NOT NULL , PRIMARY KEY (Nombre));

CREATE TABLE tribu ( Nombre VARCHAR(40) NOT NULL , PRIMARY KEY (Nombre));

CREATE TABLE persona ( Nombre VARCHAR(40) NOT NULL , PRIMARY KEY (Nombre));

CREATE TABLE noble ( Nombre VARCHAR(40) NOT NULL , PRIMARY KEY (Nombre);

CREATE TABLE regulo ( Nombre VARCHAR(40) NOT NULL , PRIMARY KEY (Nombre);

CREATE TABLE sacerdote ( Nombre VARCHAR(40) NOT NULL , Culto VARCHAR(40) NOT NULL , PRIMARY KEY (Nombre));

CREATE TABLE guerrero ( Nombre VARCHAR(40) NOT NULL , Rango VARCHAR(40) NOT NULL , PRIMARY KEY (Nombre));

CREATE TABLE reinado ( Nombre_regulo VARCHAR(40) NOT NULL ,  Nombre_tribu VARCHAR(40) NOT NULL , Ano_inicio_reinado VARCHAR(10) NOT NULL , Ano_fin_reinado VARCHAR(10) NOT NULL , PRIMARY KEY (Nombre_regulo, Nombre_tribu));

CREATE TABLE gobierno ( Nombre_noble VARCHAR(40) NOT NULL , Nombre_oppidum VARCHAR(40) NOT NULL , PRIMARY KEY (Nombre, Nombre_oppidum));

CREATE TABLE ocupa ( Nombre_oppidum VARCHAR(40) NOT NULL , Nombre_tribu VARCHAR(40) NOT NULL , PRIMARY KEY (Nombre_oppidum(40), Nombre_tribu(40)));

CREATE TABLE domina ( Nombre_tribu VARCHAR(40) NOT NULL , Nombre_territorio VARCHAR(40) NOT NULL , PRIMARY KEY (Nombre_tribu(40), Nombre_territorio(40)));

CREATE TABLE habita ( Nombre_persona VARCHAR(40) NOT NULL ,  Nombre_oppidum VARCHAR(40) NOT NULL , PRIMARY KEY (Nombre_persona(40), Nombre_oppidum(40)));

ALTER TABLE habita ADD CONSTRAINT persona_habita_fk FOREIGN KEY (Nombre_persona) REFERENCES persona(Nombre) ON DELETE NO ACTION ON UPDATE CASCADE; ALTER TABLE habita ADD CONSTRAINT oppidum_habita_fk FOREIGN KEY (Nombre_oppidum) REFERENCES oppidum(Nombre) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE noble ADD CONSTRAINT persona_noble_fk FOREIGN KEY (Nombre) REFERENCES persona(Nombre) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE guerrero ADD CONSTRAINT persona_guerrero_fk FOREIGN KEY (Nombre) REFERENCES persona(Nombre) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE sacerdote ADD CONSTRAINT persona_sacerdote_fk FOREIGN KEY (Nombre) REFERENCES persona(Nombre) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE regulo ADD CONSTRAINT persona_regulo_fk FOREIGN KEY (Nombre) REFERENCES persona(Nombre) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE gobierno ADD CONSTRAINT gobierno_noble_fk FOREIGN KEY (Nombre_noble) REFERENCES persona(Nombre) ON DELETE NO ACTION ON UPDATE CASCADE; ALTER TABLE gobierno ADD CONSTRAINT gobierno_oppidum_fk FOREIGN KEY (Nombre_oppidum) REFERENCES oppidum(Nombre) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE reinado ADD CONSTRAINT reinado_regulo_fk FOREIGN KEY (Nombre_regulo) REFERENCES persona(Nombre) ON DELETE NO ACTION ON UPDATE CASCADE; ALTER TABLE reinado ADD CONSTRAINT reinado_tribu_fk FOREIGN KEY (Nombre_tribu) REFERENCES tribu(Nombre) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE ocupa ADD CONSTRAINT ocupa_oppidum_fk FOREIGN KEY (Nombre_oppidum) REFERENCES oppidum(Nombre) ON DELETE NO ACTION ON UPDATE CASCADE;  ALTER TABLE ocupa ADD CONSTRAINT ocupa_tribu_fk FOREIGN KEY (Nombre_tribu) REFERENCES tribu(Nombre) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE domina ADD CONSTRAINT domina_territorio_fk FOREIGN KEY (Nombre_territorio) REFERENCES territorio(Nombre) ON DELETE NO ACTION ON UPDATE CASCADE; ALTER TABLE domina ADD CONSTRAINT domina_tribu_fk FOREIGN KEY (Nombre_tribu) REFERENCES tribu(Nombre) ON DELETE NO ACTION ON UPDATE CASCADE;



/*Usamos el tipo VARCHAR para los nombres de oppidums, tribus, personas y territorios porque almacenan cadenas de texto*/

/*Usamos FLOAT para la extensión de los territorios porque necesitamos almacenar un valor numérico no entero*/

/*Usamos VARCHAR para los campos año_inicio_reinado y año_fin_reinado, porque a parte del año también queremos indicar que fue antes de cristo "a.C"*/

/*En las restricciones de clave foránea de los subtipos de persona, usamos update cascade y delete cascade porque si eliminamos una persona, también eliminamos su especificación.*/

/*En las restricciones por clave foránea en las tablas habita, gobierno, reinado, ocupa y domina usamos update cascade y delete no action, porque si actualizamos los datos queremos
que se reflejen los cambios y si eliminamos algún registro en las tablas referenciadas, queremos que se mantengan los datos en la tabla donde se relacionan.*/



/*CONSULTAS*/


/*Selecciona el numero de reyes de los Turdetanos*/
SELECT COUNT(*) FROM reinado WHERE Nombre_tribu LIKE "Turdetanos";

/*Selecciona el nombre de la persona que gobierna un oppidum*/
SELECT (Nombre) 
FROM gobierno WHERE Nombre_oppidum LIKE "nombreoppidum";

/*Muestra el numero de habitantes que tiene un oppidum*/
SELECT COUNT(*) FROM habita WHERE Nombre_oppidum LIKE "nombreoppidum";

/*Muestra los años en los que un regulo ha reinado*/
SELECT r.Anio_inicio_reinado, r.Anio_fin_reinado

    FROM reinado r INNER JOIN regulo reg ON r.Nombre_regulo = reg.Nombre

    WHERE r.Anio_inicio_reinado < 200;