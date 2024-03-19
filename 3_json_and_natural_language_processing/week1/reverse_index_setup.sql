CREATE TABLE IF NOT EXISTS docs01 (id SERIAL, doc TEXT, PRIMARY KEY(id));

CREATE TABLE IF NOT EXISTS invert01 (
    doc_id INTEGER REFERENCES docs01(id) ON DELETE CASCADE,
    keyword TEXT
);

INSERT INTO docs01 (doc) VALUES
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

CREATE TABLE docs02 (id SERIAL, doc TEXT, PRIMARY KEY(id));

CREATE TABLE invert02 (
  doc_id INTEGER REFERENCES docs02(id) ON DELETE CASCADE,
  keyword TEXT
);


INSERT INTO docs02 (doc) VALUES
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

CREATE TABLE stop_words (word TEXT unique);

INSERT INTO stop_words (word) VALUES 
('i'), ('a'), ('about'), ('an'), ('are'), ('as'), ('at'), ('be'), 
('by'), ('com'), ('for'), ('from'), ('how'), ('in'), ('is'), ('it'), ('of'), 
('on'), ('or'), ('that'), ('the'), ('this'), ('to'), ('was'), ('what'), 
('when'), ('where'), ('who'), ('will'), ('with');
