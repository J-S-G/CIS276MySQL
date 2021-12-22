USE cf; 
DROP PROCEDURE IF EXISTS add_service;
DELIMITER //
CREATE PROCEDURE add_service
(
IN fleet_id			INT,
IN service_date		DATE,
IN service_desc		VARCHAR(100),
IN labor_hours		DECIMAL(9,2),
IN labor_cost		DECIMAL(9,2)
)
BEGIN
DECLARE sql_error  TINYINT DEFAULT FALSE;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	SET sql_error = TRUE;

START TRANSACTION;

INSERT INTO service
VALUES(DEFAULT, fleet_id, service_date,
 service_desc, labor_hours, labor_cost);

IF sql_error = FALSE THEN 	
	COMMIT;
	SELECT 'Record was added!'; 
ELSE 
	ROLLBACK; 
	SELECT 'The fleet id you entered does not exist.';
    END IF;
END//

