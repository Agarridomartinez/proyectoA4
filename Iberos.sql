DROP DATABASE iberos;
CREATE DATABASE IF NOT EXISTS iberos;
USE iberos;

CREATE TABLE oppidum (
  	Nombre VARCHAR(40) NOT NULL,
  	Localizacion VARCHAR(120) NOT NULL,
  	PRIMARY KEY (Nombre(40), Localizacion(40))
);

CREATE TABLE territorio (
  	Nombre VARCHAR(120) NOT NULL,
  	Extension_km2 FLOAT NOT NULL,
  	PRIMARY KEY (Nombre)
);

CREATE TABLE tribu (
 	Nombre VARCHAR(40) NOT NULL,
  	PRIMARY KEY (Nombre)
);

CREATE TABLE persona (
  	Nombre VARCHAR(40) NOT NULL,
  	PRIMARY KEY (Nombre)
);

CREATE TABLE noble (
  	Nombre VARCHAR(40) NOT NULL,
  	Titulo VARCHAR(40) NOT NULL,
  	PRIMARY KEY (Nombre)
);

CREATE TABLE regulo (
    Nombre VARCHAR(40) NOT NULL,
    Anio_inicio_reinado INT NOT NULL,
    Anio_fin_reinado INT NOT NULL,
    PRIMARY KEY (Nombre)
);

CREATE TABLE sacerdote (
      Nombre VARCHAR(40) NOT NULL,
      Culto VARCHAR(40) NOT NULL,
      PRIMARY KEY (Nombre)
);

CREATE TABLE guerrero (
      Nombre VARCHAR(40) NOT NULL,
      Rango VARCHAR(40) NOT NULL,
      PRIMARY KEY (Nombre)
);

CREATE TABLE reinado (
      Nombre_regulo VARCHAR(40) NOT NULL,
      Nombre_tribu VARCHAR(40) NOT NULL,
      Anio_inicio_reinado INT NOT NULL,
      Anio_fin_reinado INT NOT NULL,
      PRIMARY KEY (Nombre_regulo, Nombre_tribu)
);

CREATE TABLE gobierno (
      Nombre_noble VARCHAR(40) NOT NULL,
      Nombre_oppidum VARCHAR(40) NOT NULL,
      PRIMARY KEY (Nombre_noble, Nombre_oppidum)
);

CREATE TABLE ocupa (
      Nombre_oppidum VARCHAR(40) NOT NULL,
      Nombre_tribu VARCHAR(40) NOT NULL,
      PRIMARY KEY (Nombre_oppidum(40), Nombre_tribu(40))
);

CREATE TABLE domina (
      Nombre_tribu VARCHAR(40) NOT NULL,
      Nombre_territorio VARCHAR(40) NOT NULL,
      PRIMARY KEY (Nombre_tribu(40), Nombre_territorio(40))
);

CREATE TABLE habita (
      Nombre_persona VARCHAR(40) NOT NULL,
      Nombre_oppidum VARCHAR(40) NOT NULL,
      PRIMARY KEY (Nombre_persona(40), Nombre_oppidum(40))
);

    ALTER TABLE
      habita
    ADD
      CONSTRAINT persona_habita_fk FOREIGN KEY (Nombre_persona) REFERENCES persona(Nombre) ON DELETE NO ACTION ON UPDATE CASCADE;
    ALTER TABLE
      habita
    ADD
      CONSTRAINT oppidum_habita_fk FOREIGN KEY (Nombre_oppidum) REFERENCES oppidum(Nombre) ON DELETE NO ACTION ON UPDATE CASCADE;
    ALTER TABLE
      noble
    ADD
      CONSTRAINT persona_noble_fk FOREIGN KEY (Nombre) REFERENCES persona(Nombre) ON DELETE CASCADE ON UPDATE CASCADE;
    ALTER TABLE
      guerrero
    ADD
      CONSTRAINT persona_guerrero_fk FOREIGN KEY (Nombre) REFERENCES persona(Nombre) ON DELETE CASCADE ON UPDATE CASCADE;
    ALTER TABLE
      sacerdote
    ADD
      CONSTRAINT persona_sacerdote_fk FOREIGN KEY (Nombre) REFERENCES persona(Nombre) ON DELETE CASCADE ON UPDATE CASCADE;
    ALTER TABLE
      regulo
    ADD
      CONSTRAINT persona_regulo_fk FOREIGN KEY (Nombre) REFERENCES persona(Nombre) ON DELETE CASCADE ON UPDATE CASCADE;
    ALTER TABLE
      gobierno
    ADD
      CONSTRAINT gobierno_noble_fk FOREIGN KEY (Nombre_noble) REFERENCES persona(Nombre) ON DELETE NO ACTION ON UPDATE CASCADE;
    ALTER TABLE
      gobierno
    ADD
      CONSTRAINT gobierno_oppidum_fk FOREIGN KEY (Nombre_oppidum) REFERENCES oppidum(Nombre) ON DELETE NO ACTION ON UPDATE CASCADE;
    ALTER TABLE
      reinado
    ADD
      CONSTRAINT reinado_regulo_fk FOREIGN KEY (Nombre_regulo) REFERENCES persona(Nombre) ON DELETE NO ACTION ON UPDATE CASCADE;
    ALTER TABLE
      reinado
    ADD
      CONSTRAINT reinado_tribu_fk FOREIGN KEY (Nombre_tribu) REFERENCES tribu(Nombre) ON DELETE NO ACTION ON UPDATE CASCADE;
    ALTER TABLE
      ocupa
    ADD
      CONSTRAINT ocupa_oppidum_fk FOREIGN KEY (Nombre_oppidum) REFERENCES oppidum(Nombre) ON DELETE NO ACTION ON UPDATE CASCADE;
    ALTER TABLE
      ocupa
    ADD
      CONSTRAINT ocupa_tribu_fk FOREIGN KEY (Nombre_tribu) REFERENCES tribu(Nombre) ON DELETE NO ACTION ON UPDATE CASCADE;
    ALTER TABLE
      domina
    ADD
      CONSTRAINT domina_territorio_fk FOREIGN KEY (Nombre_territorio) REFERENCES territorio(Nombre) ON DELETE NO ACTION ON UPDATE CASCADE;
    ALTER TABLE
      domina
    ADD
      CONSTRAINT domina_tribu_fk FOREIGN KEY (Nombre_tribu) REFERENCES tribu(Nombre) ON DELETE NO ACTION ON UPDATE CASCADE;

      /*Usamos el tipo VARCHAR para los nombres de oppidums, tribus, personas y territorios porque almacenan cadenas de texto*/
      /*Usamos FLOAT para la extensión de los territorios porque necesitamos almacenar un valor numérico no entero*/
      /*Usamos VARCHAR para los campos año_inicio_reinado y año_fin_reinado, porque a parte del año también queremos indicar que fue antes de crito "*/
      /*En las restricciones de clave foránea de los subtipos de persona, usamos update cascade y delete cascade porque si eliminamos una persona, también eliminamos su especificación.*/
      /*En las restricciones por clave foránea en las tablas habita, gobierno, reinado, ocupa y domina usamos update cascade y delete no action, porque si actualizamos los datos queremos
      que se reflejen los cambios y si eliminamos algún registro en las tablas referenciadas, queremos que se mantengan los datos en la tabla donde se relacionan.*/

      /*DML*/
    Insert INTO
      persona (nombre)
    VALUES
      ("Cerdubeles");
    Insert INTO
      persona (nombre)
    VALUES
      ("Himilce");
    Insert INTO
      persona (nombre)
    VALUES
      ("Indibil");
    Insert INTO
      persona (nombre)
    VALUES
      ("Amusico");
    Insert INTO
      persona (nombre)
    VALUES
      ("Edecón");
    Insert INTO
      persona (nombre)
    VALUES
      ("Bilistages");
    Insert INTO
      persona (nombre)
    VALUES
      ("Mandonio");
    Insert INTO
      persona (nombre)
    VALUES
      ("Andobales");
    Insert INTO
      guerrero (nombre, rango)
    VALUES
      ("Edecón", "General");
    Insert INTO
      guerrero (nombre, rango)
    VALUES
      ("Bilistages", "Comandante");
    Insert INTO
      sacerdote (nombre, culto)
    VALUES
      ("Amusico", "Neton");
    Insert INTO
      sacerdote (nombre, culto)
    VALUES
      ("Himilce", "Ataecina");
    Insert INTO
      noble (nombre, titulo)
    VALUES
      ("Indibil", "Rey");
    Insert INTO
      noble (nombre, titulo)
    VALUES
      ("Himilce", "Princesa");
    Insert INTO
      regulo (nombre, Anio_inicio_reinado, Anio_fin_reinado)
    VALUES
      ("Andobales", 218 , 201 );
    Insert INTO
      regulo (nombre, Anio_inicio_reinado, Anio_fin_reinado)
    VALUES
      ("Cerdubeles", 206 , 196 );
    Insert INTO
      regulo (nombre, Anio_inicio_reinado, Anio_fin_reinado)
    VALUES
      ("Edecon", 215 , 209 );
    Insert INTO
      tribu (nombre)
    VALUES
      ("Oretanos");
    Insert INTO
      tribu (nombre)
    VALUES
      ("Edetanos");
    Insert INTO
      tribu (nombre)
    VALUES
      ("Lacetanos");
    Insert INTO
      territorio (nombre, Extension_km2)
    VALUES
      ("Oretania", 7642);
    Insert INTO
      territorio (nombre, Extension_km2)
    VALUES
      ("Edetania", 8545);
    Insert INTO
      territorio (nombre, Extension_km2)
    VALUES
      ("Lacetania", 6819);
    Insert INTO
      oppidum (nombre, Localizacion)
    VALUES
      ("Leiria", "Liria-Valencia");
    Insert INTO
      oppidum (nombre, Localizacion)
    VALUES
      ("Castulo", "Linares-Jaén");
    Insert INTO
      oppidum (nombre, Localizacion)
    VALUES
      ("Setelsis", "Solsona-Lérida");
    Insert INTO
      reinado (
        Nombre_regulo,
        Nombre_tribu,
        Anio_inicio_reinado,
        Anio_fin_reinado
      )
    VALUES
      ("Andobales", "Lacetanos", 218 , 201 );
    Insert INTO
      reinado (
        Nombre_regulo,
        Nombre_tribu,
        Anio_inicio_reinado,
        Anio_fin_reinado
      )
    VALUES
      ("Cerdubeles", "Oretanos", 206 , 196 );
      
    Insert INTO
      gobierno (Nombre_noble, Nombre_oppidum)
    VALUES
      ("Andobales", "Setelsis");
    Insert INTO
      gobierno (Nombre_noble, Nombre_oppidum)
    VALUES
      ("Himilce", "Castulo");
    Insert INTO
      ocupa (Nombre_tribu, Nombre_oppidum)
    VALUES
      ("Lacetanos", "Setelsis");
    Insert INTO
      ocupa (Nombre_tribu, Nombre_oppidum)
    VALUES
      ("Oretanos", "Castulo");
    Insert INTO
      domina (Nombre_tribu, Nombre_territorio)
    VALUES
      ("Lacetanos", "Lacetania");
    Insert INTO
      domina (Nombre_tribu, Nombre_territorio)
    VALUES
      ("Oretanos", "Oretania");
    Insert INTO
      habita (Nombre_persona, Nombre_oppidum)
    VALUES
      ("Cerdubeles", "Castulo");
    Insert INTO
      habita (Nombre_persona, Nombre_oppidum)
    VALUES
      ("Himilce", "Castulo");
    Insert INTO
      habita (Nombre_persona, Nombre_oppidum)
    VALUES
      ("Andobales", "Setelsis");


     /* Updates */

    UPDATE regulo set Anio_inicio_reinado = 210 where nombre like 'Cerdubeles';
    UPDATE territorio set Extension_km2 = 7749 where nombre like 'Oretania';

    /* DELETES */

    DELETE FROM sacerdote where Culto like 'Neton';
    DELETE FROM guerrero where Rango like 'Comandante';


      /*CONSULTAS*/
      /*Selecciona el numero de reyes de los Lacetanos*/
    SELECT
      COUNT(*)
    FROM
      reinado
    WHERE
      Nombre_tribu LIKE "Lacetanos";
      /*Selecciona el nombre de la persona que gobierna un oppidum*/
    SELECT
      (Nombre_noble)
    FROM
      gobierno
    WHERE
      Nombre_oppidum LIKE "Setelsis";
      /*Muestra el numero de habitantes que tiene un oppidum*/
    SELECT
      COUNT(*)
    FROM
      habita
    WHERE
      Nombre_oppidum LIKE "Castulo";
      /*Muestra los años en los que un regulo ha reinado*/
    SELECT
      r.Anio_inicio_reinado,
      r.Anio_fin_reinado
    FROM
      reinado r
      INNER JOIN regulo reg ON r.Nombre_regulo = reg.Nombre
    WHERE
      r.Anio_inicio_reinado > 200;


    /* Consulta con mas de una tabla con where en el que mostramos los territorios con extensión mayor a 7000 km y el nombre del regulo. */

    SELECT reg.Nombre, d.Nombre_tribu, d.Nombre_territorio, t.Extension_km2 FROM territorio t, domina d, regulo reg, reinado r WHERE
     reg.Nombre=r.Nombre_regulo 
     and r.Nombre_tribu = d.Nombre_tribu 
     and d.Nombre_territorio = t.Nombre 
     and t.Extension_km2 > 7000;

    
