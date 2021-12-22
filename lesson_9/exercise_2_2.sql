DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts(
	id SERIAL, 
	name VARCHAR(255), 
	password_hash VARCHAR(100)
);

CREATE OR REPLACE VIEW username 
AS SELECT id, name 
FROM accounts;

GRANT SELECT ON username.* TO user_read;
REVOKE ALL ON accounts.* FROM user_read;