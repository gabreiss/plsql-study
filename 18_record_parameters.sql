CREATE OR REPLACE PROCEDURE process_customer
(c_id IN customer.customer_id%type)
AS
    c_rec customer%rowtype;
BEGIN
    SELECT *
    INTO c_rec
    FROM customer
    WHERE customer_id = c_id;
    show_customer(c_rec)
END process_procuredure;

CREATE OR REPLACE PROCEDURE show_customer
(customer_in customer%rowtype)
AS 
BEGIN
    dbms_output.put_line('First name: ' || customer_in.first_name)
    dbms_output.put_line('Last name: ' || customer_in.last_name)
END;

 

