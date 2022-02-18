CREATE DATABASE vet_clinic;
CREATE TABLE animals(
    id INT GENERATED ALWAYS AS IDENTITY  PRIMARY KEY,
    name TEXT,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    species_id TEXT,
    owner_id TEXT);

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