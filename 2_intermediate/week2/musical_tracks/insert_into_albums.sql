INSERT INTO album(title) SELECT DISTINCT album FROM track_raw ORDER BY album;
