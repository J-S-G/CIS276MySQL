/* Objective: Use 2 tables and summarize data on 3 columns and utilize at least 1 group by column & utilize 1 group by column 
   Description: I created a script that shows the total number of bikes in the inventory
   The sum of orders sold and within the orders sold in which those bikes = $100.00 and $10,000.00 */
USE fp;
SELECT MAX(bike_inventory.bike_id) AS 'Bikes in inventory', Max(orders.order_id) AS 'Sum of orders', MIN(bike_inventory.bike_cost) = 100.00 AS 'Sold bikes ($100.00)', 
MAX(bike_inventory.bike_cost) = 10000 AS 'Sold bikes ($1000.00)', ROUND(AVG(bike_inventory.bike_cost),2) AS 'Average cost of bikes'   
FROM bike_inventory  INNER JOIN orders 
ON bike_inventory.bike_id = orders.bike_id 
GROUP BY bike_inventory.bike_id AND bike_inventory.bike_cost
HAVING  MAX(bike_inventory.bike_id) = 121 AND MIN(bike_inventory.bike_cost) = 100



