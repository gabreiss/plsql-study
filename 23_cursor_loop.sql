CREATE OR REPLACE PROCEDURE process_customer
(
    c_id IN customer.customer_id%type
    )
IS
    cursor c is SELECT first_name, last_name
    FROM customer   
    WHERE customer_id = c_id; -- declaring the cursor

    c_rec c%rowtype;

BEGIN

OPEN c; -- opening the cursor

LOOP
    fetch c
        INTO c_rec; -- fetching the data

    EXIT WHEN c%NOTFOUND;
    dbms_output.put_line('First name: ' || c_rec.first)
    dbms_output.put_line('Last name: ' || c_rec.last_name)
END LOOP;

    close c; -- close the cursor

END;

execute process_customer(10)

 

     