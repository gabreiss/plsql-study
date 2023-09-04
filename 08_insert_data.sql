DECLARE 
    c_id        customer.customer_id%type := 13;
    c_fname     customer.first_name%type := 'JEFF';
    c_lname     customer.last_name%tpe := 'ALONSO';

BEGIN
    INSERT INTO CUSTOMER(customer_id, first_name, last_name)
    VALUES (c_id, c_fname, c_lname);

    COMMIT;

    dbms_output.put_line('Data successfully inserted');

END;