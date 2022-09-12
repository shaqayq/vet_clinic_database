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