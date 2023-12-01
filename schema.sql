/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id serial PRIMARY KEY,
    name VARCHAR(50),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL(8,2),
    species VARCHAR(50)
    );

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(50),
    age INTEGER
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

ALTER TABLE animals
ADD COLUMN new_id SERIAL;

UPDATE animals
SET new_id = id;

ALTER TABLE animals DROP COLUMN id;

ALTER TABLE animals RENAME new_id TO id ;

-- Add the 'species_id' column as a foreign key referencing the 'species' table
ALTER TABLE animals
ADD COLUMN species_id INTEGER REFERENCES species(id);

-- Add the 'owner_id' column as a foreign key referencing the 'owners' table
ALTER TABLE animals
ADD COLUMN owner_id INTEGER REFERENCES owners(id);


