CREATE TABLE Book (
  id INT GENERATED ALWAYS AS IDENTITY,
  genre VARCHAR(50),
  author VARCHAR(50),
  source VARCHAR(50),
  label_id INT,
  publish_date DATE,
  archived BOOLEAN,
  PRIMARY KEY (id),
  FOREIGN KEY (label_id) REFERENCES Label(id)  
);

CREATE TABLE Label (
  id INT GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(50),
  color VARCHAR(50),
  items TEXT,
  PRIMARY KEY(id)
);