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

ALTER TABLE animals
ADD PRIMARY KEY (id);

-- Add the 'species_id' column as a foreign key referencing the 'species' table
ALTER TABLE animals
ADD COLUMN species_id INTEGER REFERENCES species(id);

-- Add the 'owner_id' column as a foreign key referencing the 'owners' table
ALTER TABLE animals
ADD COLUMN owner_id INTEGER REFERENCES owners(id);

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INTEGER,
    date_of_graduation DATE
);

CREATE TABLE specializations (
    vet_id INTEGER,
    species_id INTEGER,
    PRIMARY KEY (vet_id, species_id),
    FOREIGN KEY (vet_id) REFERENCES vets(id),
    FOREIGN KEY (species_id) REFERENCES species(id)
);

CREATE TABLE visits (
    animal_id INTEGER REFERENCES animals(id),
    vet_id INTEGER REFERENCES vets(id),
    visit_date DATE NOT NULL
);