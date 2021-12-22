/* Objective: Use 3 tables that incorporate a concatentation function and incudes a subquery 
   Description: My CONCAT function = customers name (first + last) and whether they are an active member (Yes/No). */
USE fp; 
SELECT DISTINCT CONCAT(customer_fn, ' ', customer_ln,' ', IF(customer_active = 1, '(active)', '(not active)')) AS 'Customer (subscribed)',
order_last_update AS 'Purchase Date', company_name AS 'bike_manufactored', order_id AS 'Package Number'
FROM customers c JOIN orders o ON
c.customer_id = o.customer_id 
JOIN companies co ON co.company_id = o.company_id 
WHERE order_id IN (SELECT order_id FROM orders WHERE order_id IS NOT NULL)
ORDER BY order_id
 