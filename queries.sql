SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE  '2016-01-01' <=date_of_birth AND  date_of_birth < '2020-01-01';
SELECT name FROM animals WHERE  neutered = TRUE AND  escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE  name = "Agumon" OR  name ="Pikachu";
SELECT name, escape_attempts FROM animals WHERE  weight_kg>10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE NOT name = "Gabumon";
SELECT * FROM animals WHERE  10.4 <=weight_kg AND  weight_kg <=17.3 ;

