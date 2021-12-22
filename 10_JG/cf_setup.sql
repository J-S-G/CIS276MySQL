CREATE DATABASE IF NOT EXISTS cf;

USE cf;

CREATE TABLE fleet
(
fleet_id			INT			AUTO_INCREMENT,
fleet_make			VARCHAR(15)	NOT NULL,
fleet_model			VARCHAR(50)	NOT NULL,
fleet_year			INT			NOT NULL,
purchase_date		DATE		NOT NULL,
CONSTRAINT		fleet_pk	PRIMARY KEY (fleet_id)
);

CREATE TABLE parts
(
part_id				INT			AUTO_INCREMENT,
part_name			VARCHAR(50)	NOT NULL,
part_cost			DECIMAL(9,2) NOT NULL,
part_inventory		INT			NOT NULL,
CONSTRAINT		parts_pk	PRIMARY KEY (part_id)
);

CREATE TABLE service
(
service_id			INT			AUTO_INCREMENT,
fleet_id			INT			NOT NULL,
service_date		DATE 		NOT NULL,
service_desc		VARCHAR(100) NOT NULL,
labor_hours			INT NOT NULL,
CONSTRAINT		service_pk	PRIMARY KEY	(service_id),
CONSTRAINT		service_fk_fleet
	FOREIGN KEY (fleet_id) REFERENCES fleet(fleet_id)
);

CREATE TABLE parts_service
(
parts_service_id	INT			AUTO_INCREMENT,
part_id				INT			NOT NULL,
service_id			INT			NOT NULL,
CONSTRAINT		parts_service_pk  PRIMARY KEY (parts_service_id),
CONSTRAINT		ps_fk_parts
	FOREIGN KEY (part_id) REFERENCES parts(part_id),
CONSTRAINT		ps_fk_service
	FOREIGN KEY (service_id) REFERENCES service(service_id)
);

CREATE INDEX parts_part_name_ix
	ON parts(part_name);

CREATE INDEX  service_service_date_ix
	ON service(service_date);
    
ALTER TABLE fleet
ADD purchase_price DECIMAL(9,2) NOT NULL;

ALTER TABLE service
ADD labor_cost DECIMAL(9,2) NOT NULL;

ALTER TABLE parts_service
ADD parts_qty INT;

ALTER TABLE service
MODIFY labor_hours DECIMAL(5,2);

ALTER TABLE service
DROP FOREIGN KEY service_fk_fleet;

ALTER TABLE service
ADD CONSTRAINT serv_fk_fleet
FOREIGN KEY (fleet_id) REFERENCES fleet(fleet_id);

INSERT INTO fleet
VALUES
(DEFAULT, 'Chevy', 'Silverado', 2010, '2010-02-13', 18750.00),
(DEFAULT, 'Chevy', 'Silverado', 2011, '2011-04-10', 20150.00),
(DEFAULT, 'Ford', 'F150', 2013, '2013-05-04', 22399.00),
(DEFAULT, 'Dodge', 'Ram', 2009, '2014-05-22', 17750.00),
(DEFAULT, 'Chevy', 'Silverado', 2012, '2014-09-03', 17000.00),
(DEFAULT, 'Ford', 'F250', 2014, '2014-12-21', 22750.00),
(DEFAULT, 'Chevy', '2500', 2013, '2015-02-21', 31875.00);

INSERT INTO parts
VALUES
(DEFAULT, 'FT Spk Plug', 18.71, 48),
(DEFAULT, 'CT Spk Plug', 12.25, 120),
(DEFAULT, 'DT Spk Plug', 14.79, 56),
(DEFAULT, 'FT Glow Plug', 21.56, 24),
(DEFAULT, 'FT Air Filter', 24.76, 6),
(DEFAULT, 'CT Air Filter', 17.36, 10),
(DEFAULT, 'DT Air Filter', 22.35, 6),
(DEFAULT, 'FT D Air Filter', 28.45, 3),
(DEFAULT, 'FT Plug Wires', 89.56, 4),
(DEFAULT, 'CT Plug Wires', 76.33, 6),
(DEFAULT, 'DT Plug Wires', 103.45, 4),
(DEFAULT, 'Penz 5-30', 1.69, 200),
(DEFAULT, 'Penz 10-30', 1.79, 200),
(DEFAULT, 'Penz 5-20', 1.65, 200),
(DEFAULT, 'DEO 15-40', 17.84, 48),
(DEFAULT, 'FT Oil Filter', 5.68, 12),
(DEFAULT, 'CT Oil Filter', 6.19, 12),
(DEFAULT, 'DT Oil Filter', 8.49, 12),
(DEFAULT, 'DF Filter', 18.22, 12),
(DEFAULT, 'FT Wiper Blades', 11.44, 12),
(DEFAULT, 'CT Wiper Blades', 13.19, 12),
(DEFAULT, 'DT Wiper Blades', 10.56, 12),
(DEFAULT, 'FTD Wiper Blades', 13.22, 12);

INSERT INTO service
VALUES
(DEFAULT, 1, '2016-02-01', 'Oil change', 1.50, 27.00),
(DEFAULT, 3, '2016-02-22', 'Tune up', 8.25, 34.00),
(DEFAULT, 2, '2016-03-06', 'Tune up', 6.50, 34.00),
(DEFAULT, 5, '2016-03-15', 'Oil change', 1.25, 27.00),
(DEFAULT, 4, '2016-04-01', 'Tune up and oil change', 10.70, 31.50),
(DEFAULT, 1, '2016-04-12', 'Change wiper blades', 0.10, 27.00),
(DEFAULT, 6, '2016-04-28', 'Oil change', 2.25, 27.00),
(DEFAULT, 7, '2016-05-15', 'Tune up', 6.50, 34.00),
(DEFAULT, 1, '2016-06-20', 'Tune up', 7.00, 34.00),
(DEFAULT, 2, '2016-06-24', 'Oil change', 1.00, 27.00);

INSERT INTO parts_service
VALUES
(DEFAULT, 13, 1, 6),
(DEFAULT, 17, 1, 1),
(DEFAULT, 1, 2, 8),
(DEFAULT, 5, 2, 1),
(DEFAULT, 2, 3, 8),
(DEFAULT, 10, 3, 1),
(DEFAULT, 6, 3, 1),
(DEFAULT, 13, 4, 6),
(DEFAULT, 17, 4, 1),
(DEFAULT, 6, 4, 1),
(DEFAULT, 14, 5, 6),
(DEFAULT, 18, 5, 1),
(DEFAULT, 13, 1, 6),
(DEFAULT, 3, 5, 8),
(DEFAULT, 7, 5, 1),
(DEFAULT, 11, 5, 1),
(DEFAULT, 21, 6, 1),
(DEFAULT, 15, 7, 2),
(DEFAULT, 19, 7, 1),
(DEFAULT, 2, 8, 8),
(DEFAULT, 10, 8, 1),
(DEFAULT, 2, 9, 1),
(DEFAULT, 10, 9, 1),
(DEFAULT, 13, 10, 6),
(DEFAULT, 17, 10, 1);
    
    