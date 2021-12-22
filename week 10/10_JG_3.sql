/*USE ap; 
CREATE TABLE invoice2 
SELECT * FROM invoices;*/

USE ap;
DROP PROCEDURE IF EXISTS cred_update;
DELIMITER //
CREATE PROCEDURE cred_update()
BEGIN 
DECLARE c_update DECIMAL (9,2);

SELECT AVG(credit_total) INTO c_update FROM invoice2; 

WHILE c_update < 100.00 DO
UPDATE invoice2 
SET credit_total = credit_total + 0.75;

SELECT AVG(credit_total) INTO c_update FROM invoice2; 

END WHILE;
END//