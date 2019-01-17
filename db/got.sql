DROP TABLE characters;
DROP TABLE teams;

CREATE TABLE teams (
  id serial4 primary key,
  team_name varchar(255),
  owner varchar(255)
);

CREATE TABLE characters (
  id serial4 primary key,
  name varchar(255),
  bio varchar(511),
  pic_url varchar(255),
  score INT2,
  team_id INT4 REFERENCES teams(id)
);
