ALTER TABLE pg4e_debug ADD COLUMN neon355 REAL;

04:50 ~/assigments/week1 $ cat select_from_readonly.sql 
SELECT DISTINCT state FROM taxdata ORDER BY state LIMIT 5;
04:51 ~/assigments/week1 $ cat setup.sql 
CREATE TABLE pg4e_debug (
  id SERIAL,
  query VARCHAR(4096),
  result VARCHAR(4096),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id)
);

CREATE TABLE pg4e_result (
  id SERIAL,
  link_id INTEGER UNIQUE,
  score FLOAT,
  title VARCHAR(4096),
  note VARCHAR(4096),
  debug_log VARCHAR(8192),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP
);
