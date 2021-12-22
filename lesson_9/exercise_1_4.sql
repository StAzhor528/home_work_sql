USE exercise;

DROP TABLE IF EXISTS tbl;
CREATE TABLE tbl (
	id SERIAL,
	created_at DATE NULL
);

INSERT INTO tbl (created_at) 
VALUES (NULL), ('2018-08-02'), ('2018-08-05'), ('2018-08-06'), (NULL), ('2018-08-08'), ('2018-08-09'), 
('2018-08-14'), ('2018-08-15'), (NULL), ('2018-08-16'), (NULL), ('2018-08-17'), ('2018-08-18'), ('2018-08-19'), 
('2018-08-20'), ('2018-08-21'), ('2018-08-22'), ('2018-08-23'), (NULL), ('2018-08-24'), ('2018-08-25'), 
(NULL), (NULL), ('2018-08-28'), ('2018-08-29'), ('2018-08-30'), ('2018-08-31'), (NULL), (NULL), (NULL);

DELETE FROM tbl
WHERE id NOT IN (
  SELECT id
  FROM (
    SELECT id
    FROM tbl
    ORDER BY created_at DESC
    LIMIT 5 
  ) temp
);


