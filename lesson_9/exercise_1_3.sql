USE exercise;

DROP TABLE IF EXISTS days;
CREATE TABLE days (
	id SERIAL,
	augusts_days DATE
);

DROP TABLE IF EXISTS tbl;
CREATE TABLE tbl (
	id SERIAL,
	created_at DATE NULL
);


INSERT INTO days (augusts_days) 
VALUES ('2018-08-01'), ('2018-08-02'), ('2018-08-03'), ('2018-08-04'), 
('2018-08-05'), ('2018-08-06'), ('2018-08-07'), ('2018-08-08'), ('2018-08-09'), 
('2018-08-10'), ('2018-08-11'), ('2018-08-12'), ('2018-08-13'), ('2018-08-14'), 
('2018-08-15'), ('2018-08-16'), ('2018-08-17'), ('2018-08-18'), ('2018-08-19'), 
('2018-08-20'), ('2018-08-21'), ('2018-08-22'), ('2018-08-23'), ('2018-08-24'), 
('2018-08-25'), ('2018-08-26'), ('2018-08-27'), ('2018-08-28'), ('2018-08-29'), 
('2018-08-30'), ('2018-08-31');

INSERT INTO tbl (created_at) 
VALUES (NULL), ('2018-08-02'), ('2018-08-05'), ('2018-08-06'), (NULL), ('2018-08-08'), ('2018-08-09'), 
('2018-08-14'), ('2018-08-15'), (NULL), ('2018-08-16'), (NULL), ('2018-08-17'), ('2018-08-18'), ('2018-08-19'), 
('2018-08-20'), ('2018-08-21'), ('2018-08-22'), ('2018-08-23'), (NULL), ('2018-08-24'), ('2018-08-25'), 
(NULL), (NULL), ('2018-08-28'), ('2018-08-29'), ('2018-08-30'), ('2018-08-31'), (NULL), (NULL), (NULL);


DROP VIEW days_true;
CREATE OR REPLACE VIEW days_true 
AS SELECT id, IF (tbl.created_at IN (SELECT augusts_days FROM days), 1, 0) AS true_tbl
FROM tbl;

SELECT augusts_days, true_tbl FROM days JOIN days_true ON days.id = days_true.id;