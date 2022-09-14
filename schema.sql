/*Create Database*/

CREATE DATABASE vet_clinic

/*Create Table*/

create TABLE animals (
	id  SERIAL PRIMARY KEY,
	name VARCHAR(99),
	date_of_birth date,
	escape_attempts int,
	neutered bool,
	weight_kg DECIMAL
)

/***************Update AND Delete**************************/

/*Add new column*/
ALTER TABLE animals ADD species VARCHAR(100)


/*********************JOIN***************************/

/****Create owner table*******/
create table owners (
	id  SERIAL PRIMARY key ,
	full_name varchar(100),
	age int
)

/****Create species table*******/
create table species  (
	id  SERIAL PRIMARY key ,
	name varchar(100),
	
)

/****DROP Species Column*******/
alter table animals DROP COLUMN species

/*******ADD FORIEGN COLUMN*********/
ALTER TABLE animals 
ADD species_id INT,
ADD owner_id  INT;

/************ADD CONSTRAINto TO ANIMALS TABLE**************/
ALTER TABLE animals ADD CONSTRAINT species_id FOREIGN KEY (species_id)
REFERENCES species(id)

ALTER TABLE animals ADD CONSTRAINT owner_id FOREIGN KEY (owner_id)
REFERENCES owners(id)
