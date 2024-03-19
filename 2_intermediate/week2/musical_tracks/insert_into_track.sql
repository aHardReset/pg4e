INSERT INTO track(title, len, rating, count, album_id) SELECT title, len, rating, count, album_id FROM track_raw;
