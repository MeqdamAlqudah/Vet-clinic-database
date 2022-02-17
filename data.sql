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
