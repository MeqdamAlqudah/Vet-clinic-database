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
WHERE date_of_birth>='1990-01-01' AND date_of_birth<='2001-01-01' 
GROUP BY species;