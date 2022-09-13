/*Find all animals whose name ends in "mon".*/
SELECT * from animals WHERE name like '%mon'

/*List the name of all animals born between 2016 and 2019*/
SELECT name from  animals WHERE date_of_birth between '2016-01-01' and '2019-12-31'

/*List the name of all animals that are neutered and have less than 3 escape attempts*/
SELECT name from  animals WHERE neutered = true AND escape_attempts < 3

/*List the date of birth of all animals named either "Agumon" or "Pikachu"*/
SELECT date_of_birth from  animals where name='Agumon' or name='Pikachu'

/*List name and escape attempts of animals that weigh more than 10.5kg*/
SELECT name from  animals where weight_kg>10.5

/*Find all animals that are neutered*/
SELECT * from animals where neutered = true

/*Find all animals not named Gabumon*/  
SELECT * from animals where name != 'Gabumon'

/*Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)*/ 
SELECT * from animals where weight_kg >= 10.4 AND weight_kg<=17.3

/*********************************Update AND Delete*******************************************/

/*update the animals table by setting the species column to unspecified and than RollBack it*/
BEGIN;
update animals set species='unspecified';
ROLLBACK;

/*Update the animals table by setting the species column to digimon and */
BEGIN;
UPDATE animals set species='digimon' where name like '%mon';
update animals set species='pokemon' where species IS NULL;
SELECT * FROM animals;
commit;

/*RollBack animals records*/
BEGIN;
DELETE from animals;
Rollback;

/*Rollbacks all animals update*/
BEGIN;
DELETE from animals where date_of_birth > '2022-01-01';
SAVEPOINT spUpdate;
update animals set weight_kg= -1*weight_kg;
ROLLBACK TO spUpdate;
update animals set weight_kg= weight_kg*(-1) where weight_kg<0;
COMMIT;

/*How many animals are there?*/
select count(*) from animals

/*How many animals have never tried to escape?*/
select count(*) from animals where escape_attempts=0

/*What is the average weight of animals?*/
select avg(weight_kg) from animals

/*Who escapes the most, neutered or not neutered animals?*/
select max(weight_kg),neutered from animals group by neutered

/*What is the minimum and maximum weight of each type of animal?*/
select species, max(weight_kg),min(weight_kg) from animals GROUP by species

/*What is the average number of escape attempts per animal type of those born between 1990 and 2000?*/
select species, avg(escape_attempts) from animals where date_of_birth
between '1990-01-01' AND '2000-12-31'
GROUP by species 
