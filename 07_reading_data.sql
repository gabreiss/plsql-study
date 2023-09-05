DECLARE
    c_id    number:= 10;
    c_name  varchar2(50);
    c_addr  varchar2(50);

BEGIN
    SELECT first_name, country INTO c_name, c_addr
    FROM customers
    WHERE customer_id = c_id;

    dbms_output.put_line('Name: ' || c_name);
    dbms_output.put_line('Country: ' || c_addr);
END

-- Data type according to the table

DECLARE
    c_id    customer.customer_id%type:= 10;
    c_name  customer.first_name%type;
    c_addr  customer.country%type;

BEGIN
    SELECT first_name, country INTO c_name, c_addr
    FROM customers
    WHERE customer_id = c_id;

    dbms_output.put_line('Name: ' || c_name);
    dbms_output.put_line('Country: ' || c_addr);
END

