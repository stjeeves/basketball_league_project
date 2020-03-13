DROP TABLE IF EXISTS results;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS matches;

CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  wins INT,
  losses INT

);

CREATE TABLE matches (
  id SERIAL PRIMARY KEY,
  home_team VARCHAR(255),
  away_team VARCHAR(255)
);

CREATE TABLE results (
  id SERIAL PRIMARY KEY,
  team_id INT REFERENCES teams(id),
  match_id INT REFERENCES matches(id)
);
