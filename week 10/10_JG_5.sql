USE ap; 
DROP FUNCTION IF EXISTS get_invoice_total;
DELIMITER //
CREATE FUNCTION get_invoice_total
(
	vendor_id_input 	INT
)
RETURNS DEC(9,2)
BEGIN
DECLARE bal_due DEC(9,2);

SELECT SUM(invoice_total-payment_total-credit_total)
INTO bal_due
FROM invoices
WHERE vendor_id = vendor_id_input;

RETURN(bal_due);
END//