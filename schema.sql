CREATE DATABASE vet_clinic;
CREATE TABLE animals(
    id INT GENERATED ALWAYS AS IDENTITY,
    name TEXT,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);
