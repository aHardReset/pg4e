UPDATE track_raw SET album_id = (SELECT album.id FROM album WHERE track_raw.album = album.title);
