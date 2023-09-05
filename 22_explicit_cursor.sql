CREATE OR REPLACE PROCEDURE process_customer
(c_id IN customer.customer_id%type)
IS
    c_fname customer.first_name%ype;
    c_lname customer.last_name%ype;

    cursor c is SELECT first_name, last_name
    FROM customer
    WHERE customer_id = c_id; -- declaring the cursor

BEGIN

OPEN c; -- opening the cursor

    fetch c
        INTO c_fname, c_lname; -- fetching the data

    dbms_output.put_line('First name: ' || c_fname)
    dbms_output.put_line('Last name: ' || c_lname)

    close c; -- close the cursor

END process_procuredure;

 

     