 /* - Objective: Use 2 tables, 1 or 2 input parameters & 1 return value *include a decision making structure 
    - Description: this script creates a procedure that will show orders that are either completed or unfinished.
    - Uncompleted orders either need to be shipped or refunded. */ 
USE fp; 
DROP PROCEDURE IF EXISTS fix_orders;
DELIMITER // 
CREATE PROCEDURE fix_orders()
BEGIN 
 
 SELECT COUNT(order_completed) AS 'Completed orders' , order_id AS 'Lost orders'
		FROM bike_inventory b JOIN orders o
		ON b.bike_id = o.bike_id; 
        
		IF 'Completed orders' != NULL THEN SELECT 'You have orders.' AS Message;
        ELSE SELECT 'You have no orders' AS Message; 
        END IF;
        IF 'Lost orders' = 0 THEN SELECT 'You have shipments that need to be fixed!' AS Warning; 
        ELSE SELECT 'No shipping errors' AS Warning;
	END IF; 
    
END// 

USE fp;
Call fix_orders();
