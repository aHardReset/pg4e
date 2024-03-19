INSERT INTO invert01(doc_id, keyword) 
    SELECT DISTINCT id, s.keyword AS keyword
    FROM docs01 AS D, unnest(string_to_array(lower(D.doc), ' ')) s(keyword)
ORDER BY id;
