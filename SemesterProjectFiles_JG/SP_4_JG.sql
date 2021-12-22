/* Objective: Use 2 Tables & 2 Where conditions */ 
/* Description: My script shows the number of orders not completed for each company (1 = true | 0 = false)
 = Returns 1 order incomplete.. Now we can fix this mistake! */
USE fp; 
CREATE VIEW fix_orders AS
SELECT (company_name) AS 'Company Name', IF(order_completed = 0, 'Yes', 'No')  AS 'Missing Package', order_id, 
 order_placed, company_phone, customer_id
FROM companies c JOIN  orders o ON
c.company_id = o.company_id
 WHERE order_completed = 0 AND 
 order_id IS NOT NULL  


