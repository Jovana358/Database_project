-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.2
-- PostgreSQL version: 12.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database;
-- -- ddl-end --
-- 

-- object: it_akademija | type: SCHEMA --
-- DROP SCHEMA IF EXISTS it_akademija CASCADE;
CREATE SCHEMA it_akademija;
-- ddl-end --

-- object: akademija | type: SCHEMA --
-- DROP SCHEMA IF EXISTS akademija CASCADE;
CREATE SCHEMA akademija;
-- ddl-end --

SET search_path TO pg_catalog,public,it_akademija,akademija;
-- ddl-end --

-- object: akademija.it_akademija | type: TABLE --
-- DROP TABLE IF EXISTS akademija.it_akademija CASCADE;
CREATE TABLE akademija.it_akademija (
	id_it_akademije integer NOT NULL,
	grad text,
	CONSTRAINT it_akademija_pk PRIMARY KEY (id_it_akademije)

);
-- ddl-end --

-- object: akademija.ucionica | type: TABLE --
-- DROP TABLE IF EXISTS akademija.ucionica CASCADE;
CREATE TABLE akademija.ucionica (
	broj_ucionice integer NOT NULL,
	kapacitet integer,
	it_akademija integer,
	CONSTRAINT ucionica_pk PRIMARY KEY (broj_ucionice)

);
-- ddl-end --

-- object: akademija.smijer | type: TABLE --
-- DROP TABLE IF EXISTS akademija.smijer CASCADE;
CREATE TABLE akademija.smijer (
	naziv text,
	id_smijera integer NOT NULL,
	it_akademija integer,
	CONSTRAINT smijer_pk PRIMARY KEY (id_smijera)

);
-- ddl-end --

-- object: akademija.kurs | type: TABLE --
-- DROP TABLE IF EXISTS akademija.kurs CASCADE;
CREATE TABLE akademija.kurs (
	naziv text,
	id_kursa integer NOT NULL,
	cijena float,
	trajanje integer,
	smijer integer,
	CONSTRAINT kurs_pk PRIMARY KEY (id_kursa)

);
-- ddl-end --

-- object: akademija.asistent | type: TABLE --
-- DROP TABLE IF EXISTS akademija.asistent CASCADE;
CREATE TABLE akademija.asistent (
	ime_i_prezime text,
	jmbg_asistenta text NOT NULL,
	kurs integer,
	CONSTRAINT asistent_pk PRIMARY KEY (jmbg_asistenta)

);
-- ddl-end --

-- object: akademija.grupa | type: TABLE --
-- DROP TABLE IF EXISTS akademija.grupa CASCADE;
CREATE TABLE akademija.grupa (
	naziv text,
	id_grupe integer NOT NULL,
	kurs integer,
	CONSTRAINT grupa_pk PRIMARY KEY (id_grupe)

);
-- ddl-end --

-- object: akademija.racun | type: TABLE --
-- DROP TABLE IF EXISTS akademija.racun CASCADE;
CREATE TABLE akademija.racun (
	iznos float,
	id_racuna integer NOT NULL,
	polaznik text,
	CONSTRAINT racun_pk PRIMARY KEY (id_racuna)

);
-- ddl-end --

-- object: akademija.polaznik | type: TABLE --
-- DROP TABLE IF EXISTS akademija.polaznik CASCADE;
CREATE TABLE akademija.polaznik (
	ime_i_prezime text,
	jmbg_polaznika text NOT NULL,
	kurs integer,
	grupa integer,
	CONSTRAINT polaznik_pk PRIMARY KEY (jmbg_polaznika)

);
-- ddl-end --

-- object: akademija.cas | type: TABLE --
-- DROP TABLE IF EXISTS akademija.cas CASCADE;
CREATE TABLE akademija.cas (
	datum date,
	vrijeme time,
	id_casa integer NOT NULL,
	grupa integer,
	ucionica integer,
	CONSTRAINT cas_pk PRIMARY KEY (id_casa)

);
-- ddl-end --

-- object: akademija.predavac | type: TABLE --
-- DROP TABLE IF EXISTS akademija.predavac CASCADE;
CREATE TABLE akademija.predavac (
	ime_i_prezime text,
	jmbg_predavaca text NOT NULL,
	it_akademija integer,
	kurs integer,
	specijalnost integer,
	CONSTRAINT predavac_pk PRIMARY KEY (jmbg_predavaca)

);
-- ddl-end --

-- object: akademija.specijalnost | type: TABLE --
-- DROP TABLE IF EXISTS akademija.specijalnost CASCADE;
CREATE TABLE akademija.specijalnost (
	naziv text,
	id_specijalnosti integer NOT NULL,
	CONSTRAINT specijalnost_pk PRIMARY KEY (id_specijalnosti)

);
-- ddl-end --

-- object: it_akademija_ucionica | type: CONSTRAINT --
-- ALTER TABLE akademija.ucionica DROP CONSTRAINT IF EXISTS it_akademija_ucionica CASCADE;
ALTER TABLE akademija.ucionica ADD CONSTRAINT it_akademija_ucionica FOREIGN KEY (it_akademija)
REFERENCES akademija.it_akademija (id_it_akademije) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: smijer_it_akademija | type: CONSTRAINT --
-- ALTER TABLE akademija.smijer DROP CONSTRAINT IF EXISTS smijer_it_akademija CASCADE;
ALTER TABLE akademija.smijer ADD CONSTRAINT smijer_it_akademija FOREIGN KEY (it_akademija)
REFERENCES akademija.it_akademija (id_it_akademije) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: kurs_smijer | type: CONSTRAINT --
-- ALTER TABLE akademija.kurs DROP CONSTRAINT IF EXISTS kurs_smijer CASCADE;
ALTER TABLE akademija.kurs ADD CONSTRAINT kurs_smijer FOREIGN KEY (smijer)
REFERENCES akademija.smijer (id_smijera) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: asistent_kurs | type: CONSTRAINT --
-- ALTER TABLE akademija.asistent DROP CONSTRAINT IF EXISTS asistent_kurs CASCADE;
ALTER TABLE akademija.asistent ADD CONSTRAINT asistent_kurs FOREIGN KEY (kurs)
REFERENCES akademija.kurs (id_kursa) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: grupa_kurs | type: CONSTRAINT --
-- ALTER TABLE akademija.grupa DROP CONSTRAINT IF EXISTS grupa_kurs CASCADE;
ALTER TABLE akademija.grupa ADD CONSTRAINT grupa_kurs FOREIGN KEY (kurs)
REFERENCES akademija.kurs (id_kursa) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: racun_polaznik | type: CONSTRAINT --
-- ALTER TABLE akademija.racun DROP CONSTRAINT IF EXISTS racun_polaznik CASCADE;
ALTER TABLE akademija.racun ADD CONSTRAINT racun_polaznik FOREIGN KEY (polaznik)
REFERENCES akademija.polaznik (jmbg_polaznika) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: polaznik_kurs | type: CONSTRAINT --
-- ALTER TABLE akademija.polaznik DROP CONSTRAINT IF EXISTS polaznik_kurs CASCADE;
ALTER TABLE akademija.polaznik ADD CONSTRAINT polaznik_kurs FOREIGN KEY (kurs)
REFERENCES akademija.kurs (id_kursa) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: polaznik_grupa | type: CONSTRAINT --
-- ALTER TABLE akademija.polaznik DROP CONSTRAINT IF EXISTS polaznik_grupa CASCADE;
ALTER TABLE akademija.polaznik ADD CONSTRAINT polaznik_grupa FOREIGN KEY (grupa)
REFERENCES akademija.grupa (id_grupe) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: cas_grupa | type: CONSTRAINT --
-- ALTER TABLE akademija.cas DROP CONSTRAINT IF EXISTS cas_grupa CASCADE;
ALTER TABLE akademija.cas ADD CONSTRAINT cas_grupa FOREIGN KEY (grupa)
REFERENCES akademija.grupa (id_grupe) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: cas_ucionica | type: CONSTRAINT --
-- ALTER TABLE akademija.cas DROP CONSTRAINT IF EXISTS cas_ucionica CASCADE;
ALTER TABLE akademija.cas ADD CONSTRAINT cas_ucionica FOREIGN KEY (ucionica)
REFERENCES akademija.ucionica (broj_ucionice) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: predavac_it_akademija | type: CONSTRAINT --
-- ALTER TABLE akademija.predavac DROP CONSTRAINT IF EXISTS predavac_it_akademija CASCADE;
ALTER TABLE akademija.predavac ADD CONSTRAINT predavac_it_akademija FOREIGN KEY (it_akademija)
REFERENCES akademija.it_akademija (id_it_akademije) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: predavac_kurs | type: CONSTRAINT --
-- ALTER TABLE akademija.predavac DROP CONSTRAINT IF EXISTS predavac_kurs CASCADE;
ALTER TABLE akademija.predavac ADD CONSTRAINT predavac_kurs FOREIGN KEY (kurs)
REFERENCES akademija.kurs (id_kursa) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: predavac_specijalnost | type: CONSTRAINT --
-- ALTER TABLE akademija.predavac DROP CONSTRAINT IF EXISTS predavac_specijalnost CASCADE;
ALTER TABLE akademija.predavac ADD CONSTRAINT predavac_specijalnost FOREIGN KEY (specijalnost)
REFERENCES akademija.specijalnost (id_specijalnosti) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


