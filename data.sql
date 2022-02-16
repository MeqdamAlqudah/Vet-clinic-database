CREATE DATABASE vet_clinic;
CREATE TABLE animals(
    id INT GENERATED ALWAYS AS IDENTITY,
    name TEXT,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES ('Agumon','2020-03-02',0,TRUE,10.23);

 INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES ('Gabumon','2018-11-15',2,TRUE,8);

 INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES ('Pikachu','2021-01-07,1',FALSE,15.04);

 INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES ('Devimon','2017-12-05',5,TRUE,11);