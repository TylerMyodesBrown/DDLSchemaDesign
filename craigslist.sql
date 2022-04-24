DROP DATABASE IF EXISTS  craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db;



CREATE TABLE region(
    id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL
);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    cat_name TEXT NOT NULL
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) NOT NULL,
    region_id INTEGER REFERENCES region ON DELETE CASCADE
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    post_description TEXT NOT NULL,
    user_id INTEGER REFERENCES users ON DELETE CASCADE NOT NULL,
    cat_id INTEGER REFERENCES categories ON DELETE CASCADE NOT NULL,
    post_location TEXT,
    post_region INTEGER REFERENCES region ON DELETE CASCADE NOT NULL
);