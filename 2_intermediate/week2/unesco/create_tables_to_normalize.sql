CREATE TABLE IF NOT EXISTS category (
    id SERIAL,
    name VARCHAR(128),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS state (
    id SERIAL,
    name VARCHAR(128),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS region (
    id SERIAL,
    name VARCHAR(128),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS iso (
    id SERIAL,
    name VARCHAR(128),
    PRIMARY KEY(id)
);
