CREATE TABLE Genre (
    id SERIAL,
    name TEXT,
    items TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE Music_alboum (
  id SERIAL,
  published_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  Music_alboum_id INT PRIMARY KEY REFERENCES Item(id)
);