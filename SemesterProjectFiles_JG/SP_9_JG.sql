 /* Objective: Update/Insert Trigger that formats data on a field 
   Description: This trigger takes the values that are inserted into the orders_copy table and returns it in the orders_audit table.
   The orders audit table shows the primary and foreign key fields in the table that have been updated along with the date they were updated.*/
   
DROP TRIGGER IF EXISTS new_customer; 
USE fp; 
DELIMITER //
CREATE TRIGGER new_customer
	AFTER INSERT ON orders
    FOR EACH ROW 
    BEGIN 
		INSERT INTO orders_audit
		VALUES( NEW.order_id, NEW.customer_id, NEW.bike_id, 'Table Update', NOW());
    END//
    
    /*Disable - Before
    Temporarily disabling referential constraints*/
    SET FOREIGN_KEY_CHECKS = 0;
    
    /*Enable - After adding the records into the orders*/
    SET FOREIGN_KEY_CHECKS = 1;

    USE fp; 
    INSERT INTO orders
    VALUES 
    (25, 12, 25, 121, NOW(), 1, NOW(), 0),
    (26, 8, 26, 79, NOW(), 1, NOW(), 0),
    (27, 11, 27, 104, NOW(), 1, NOW(), 0);
    
    /*USE fp;
    DELETE FROM orders WHERE order_id = 50;*/ 
    
    USE fp; 
    SELECT * FROM orders;
    SELECT * FROM orders_audit; 


