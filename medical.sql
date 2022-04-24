DROP DATABASE IF EXISTS  medical_db;

CREATE DATABASE medical_db;

\c medical_db;


CREATE TABLE doctors(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE disease(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE patients(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    primary_doc INTEGER REFERENCES doctors,
    secondary_doc INTEGER REFERENCES doctors ON DELETE SET NULL,
    primary_disease INTEGER REFERENCES disease ON DELETE SET NULL,
    secondary_disease INTEGER REFERENCES disease ON DELETE SET NULL,
    tertiary_disease INTEGER REFERENCES disease ON DELETE SET NULL
);
