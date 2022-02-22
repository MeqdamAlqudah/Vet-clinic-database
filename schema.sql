CREATE DATABASE vet_clinic;
\c vet_clinic

CREATE TABLE animals(
    id INT GENERATED ALWAYS AS IDENTITY  PRIMARY KEY,
    name TEXT,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    species_id TEXT,
    owner_id TEXT,
    UNIQUE (name));

CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name TEXT,
    age INT,
    UNIQUE (full_name));

CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT,
    UNIQUE (name));

ALTER TABLE animals
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id) 
REFERENCES species (name);

ALTER TABLE animals
ADD CONSTRAINT fk_owners
FOREIGN KEY (owner_id) 
REFERENCES  owners(full_name);

-- Create a table named vets with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- name: string
-- age: integer
-- date_of_graduation: date
CREATE TABLE vets(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT,
    age INT ,
    date_of_graduation DATE,
    UNIQUE (name));
-- There is a many-to-many relationship between the tables species and vets: a vet can specialize in multiple species, and a species can have multiple vets specialized in it. Create a "join table" called specializations to handle this relationship.
CREATE TABLE specializations(
    vets_id TEXT NOT NULL,
    species_id TEXT NOT NULL,
    FOREIGN KEY (vets_id) REFERENCES vets (name),
	FOREIGN KEY (species_id) REFERENCES species (name),
	PRIMARY KEY (vets_id, species_id));
-- There is a many-to-many relationship between the tables animals and vets: an animal can visit multiple vets and one vet can be visited by multiple animals. Create a "join table" called visits to handle this relationship, it should also keep track of the date of the visit.
CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY,
  animal_id INT REFERENCES animals(id),
  vet_id INT REFERENCES vets(id),
  date_of_visit DATE,
  PRIMARY KEY(id)
);
-- CREATE TABLE visits(
--     vet_id TEXT NOT NULL,
--     animal_id TEXT NOT NULL,
--     date_of_visit DATE,
--     FOREIGN KEY (vet_id) REFERENCES vets (name) ON DELETE RESTRICT ON UPDATE CASCADE,
-- 	FOREIGN KEY (animal_id) REFERENCES animals (name) ON DELETE RESTRICT ON UPDATE CASCADE);
-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX visits_animal ON visits( animal_id DESC);
CREATE INDEX owners_email ON owners( email DESC);

