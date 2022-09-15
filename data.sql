/*Insert Data*/
Insert INTO animals VALUES
    (1 , 'Agumon' , '2020-02-03' , 0, true,10.23),
	(2 , 'Gabumon' , '2018-10-15' , 2, true,8),
	(3 , 'Pikachu' , '2021-01-7' , 1, false,15.04),
	(4 , 'Devimon' , '2017-05-12' , 5, true,11),


/***************Update AND Delete**************************/

/*Insert new records*/
INSERT into animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES
('Charmander','2020-02-08',0,false,-11),
('Plantmon','2021-11-15',2,true,-5.7),
('Squirtle','1993-04-02',3,false,-12.13),
('Angemon','2005-06-12',1,true,-45),
('Boarmon','2005-06-07',7,true,20.4),
('Blossom','1998-10-13',3,true,17),
('Ditto','2022-05-14',4,true,22);

/************Multi Table*************/

/************INSERT TO OWNER TABLE**************/
INSERT INTO owner (full_name,age) VALUES 
('Sam Smith',34),
('Jennifer Orwell',19),
('Bob',45),
('Melody Pond',77),
('Dean Winchester',14),
('Jodie Whittaker',38);

/************INSERT TO species TABLE**************/
INSERT INTO species (name) VALUES
('Pokemon'),
('Digimon');

/************UPDATE FORIEGNKEY species_id VALUES**************/
UPDATE animals set species_id=2 where name like '%mon'
UPDATE animals set species_id=1 where name !~~ '%mon'

/************UPDATE FORIEGNKEY owner_id VALUES**************/
UPDATE animals set owner_id=1 where name = 'Agumon'
UPDATE animals set owner_id=2 where name = 'Gabumon' OR name='Pikachu'
UPDATE animals set owner_id=3 where name = 'Devimon' OR name='Plantmon'
UPDATE animals set owner_id=4 where name = 'Charmander' OR name='Squirtle' OR name='Blossom'
UPDATE animals set owner_id=5 where name = 'Angemon' OR name='Boarmon'

/***************************RELATIONS***************************************/

/************INSERT INTO VETS TABLE**********/
INSERT INTO vets(name,age,date_of_graduation) VALUES 
('William Tatcher',45,'2000-04-23'),
('Maisy Smith',26,'2019-01-17'),
(' Stephanie Mendez',64,'1981-05-04'),
('Jack Harkness',38,'2008-06-08');

/************INSERT specializations VETS TABLE**********/
INSERT INTO specializations(vet_id,specie_id) VALUES 
(1,1),(3,2),(3,1),(4,2);

/*************INSERT VISITS TABLE VALUE***********/
INSERT INTO visitS(animal_id,vet_id,date_of_visit) VALUES
(1,1,'2020-05-24'),
(1,3,'2020-07-22'),
(2,4,'2021-02-02'),
(3,2,'2020-01-05'),
(3,2,'2020-03-08'),
(3,2,'2020-05-14'),
(4,3,'2021-05-04'),
(5,4,'2021-02-24'),
(6,2,'2019-12-21'),
(6,1,'2020-08-10'),
(6,2,'2021-04-07'),
(7,3,'2019-09-29'),
(1,4,'2020-10-03'),
(1,4,'2020-11-04'),
(9,2,'2019-01-24'),
(9,2,'2019-05-15'),
(9,2,'2020-02-27'),
(9,2,'2020-08-03'),
(9,2,'2020-05-24'),
(9,2,'2021-01-11');


