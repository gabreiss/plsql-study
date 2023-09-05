CREATE OR REPLACE PROCEDURE process_customer
(c_id IN customer.customer_id%type)
AS
TYPE CUSTOMER_REC IS RECORD
(
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
);
    c_rec CUSTOMER_REC;
BEGIN
    SELECT first_name, last_name
    INTO c_rec
    FROM customer
    WHERE customer_id = c_id;

    IF sql%found THEN
    total_rows := sql%rowcount;
    dbms_output.put_line('Total rows: ' || total_rows)
    END IF;

    dbms_output.put_line('First name: ' || c_rec.first_name)
    dbms_output.put_line('Last name: ' || c_rec.last_name)

END process_procuredure;

 

     