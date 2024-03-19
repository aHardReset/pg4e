CREATE TABLE IF NOT EXISTS unesco(
    id SERIAL,
    name TEXT,
    description TEXT,
    justification TEXT,
    year INTEGER,
    longitude FLOAT,
    latitude FLOAT,
    area_hectares FLOAT,
    category_id INTEGER REFERENCES category(id) ON DELETE CASCADE,
    state_id INTEGER REFERENCES state(id) ON DELETE CASCADE,
    region_id INTEGER REFERENCES region(id) ON DELETE CASCADE,
    iso_id INTEGER REFERENCES iso(id) ON DELETE CASCADE
);

INSERT INTO unesco(name, description, justification, year, longitude, latitude,
    area_hectares, category_id, state_id, region_id, iso_id)
SELECT name, description, justification, year, longitude, latitude,
    area_hectares, category_id, state_id, region_id, iso_id FROM unesco_raw;
    