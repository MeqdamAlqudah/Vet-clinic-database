INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES ('Agumon','2020-03-02',0,TRUE,10.23),
 ('Gabumon','2018-11-15',2,TRUE,8),
 ('Pikachu','2021-01-07',1,FALSE,15.04),
 ('Devimon','2017-12-05',5,TRUE,11);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES ('Charmander','2020-02-08',0,FALSE,11);
INSERT INTO animals (name,date_of_birth,weight_kg,neutered,escape_attempts)
 VALUES('Plantmon','2022-11-15',-5.7,TRUE,2),
('Squirtle','1993-04-02',-12.13,FALSE,3),
('Angemon','2005-06-12',-45,TRUE,1),
('Boarmon','2005-06-07',20.4,TRUE,7),
('Blossom','1998-10-13',17,TRUE, 3);

-- BEGIN TRANSACTION;
-- UPDATE animals
-- SET species='unspecified' ;

-- ROLLBACK TRANSACTION;

-- BEGIN TRANSACTION;
-- UPDATE animals
-- SET species='digimon' WHERE name LIKE '%mon' ;
-- UPDATE animals
-- SET species='pokemon' WHERE species IS NULL;
-- COMMIT TRANSACTION;
-- SELECT species FROM animals;


-- BEGIN TRANSACTION;
-- DELETE FROM animals;
-- ROLLBACK TRANSACTION;
-- SELECT species FROM animals;


-- BEGIN TRANSACTION;
-- DELETE FROM animals WHERE date_of_birth >= '2022-01-01';
-- SAVEPOINT beforeChange;
-- UPDATE animals
-- SET weight_kg = weight_kg*-1;
-- ROLLBACK TO beforeChange;
-- SELECT COUNT(*) FROM ANIMALS;
-- UPDATE animals
-- SET weight_kg = weight_kg*-1 WHERE weight_kg<0;
-- COMMIT TRANSACTION;
-- SELECT species FROM animals;


-- Insert the following data into the owners table:
-- Sam Smith 34 years old.
-- Jennifer Orwell 19 years old.
-- Bob 45 years old.
-- Melody Pond 77 years old.
-- Dean Winchester 14 years old.
-- Jodie Whittaker 38 years old.
INSERT INTO owners ( full_name,age)
VALUES ('Sam Smith',34),
('Jennifer Orwell',19),
('Bob',45),
('Melody Pond',77),
('Dean Winchester',14),
('Jodie Whittaker',38);

-- Insert the following data into the species table:
-- Pokemon
-- Digimon

INSERT INTO species (name)
VALUES ('Pokemon'),('Digimon');

-- Modify your inserted animals so it includes the species_id value:
-- If the name ends in "mon" it will be Digimon
-- All other animals are Pokemon
UPDATE animals
SET species_id ='Digimon' WHERE name LIKE '%mon';
UPDATE animals
SET species_id = 'Pokemon' WHERE species_id IS NULL;

-- Modify your inserted animals to include owner information (owner_id):
-- Sam Smith owns Agumon.
-- Jennifer Orwell owns Gabumon and Pikachu.
-- Bob owns Devimon and Plantmon.
-- Melody Pond owns Charmander, Squirtle, and Blossom.
-- Dean Winchester owns Angemon and Boarmon.

UPDATE animals 
SET owner_id = 'Sam Smith' WHERE name = 'Agumon';

UPDATE animals 
SET owner_id = 'Jennifer Orwell' WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals 
SET owner_id = 'Bob' WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals 
SET owner_id = 'Melody Pond' WHERE name ='Charmander' OR name ='Squirtle' OR name = 'Blossom';


UPDATE animals 
SET owner_id = 'Dean Winchester' WHERE name = 'Angemon' OR name = 'Boarmon';

-- Insert the following data for vets:
-- Vet William Tatcher is 45 years old and graduated Apr 23rd, 2000.
-- Vet Maisy Smith is 26 years old and graduated Jan 17th, 2019.
-- Vet Stephanie Mendez is 64 years old and graduated May 4th, 1981.
-- Vet Jack Harkness is 38 years old and graduated Jun 8th, 2008.
INSERT INTO vets (name,age,date_of_graduation)
VALUES ('William Tatcher',45,'2000-04-23'),('Maisy Smith',26,'2019-01-17'),
('Stephanie Mendez',64,'1981-05-04'),
('Jack Harkness',38,'2008-06-08');
-- Insert the following data for specialties:
-- Vet William Tatcher is specialized in Pokemon.
-- Vet Stephanie Mendez is specialized in Digimon and Pokemon.
-- Vet Jack Harkness is specialized in Digimon.
INSERT INTO specializations(vets_id,species_id)
VALUES ('William Tatcher','Pokemon'),
('Stephanie Mendez','Digimon'),('Stephanie Mendez','Pokemon'),
('Jack Harkness','Digimon');

-- Insert the following data for visits:
-- Agumon visited William Tatcher on May 24th, 2020.
-- Agumon visited Stephanie Mendez on Jul 22th, 2020.
-- Gabumon visited Jack Harkness on Feb 2nd, 2021.
-- Pikachu visited Maisy Smith on Jan 5th, 2020.
-- Pikachu visited Maisy Smith on Mar 8th, 2020.
-- Pikachu visited Maisy Smith on May 14th, 2020.
-- Devimon visited Stephanie Mendez on May 4th, 2021.
-- Charmander visited Jack Harkness on Feb 24th, 2021.
-- Plantmon visited Maisy Smith on Dec 21st, 2019.
-- Plantmon visited William Tatcher on Aug 10th, 2020.
-- Plantmon visited Maisy Smith on Apr 7th, 2021.
-- Squirtle visited Stephanie Mendez on Sep 29th, 2019.
-- Angemon visited Jack Harkness on Oct 3rd, 2020.
-- Angemon visited Jack Harkness on Nov 4th, 2020.
-- Boarmon visited Maisy Smith on Jan 24th, 2019.
-- Boarmon visited Maisy Smith on May 15th, 2019.
-- Boarmon visited Maisy Smith on Feb 27th, 2020.
-- Boarmon visited Maisy Smith on Aug 3rd, 2020.
-- Blossom visited Stephanie Mendez on May 24th, 2020.
-- Blossom visited William Tatcher on Jan 11th, 2021.
INSERT INTO visits(animals_id,vets_id,visit_date)
VALUES('Agumon','William Tatcher','2020-05-24'),
('Agumon','Stephanie Mendez' ,'2020-07-22'),
('Gabumon','Jack Harkness','2021-02-02'),
('Pikachu','Maisy Smith','2020-06-05'),
('Pikachu','Maisy Smith' ,'2020-03-08'),
('Pikachu','Maisy Smith','2020-05-14'),
('Devimon','Stephanie Mendez','2021-05-04'),
('Charmander', 'Jack Harkness', '2021-02-24'),
('Plantmon','Maisy Smith',  '2019-12-21'),
('Plantmon' ,'William Tatcher',  '2020-08-10'),
('Plantmon' ,'Maisy Smith' , '2021-04-07'),
('Squirtle' ,'Stephanie Mendez' , '2019-11-29'),
('Angemon' , 'Jack Harkness','2020-10-03'),
('Angemon' , 'Jack Harkness','2020-11-04'),
('Boarmon' , 'Maisy Smith',  '2019-06-24'),
('Boarmon' , 'Maisy Smith' , '2019-05-15'),
('Boarmon' , 'Maisy Smith' , '2020-02-27'),
('Boarmon' , 'Maisy Smith' , '2020-08-03'),
('Blossom' , 'Stephanie Mendez' , '2020-05-24'),
('Blossom' , 'William Tatcher' , '2021-06-11');
