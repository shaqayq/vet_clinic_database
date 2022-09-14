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