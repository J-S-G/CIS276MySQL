/*Use 1 input variable and returns a scaler value
  Description: this script takes the column input of bike price in the functions parameters and returns that bikes price point */
DROP FUNCTION IF EXISTS bike_price;

USE fp;
DELIMITER //
CREATE FUNCTION bike_price
(
	price_range INT
)
RETURNS VARCHAR(30) DETERMINISTIC

BEGIN
DECLARE price_range VARCHAR(30);

IF price_range <= 10000 THEN SET price_range = 'Expensive bike options';
ELSE SET price_range = 'Fair priced bikes';
END IF; 
RETURN(price_range);
END//

/*Fix this bug, the parameters return only the else in the loop*/
USE fp;
SELECT bike_price(1000) AS 'Your bicycle is in the';



