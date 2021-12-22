USE ap; 
DROP PROCEDURE IF EXISTS select_vendors
 DELIMITER //
CREATE PROCEDURE select_vendors 
( 
IN vend_state_param			VARCHAR(2)
)
BEGIN
DECLARE select_clause		VARCHAR(200);
DECLARE where_clause		VARCHAR(200);

SET select_clause = "SELECT vendor_name, vendor_city, vendor_state FROM vendors";
SET where_clause = "WHERE ";  

IF vend_state_param IS NOT NULL THEN 
SET where_clause = CONCAT(where_clause, "vendor_state = '", vend_state_param, "'");
END IF;
IF where_clause = "WHERE " THEN SET @dynamic_sql = select_clause;
ELSE
SET @dynamic_sql = CONCAT(select_clause, where_clause);
END IF;
PREPARE select_vendors_statement FROM @dynamic_sql;
EXECUTE select_vendors_statement; 
DEALLOCATE PREPARE select_vendors_statement; 
END//
