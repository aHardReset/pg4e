CREATE TABLE IF NOT EXISTS bigtext(
    content TEXT
);

INSERT INTO bigtext(content) SELECT 'This is record number ' || GENERATE_SERIES(100000, 199999) || ' of quite a few text records.';
