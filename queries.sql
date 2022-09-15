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

/*Update the animals table by setting the species column to digimon and pokemon*/
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

/**********What animals belong to Melody Pond?*********/
SELECT * FROM animals JOIN owners on owners.id=animals.owner_id where full_name='Melody Pond'

/**********List of all animals that are pokemon (their type is Pokemon).*********/
SELECT * FROM animals JOIN species on species.id=animals.species_id where species.name='Pokemon'

/**********List all owners and their animals, remember to include those that don't own any animal.*********/
SELECT * FROM owners LEFT JOIN animals on owners.id = animals.owner_id

/**********How many animals are there per species?*********/
SELECT count(animals.name), species.name from animals JOIN species on animals.species_id=species.id
group by species.name

/**********List all Digimon owned by Jennifer Orwell.*********/
SELECT * FROM animals JOIN owners owners.id=animals.owner_id  JOIN species on species.id=animals.species_id
where owners.full_name='Jennifer Orwell' AND species.name='Digimon'

/**********List all animals owned by Dean Winchester that haven't tried to escape.*********/
SELECT * FROM animals JOIN owners on owners.id=animals.owner_id 
where animals.escape_attempts=0 AND owners.full_name='Dean Winchester'

/**********Who owns the most animals?*********/
SELECT max(mavNum) from (
    select count(animals.name)as maxNum from animals JOIN owners on owners.id=animals.owner_id
    group by owners.full_name
) as x


/*****************RELATIONAL TABLES*****************************/

/********************Who was the last animal seen by William Tatcher?******************/
select DISTINCT ON (date_of_visit) name,date_of_visit from (
	select animals."name" , visits.date_of_visit , vets."name" as vet_name from animals 
	join visits on visits.animal_id = animals.id
	join vets ON vets.id = visits.vet_id
	WHERE vets."name"='William Tatcher'
) as allRecord
ORDER BY date_of_visit DESC
LIMIT 1

/*************How many different animals did Stephanie Mendez see?*******************/
select count(*) from (
	select vets."name" as vet_name , animals."name" from animals 
	join visits on visits.animal_id = animals.id
	join vets ON vets.id = visits.vet_id
	WHERE vets."name"='Stephanie Mendez'
	group BY animals."name" , vets."name"
) as allRecord

/***************List all vets and their specialties, including vets with no specialties.**************/
select vets."name" as vet_name , species."name" as species_name from species 
FULL join specializations on species.id=specializations.specie_id
FULL join vets ON vets.id = specializations.vet_id

/**********List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.**********/
select animals."name" from animals 
	join visits on visits.animal_id = animals.id
	join vets ON vets.id = visits.vet_id
	WHERE date_of_visit
	BETWEEN '2020-04-01' AND '2020-08-30' AND vets."name"='Stephanie Mendez' 

/**********What animal has the most visits to vets?**********/
select count(animals."name" )as numVisit , animals."name" from animals 
	join visits on visits.animal_id = animals.id
	join vets ON vets.id = visits.vet_id
	GROUP by animals."name"
	ORDER by numVisit DESC
	limit 1
    
/**********Who was Maisy Smith's first visit?**********/
select DISTINCT ON (date_of_visit) name,date_of_visit from (
	select animals."name" , visits.date_of_visit , vets."name" as vet_name from animals 
	join visits on visits.animal_id = animals.id
	join vets ON vets.id = visits.vet_id
	WHERE vets."name"='Maisy Smith'
) as allRecord
ORDER BY date_of_visit ASC
LIMIT 1

/**********Details for most recent visit: animal information, vet information, and date of visit.**********/
select DISTINCT ON (date_of_visit) * from (
	select * from animals 
	join visits on visits.animal_id = animals.id
	join vets ON vets.id = visits.vet_id
) as allRecord
ORDER BY date_of_visit DESC
LIMIT 1

/*************How many visits were with a vet that did not specialize in that animal's species?*******************/
select count(*) from (
	select * from species 
	FULL join specializations on species.id=specializations.specie_id
	FULL join vets ON vets.id = specializations.vet_id
	WHERE species.name is NULL
) as allRecord


/************What specialty should Maisy Smith consider getting? Look for the species she gets the most.***/
select max(maxEsp) , name from (
select count(*) as maxEsp , species."name"  from species 
 join visits on species.id= visits.animal_id
 join vets ON vets.id = visits.vet_id
 group by species."name"
) as laaRecord
 group by name
 ORDER by max DESC
 limit 1