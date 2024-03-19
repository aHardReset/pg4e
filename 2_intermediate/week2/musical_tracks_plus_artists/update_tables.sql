UPDATE track SET album_id = (SELECT album.id FROM album WHERE album.title = track.album);
UPDATE tracktoartist SET track_id = (SELECT track.id FROM track WHERE tracktoartist.track = track.title);
UPDATE tracktoartist SET artist_id = (SELECT artist.id FROM artist WHERE tracktoartist.artist = artist.name);
