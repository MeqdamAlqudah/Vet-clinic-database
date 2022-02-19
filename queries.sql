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

-- Write queries (using JOIN) to answer the following questions:
-- What animals belong to Melody Pond?
SELECT full_name,
name
FROM  owners
INNER JOIN animals
ON owners.full_name = animals.owner_id
WHERE full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name
FROM  species
INNER JOIN animals
ON species.name = animals.species_id
WHERE species.name = 'Pokemon';
-- List all owners and their animals, remember to include those that don't own any animal.
SELECT full_name,
name
FROM  owners
FULL JOIN animals
ON owners.full_name = animals.owner_id;

-- How many animals are there per species?
SELECT species.name,
COUNT(animals.name)
FROM  species
INNER JOIN animals
ON species.name = animals.species_id
GROUP BY species.name;
-- List all Digimon owned by Jennifer Orwell.
SELECT animals.name
FROM  species
INNER JOIN animals
ON species.name = animals.species_id
Where species.name = 'Digimon' AND animals.owner_id ='Jennifer Orwell';
-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name
FROM  owners
INNER JOIN animals
ON owners.full_name = animals.owner_id
Where  animals.owner_id ='Dean Winchester' AND animals.escape_attempts =0;
-- Who owns the most animals?
SELECT owners.full_name,
COUNT(animals.name)
FROM  owners
INNER JOIN animals
ON owners.full_name = animals.owner_id
GROUP BY owners.full_name;

-- Write queries to answer the following:
-- Who was the last animal seen by William Tatcher?
SELECT vets_id,animals_id,MAX(visit_date)
FROM visits
WHERE vets_id = 'William Tatcher'
GROUP BY visit_date,vets_id,animals_id
ORDER BY visit_date;
-- How many different animals did Stephanie Mendez see?
SELECT COUNT(animals_id)
FROM visits
WHERE vets_id = 'Stephanie Mendez';
-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name,species_id
FROM specializations
FULL JOIN vets
ON vets.name = specializations.vets_id;
-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals_id
FROM visits
WHERE visits.vets_id = 'Stephanie Mendez'AND visits.visit_date>= '2020-04-01' AND visits.visit_date<= '2020-08-30';
-- What animal has the most visits to vets?
SELECT animals_id, COUNT(animals_id)
FROM visits 
GROUP BY animals_id
ORDER BY COUNT(animals_id) DESC;
-- Who was Maisy Smith's first visit?
SELECT   vets_id ,animals_id,MIN(visit_date)
FROM visits 
WHERE vets_id = 'Maisy Smith'
GROUP BY vets_id ,animals_id,visit_date
ORDER BY MIN(visit_date);
-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT   vets_id ,animals_id,MIN(visit_date)
FROM visits
GROUP BY vets_id,animals_id,visits.visit_date
ORDER BY visit_date DESC;
-- How many visits were with a vet that did not specialize in that animal's species?
SELECT visits.vets_id,COUNT(visits.animals_id)
FROM specializations
FULL JOIN visits
ON visits.vets_id = specializations.vets_id
WHERE specializations.species_id IS NULL
GROUP BY visits.vets_id;
-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT visits.vets_id,visits.animals_id,COUNT (visits.animals_id) ,animals.species_id
FROM specializations
FULL JOIN visits
ON visits.vets_id = specializations.vets_id
FULL JOIN animals
ON  visits.animals_id=animals.name
WHERE specializations.species_id IS NULL
GROUP BY visits.vets_id,visits.animals_id,animals.species_id
ORDER BY COUNT (visits.animals_id) DESC;