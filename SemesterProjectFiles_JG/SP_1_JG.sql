/*Objective: Create a database with tables that have foreign keys and primary keys */
CREATE DATABASE IF NOT EXISTS fp; 
USE fp; 
CREATE TABLE bike_inventory
(
bike_id 				INT				AUTO_INCREMENT,
bike_make				VARCHAR(50)		NOT NULL,
bike_model				VARCHAR(50)		NOT NULL,
bike_size				VARCHAR(50)		NOT NULL,
bike_year				DATE			NOT NULL,
bike_cost				DECIMAL(9,2)	NOT NULL,
CONSTRAINT				bike_invenory_pk		PRIMARY KEY (bike_id)
);

CREATE TABLE customers
(
customer_id					INT				AUTO_INCREMENT,
customer_fn					VARCHAR(50)		NOT NULL,
customer_ln					VARCHAR(50)		NOT NULL,
customer_address 			VARCHAR(50)		NOT NULL,
customer_state	 			VARCHAR(50)		NOT NULL,
customer_active 			TINYINT(1)		NOT NULL,
customer_create_date		DATE			NOT NULL,
customer_last_update 		DATE			NOT NULL,
CONSTRAINT 			customers_pk		PRIMARY KEY (customer_id)

);

CREATE TABLE companies
(
company_id				INT				NOT NULL	AUTO_INCREMENT,
company_name			VARCHAR(50)		NOT NULL,
company_phone			VARCHAR(15)		NOT NULL,
company_address			VARCHAR(50)		NOT NULL,
company_state 			VARCHAR(25)		NOT NULL,
company_last_update		DATE			NOT NULL,
CONSTRAINT 			companies_pk			PRIMARY KEY (company_id)
);

CREATE TABLE orders 
(
order_id				INT					AUTO_INCREMENT,
company_id				INT					NOT NULL,
customer_id				INT					NOT NULL,
bike_id					INT					NOT NULL,
order_placed			DATE				NOT NULL,
order_completed         INT					NOT NULL,
order_last_update		DATE				NOT NULL,
order_lost				INT 			NOT NULL,
CONSTRAINT 			orders_pk			PRIMARY KEY (order_id),
CONSTRAINT 			orders_fk_companies
FOREIGN KEY (company_id) REFERENCES companies (company_id),
CONSTRAINT 			orders_fk_customers
FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
CONSTRAINT 			orders_fk_bi
FOREIGN KEY (bike_id) REFERENCES bike_inventory (bike_id)
);

/*This table is triggered whenever a order is added in the orders table*/
DROP Table IF EXISTS orders_audit;
USE fp;
CREATE TABLE orders_audit
(
order_id INT NOT NULL,
customer_id INT NOT NULL,
bike_id INT NOT NULL,
action_type VARCHAR(50) NOT NULL,
action_date date NOT NULL
)

