CREATE TABLE Item (
   id INT GENERATED ALWAYS AS IDENTITY,
   published_date DATE,
   archived BOOLEAN,
   author_id INT,
   PRIMARY KEY (id),
   FOREIGN KEY (author_id) REFERENCES Author(id)
);

CREATE TABLE Author (
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    items TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE Game (
  id INT GENERATED ALWAYS AS IDENTITY,
  published_date DATE,
  archived BOOLEAN,
  author_id INT,
  multiplayer BOOLEAN,
  last_played_at DATE,
  game_id INT PRIMARY KEY REFERENCES Item(id)
);
