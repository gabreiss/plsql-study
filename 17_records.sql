CREATE OR REPLACE PROCEDURE process_procuredure
(c_id IN customer.customer_id%type)
AS
    c_rec customer%rowtype;
BEGIN
    SELECT *
    INTO c_rec
    FROM customer
    WHERE customer_id = c_id;

    dbms_output.put_line('First name: ' || c_rec.first_name)
    dbms_output.put_line('Last name: ' || c_rec.last_name)
END process_procuredure;

EXECUTE process_procuredure(14);


