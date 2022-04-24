DROP DATABASE IF EXISTS  soccer_db;

CREATE DATABASE soccer_db;

\c soccer_db;


CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    team_name VARCHAR(15) NOT NULL,
    standing INTEGER UNIQUE
);

CREATE TABLE refs (
    id SERIAL PRIMARY KEY,
    ref_name TEXT NOT NULL
);

CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    match_date DATE,
    ref_id INTEGER REFERENCES refs ON DELETE CASCADE NOT NULL,
    home_id INTEGER REFERENCES teams ON DELETE CASCADE NOT NULL,
    home_score INTEGER,
    away_id INTEGER REFERENCES teams ON DELETE CASCADE NOT NULL,
    away_score INTEGER
);

CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    player_name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams ON DELETE CASCADE NOT NULL,
    goals_scored INTEGER,
    match_1 INTEGER REFERENCES matches ON DELETE CASCADE NOT NULL,
    match_1_goals INTEGER,
    mathc_2 INTEGER REFERENCES matches ON DELETE CASCADE NOT NULL,
    match_2_goals INTEGER
);