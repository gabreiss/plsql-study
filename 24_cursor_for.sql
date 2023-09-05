CREATE OR REPLACE PROCEDURE process_customer
(
    c_id IN customer.customer_id%type
    )
IS
BEGIN

FOR c_rec in (SELECT first_name, last_name FROM customer 
    WHERE customer_id = c_id)
LOOP
    dbms_output.put_line('First name: ' || c_rec.first)
    dbms_output.put_line('Last name: ' || c_rec.last_name)
END LOOP;

END;

execute process_customer(10)

 

     