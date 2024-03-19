-- take docs03 from gin_ts_vector_index.sql

CREATE INDEX fulltext03 ON docs03 USING gin(
    to_tsvector('english', doc)
);
