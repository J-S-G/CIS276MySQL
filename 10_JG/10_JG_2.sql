USE cf; 
DROP PROCEDURE IF EXISTS add_parts;
DELIMITER //
CREATE PROCEDURE add_parts
( 
IN part_id			INT,
IN parts_qty		INT
)
BEGIN
DECLARE serv_id INT;

DECLARE sql_error  TINYINT DEFAULT FALSE;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	SET sql_error = TRUE;
    
SELECT MAX(service_id) INTO serv_id
FROM service; 

START TRANSACTION;

INSERT INTO parts_service
VALUES(DEFAULT, part_id, serv_id, parts_qty);

IF sql_error = FALSE THEN 	
	COMMIT;
	SELECT 'Record was added!'; 
ELSE 
	ROLLBACK; 
	SELECT 'The part id you entered does not exist.';
    END IF;
END//