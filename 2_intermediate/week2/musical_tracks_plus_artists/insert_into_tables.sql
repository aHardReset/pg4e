INSERT INTO album (title) SELECT DISTINCT album FROM track;
INSERT INTO tracktoartist (track, artist) SELECT DISTINCT title, artist FROM track;
INSERT INTO artist (name) SELECT DISTINCT artist FROM track;
