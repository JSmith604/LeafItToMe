DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS species CASCADE;
DROP TABLE IF EXISTS plants CASCADE;
DROP TABLE IF EXISTS wishlist CASCADE;
DROP TABLE IF EXISTS tasks CASCADE;



CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  username VARCHAR(255),
  email VARCHAR(100)
  
);

CREATE TABLE species (
  id SERIAL PRIMARY KEY NOT NULL,
  common_name VARCHAR(255) NOT NULL,
  scientific_name VARCHAR(255) NOT NULL,
  photo_url VARCHAR(255),
  description TEXT,
  watering_instructions VARCHAR(255) NOT NULL,
  watering_requirement_rating INTEGER NOT NULL,
  sunlight_requirement_rating INTEGER NOT NULL,
  difficulty_rating INTEGER NOT NULL,
  temperature_requirements VARCHAR(100) NOT NULL,
  fertilizer_requirements VARCHAR(100) NOT NULL,
  poison_for_pets BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE wishlist (
   id SERIAL PRIMARY KEY NOT NULL,
   user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
   species_id INTEGER REFERENCES species(id) ON DELETE CASCADE
);


CREATE TABLE plants (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  species_id INTEGER REFERENCES species(id) ON DELETE SET NULL,
  nickname VARCHAR(100),
  is_dead BOOLEAN NOT NULL DEFAULT FALSE,
  cause_of_death TEXT
);

CREATE TABLE tasks (
  id SERIAL PRIMARY KEY NOT NULL,
  task TEXT,
  plant_id INTEGER REFERENCES plants(id) ON DELETE CASCADE,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  task_date DATE NOT NULL,
  task_complete BOOLEAN NOT NULL DEFAULT FALSE
);
