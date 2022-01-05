CREATE TABLE Label (
  id INT GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(50),
  color VARCHAR(50),
  items TEXT,
  PRIMARY KEY(id)
);

CREATE TABLE Author (
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  items TEXT,
  PRIMARY KEY(id)
);

CREATE TABLE Genre (
 id INT GENERATED ALWAYS AS IDENTITY,
  name TEXT,
  items TEXT,
  PRIMARY KEY (id)
);


CREATE TABLE Source (
  id INT GENERATED ALWAYS AS IDENTITY,
  name TEXT,
  items TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE Book (
  id INT GENERATED ALWAYS AS IDENTITY,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN,
  PRIMARY KEY (id),
  FOREIGN KEY (label_id) REFERENCES Label(id),
  FOREIGN KEY (author_id) REFERENCES Author(id),
  FOREIGN KEY (source_id) REFERENCES Source(id), 
  FOREIGN KEY (genre_id) REFERENCES Genre(id)    
);

CREATE TABLE Game (
  id INT GENERATED ALWAYS AS IDENTITY,
  published_date DATE,
  archived BOOLEAN,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  multiplayer BOOLEAN,
  last_played_at DATE,
  PRIMARY KEY (id),
  FOREIGN KEY (label_id) REFERENCES Label(id),
  FOREIGN KEY (source_id) REFERENCES Source(id),
  FOREIGN KEY (author_id) REFERENCES Author(id), 
  FOREIGN KEY (genre_id) REFERENCES Genre(id) 
);

CREATE TABLE MusicAlbum (
  id INT GENERATED ALWAYS AS IDENTITY,
  published_date DATE,
  archived BOOLEAN,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  on_spotify BOOLEAN,
  PRIMARY KEY (id),
  FOREIGN KEY (label_id) REFERENCES Label(id),
  FOREIGN KEY (source_id) REFERENCES Source(id),
  FOREIGN KEY (author_id) REFERENCES Author(id), 
  FOREIGN KEY (genre_id) REFERENCES Genre(id) 
);


