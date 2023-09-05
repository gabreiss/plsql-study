CREATE OR REPLACE PROCEDURE GET_CUSTOMER
(
        c_id IN NUMBER
)
AS
DECLARE
    c_name customer.first_name%type;
    c_country customer.country%type;
    ex_customer_id EXCEPTION;
BEGIN

    IF c_id  <= 0 THEN
        RAISE ex_customer_id;
    END IF;

    SELECT first_name, country INTO c_name, c_country
    FROM customer
    WHERE customer_id = c_id;

    dbms_output.put_line ('Name: ' || c_name);
    dbms_output.put_line ('Country: ' || c_country);

EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('No data found')
    WHEN TOO_MANY_ROWS THEN
        dbms_output.put_line('Too many rows')
    WHEN ex_customer_id THEN
        dbms_output.put_line('ID must be greater than zero')
    WHEN OTHERS THEN
        dbms_output.put_line('Uncategorized error')

END;

execute GET_CUSTOMER(14);