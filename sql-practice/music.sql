.open practice.db
-- This ensures that SQLite enforces FOREIGN KEY constraints
PRAGMA foreign_keys = 1;
DROP TABLE IF EXISTS instruments;
DROP TABLE IF EXISTS musicians;
DROP TABLE IF EXISTS bands;
DROP TABLE IF EXISTS musician_instrument;

CREATE TABLE bands (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(100)
);
CREATE TABLE musicians (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100),
  band_id INTEGER NOT NULL, 
  FOREIGN KEY (band_id) REFERENCES bands(id)
);
CREATE TABLE instruments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  type VARCHAR(100) NOT NULL
);
.print Step 1: One-to-Many
INSERT INTO instruments
  VALUES (1, 'Tabla')
;
INSERT INTO bands 
  VALUES (1, 'SuperTestBand')
;

INSERT INTO musicians (first_name, band_id )
  VALUES ('Joe', 1)
;
SELECT * FROM bands;
SELECT * FROM musicians;

.print Step 2: Many-to-Many
CREATE TABLE musician_instrument (
  mus_id INTEGER NOT NULL,
  instr_id INTEGER NOT NULL,
  FOREIGN KEY (mus_id) REFERENCES musicians(id),
  FOREIGN KEY (instr_id) REFERENCES instruments(id)
);
INSERT INTO musician_instrument 
  VALUES (1, 1)
;
SELECT * FROM musician_instrument;
