DROP DATABASE IF EXISTS exercise;

CREATE DATABASE exercise;

USE exercise;

DROP TABLE IF EXISTS tbl;
CREATE TABLE tbl (
num INT
);

INSERT INTO tbl 
VALUES (1), (2), (3), (4), (5);

SELECT EXP(SUM(LOG(num))) AS `result` FROM tbl;