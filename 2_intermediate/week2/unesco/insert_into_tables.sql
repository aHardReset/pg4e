INSERT INTO category(name) SELECT DISTINCT category FROM unesco_raw ORDER BY category;
INSERT INTO iso(name) SELECT DISTINCT iso FROM unesco_raw ORDER BY iso;
INSERT INTO state(name) SELECT DISTINCT state FROM unesco_raw ORDER BY state;
INSERT INTO region(name) SELECT DISTINCT region FROM unesco_raw ORDER BY region;
