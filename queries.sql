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
-- 4 Depening on your machine speed, it might be enough or not. Check that by running explain analyze SELECT COUNT(*) FROM visits where animal_id = 4: - If you get Execution time: X ms and X >= 1000: that should be enough, you can continue to the project requirements. - If you get Execution time: X ms and X < 1000: please go back to point 3. and repeat until you get a value bigger than 1000ms.
explain analyze SELECT COUNT(*) FROM visits where animal_id = 4;
--------------------
--  Finalize Aggregate  (cost=39520.08..39520.09 rows=1 width=8) (actual time=1200.390..1214.782 rows=1 loops=1)
--    ->  Gather  (cost=39519.87..39520.08 rows=2 width=8) (actual time=1200.149..1214.766 rows=3 loops=1)
--          Workers Planned: 2
--          Workers Launched: 2
--          ->  Partial Aggregate  (cost=38519.87..38519.88 rows=1 width=8) (actual time=1088.700..1088.701 rows=1 loops=3)               ->  Parallel Seq Scan on visits  (cost=0.00..38149.21 rows=148264 width=0) (actual time=0.851..1073.039 rows=119809 loops=3)
--                      Filter: (animal_id = 4)
--                      Rows Removed by Filter: 1078284
--  Planning Time: 11.942 ms
--  Execution Time: 1216.376 ms 😎👍
-- (10 rows)

explain analyze SELECT COUNT(*) FROM visits where animal_id = 4;
-- --------------------
--  Finalize Aggregate  (cost=39520.08..39520.09 rows=1 width=8) (actual time=2062.446..2110.918 rows=1 loops=1)
--    ->  Gather  (cost=39519.87..39520.08 rows=2 width=8) (actual time=2062.433..2110.908 rows=3 loops=1)
--          Workers Planned: 2
--          Workers Launched: 2
--          ->  Partial Aggregate  (cost=38519.87..38519.88 rows=1 width=8) (actual time=1846.373..1846.374 rows=1 loops=3)               ->  Parallel Seq Scan on visits  (cost=0.00..38149.21 rows=148264 width=0) (actual time=0.670..1823.927 rows=119809 loops=3)
--                      Filter: (animal_id = 4)
--                      Rows Removed by Filter: 1078284
--  Planning Time: 0.229 ms
--  Execution Time: 2111.173 ms
-- (10 rows)
-- after indexing 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  Finalize Aggregate  (cost=6730.70..6730.71 rows=1 width=8) (actual time=507.485..568.361 rows=1 loops=1)
--    ->  Gather  (cost=6730.49..6730.70 rows=2 width=8) (actual time=488.428..568.315 rows=3 loops=1)
--          Workers Planned: 2
--          Workers Launched: 2
--          ->  Partial Aggregate  (cost=5730.49..5730.50 rows=1 width=8) (actual time=160.937..160.949 rows=1 loops=3)
--                ->  Parallel Index Only Scan using visits_animal on visits  (cost=0.43..5359.83 rows=148264 width=0) (actual time=0.809..111.164 rows=119809 loops=3)
--                      Index Cond: (animal_id = 4)
--                      Heap Fetches: 0
--  Planning Time: 7.383 ms
--  Execution Time: 572.285 ms 😎👍
-- (10 rows)

explain analyze SELECT * FROM visits where vet_id = 2;
--  Seq Scan on visits  (cost=0.00..64357.50 rows=900727 width=16) (actual time=0.416..1143.809 rows=898570 loops=1)
--    Filter: (vet_id = 2)
--    Rows Removed by Filter: 2695710
--  Planning Time: 1.607 ms
--  Execution Time: 1190.923 ms
-- (5 rows)
-- affter
explain analyze SELECT * FROM visits where vet_id = 2
ORDER BY vet_id;
-- After ordering the items
--                                                    QUERY PLAN
-- -----------------------------------------------------------------------------------------------------------------
--  Seq Scan on visits  (cost=0.00..64357.50 rows=904560 width=16) (actual time=0.597..663.851 rows=898570 loops=1)
--    Filter: (vet_id = 2)
--    Rows Removed by Filter: 2695710
--  Planning Time: 0.151 ms
--  Execution Time: 703.389 ms 😎👍
-- (5 rows)
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';
--  Gather  (cost=1000.00..36372.96 rows=1 width=43) (actual time=15.161..1692.798 rows=1 loops=1)
--    Workers Planned: 2
--    Workers Launched: 2
--    ->  Parallel Seq Scan on owners  (cost=0.00..35372.86 rows=1 width=43) (actual time=908.252..1439.253 rows=0 loops=3)         Filter: ((email)::text = 'owner_18327@mail.com'::text)
--          Rows Removed by Filter: 833335
--  Planning Time: 2.014 ms
--  Execution Time: 1692.918 ms
-- (8 rows)
-- After:-
--                                                       QUERY PLAN
-- ----------------------------------------------------------------------------------------------------------------------
--  Index Scan using owners_email on owners  (cost=0.43..8.45 rows=1 width=43) (actual time=0.513..0.515 rows=1 loops=1)
--    Index Cond: ((email)::text = 'owner_18327@mail.com'::text)
--  Planning Time: 6.640 ms
--  Execution Time: 1.385 ms
-- (4 rows)

