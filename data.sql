BEGIN TRANSACTION;
UPDATE animals
SET species='unspecified' ;

ROLLBACK TRANSACTION;

BEGIN TRANSACTION;
UPDATE animals
SET species='digimon' WHERE name LIKE '%mon' ;
UPDATE animals
SET species='pokemon' WHERE species IS NULL;
COMMIT TRANSACTION;
SELECT species FROM animals;


BEGIN TRANSACTION;
DELETE FROM animals;
ROLLBACK TRANSACTION;
SELECT species FROM animals;


BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth >= '2022-01-01';
SAVEPOINT beforeChange;
UPDATE animals
SET weight_kg = weight_kg*-1;
ROLLBACK TO beforeChange;
SELECT COUNT(*) FROM ANIMALS;
UPDATE animals
SET weight_kg = weight_kg*-1 WHERE weight_kg<0;
COMMIT TRANSACTION;
SELECT species FROM animals;


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
