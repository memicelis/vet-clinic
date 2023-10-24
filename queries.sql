SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = true;

SELECT * FROM animals WHERE name <> 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;

UPDATE animals
SET species ='unspecified';

SELECT * FROM animals ;

ROLLBACK ;

BEGIN;

-- Update animals with names ending in "mon" to have species = 'digimon'
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

-- Update animals with no species set to have species = 'pokemon'
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

-- Verify the changes
SELECT * FROM animals;

COMMIT;

BEGIN;

DELETE FROM animals;

ROLLBACK; 

BEGIN;

DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

SAVEPOINT SAVEPOINT1;

UPDATE animals
SET weight_kg = weight_kg * -1;

ROLLBACK TO SAVEPOINT1;

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

COMMIT;

-- How many animals are there?

SELECT COUNT(*) AS total_animals
FROM animals;

-- How many animals have never tried to escape?

SELECT COUNT(*) AS non_escape_count
FROM animals
WHERE escape_attempts = 0;

-- What is the average weight of animals?

SELECT AVG(weight_kg) AS average_weight
FROM animals;

-- Who escapes the most, neutered or not neutered animals?

SELECT neutered, MAX(escape_attempts) AS max_escape_attempts
FROM animals
GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?

SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?

SELECT species, AVG(escape_attempts) AS average_escape_attempts
FROM animals
WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 1990 AND 2000
GROUP BY species;
