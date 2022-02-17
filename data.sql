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


BEGIN TRANSACTION;
DELETE FROM animals;
ROLLBACK TRANSACTION;


BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT beforeChange;
UPDATE animals
SET weight_kg = weight_kg*-1;
ROLLBACK TO beforeChange;
UPDATE animals
SET weight_kg = weight_kg*-1 WHERE weight_kg<0;
COMMIT TRANSACTION;