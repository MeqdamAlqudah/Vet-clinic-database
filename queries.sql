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


SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE  '2016-01-01' <=date_of_birth AND  date_of_birth < '2020-01-01';
SELECT name FROM animals WHERE  neutered = TRUE AND  escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE  name = "Agumon" OR  name ="Pikachu";
SELECT name, escape_attempts FROM animals WHERE  weight_kg>10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE NOT name = "Gabumon";
SELECT * FROM animals WHERE  10.4 <=weight_kg AND  weight_kg <=17.3 ;

-- How many animals are there?
SELECT COUNT(*)
FROM animals;
-- How many animals have never tried to escape?
SELECT COUNT(escape_attempts)
FROM animals
WHERE escape_attempts =0;
-- What is the average weight of animals?
SELECT AVG(weight_kg)
FROM animals;
-- Who escapes the most, neutered or not neutered animals?
SELECT MAX(escape_attempts)
FROM animals
WHERE neutered = TRUE OR neutered = FALSE;
-- What is the minimum and maximum weight of each type of animal?
SELECT species, MAX(weight_kg),MIN(weight_kg)
FROM animals
GROUP BY species;
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species,AVG(escape_attempts)
FROM animals
WHERE date_of_birth>='1990-01-01' AND date_of_birth<'2001-01-01' 
GROUP BY species;