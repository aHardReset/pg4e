CREATE TABLE docs03_a (
    id SERIAL,
    doc TEXT,
    PRIMARY KEY(id)
);

INSERT INTO docs03_a (doc) VALUES
('If you were to open an executable file in a text editor it would look'),
('completely crazy and be unreadable'),
('It is not easy to read or write machine language so it is nice that we'),
('have interpreters and compilers that'),
('allow us to write in highlevel languages like Python or C'),
('Now at this point in our discussion of compilers and interpreters you'),
('should be wondering a bit about the Python interpreter itself What'),
('language is it written in Is it written in a compiled language When we'),
('type python what exactly is happening'),
('The Python interpreter is written in a highlevel language called C');

INSERT INTO docs03_a (doc) SELECT 'Neon ' || generate_series(10000,20000);

CREATE INDEX array03_a ON docs03_a USING gin(
    string_to_array(lower(doc), ' ') array_ops
);


/*
It might take from a few seconds to a minute or two before PostgreSQL catches up with its indexing. The autograder won't work if the index is incomplete. If the EXPLAIN command says that it is using Seq Scan - the index has not completed yet. Run the above EXPLAIN multiple times if necessary until you verify that PostgreSQL has finished making the index

pg4e=> EXPLAIN SELECT id, doc FROM docs03 WHERE '{interpreters}' <@ string_to_array(lower(doc), ' ');
                                   QUERY PLAN
--------------------------------------------------------------------------------
 Seq Scan on docs03  (cost=0.00..177.24 rows=35 width=36)
 Filter: ('{interpreters}'::text[] <@ string_to_array(lower(doc), ' '::text))
(2 rows)


TIME PASSES......


pg4e=> EXPLAIN SELECT id, doc FROM docs03 WHERE '{interpreters}' <@ string_to_array(lower(doc), ' ');
                                        QUERY PLAN
------------------------------------------------------------------------------------------
 Bitmap Heap Scan on docs03  (cost=12.02..21.97 rows=3 width=15)
 Recheck Cond: ('{interpreters}'::text[] <@ string_to_array(lower(doc), ' '::text))
   ->  Bitmap Index Scan on array03  (cost=0.00..12.02 rows=3 width=0)
   Index Cond: ('{interpreters}'::text[] <@ string_to_array(lower(doc), ' '::text))
(4 rows)

pg4e=>

*/
