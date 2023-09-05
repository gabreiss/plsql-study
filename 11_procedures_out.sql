CREATE OR REPLACE PROCEDURE ADD_CUSTOMER
(
    c_id        IN NUMBER,
    c_fname     IN VARCHAR2,
    c_lname     IN VARCHAR2,
    c_addr      IN VARCHAR2,
    total       OUT NUMBER
)

AS
BEGIN

    INSERT INTO CUSTOMER (customer_id, first_name, last_name, address_line)
    VALUES (c_id, c_fname, c_lname, c_addr);
    COMMIT;

    dbms_output.put_line('Data successfully added')

    SELECT COUNT(*) INTO total FROM CUSTOMER

END ADD_CUSTOMER;

-- calling the procedure

DECLARE
tcount NUMBER(10);
BEGIN
    ADD_CUSTOMER (17, 'Gabriel', 'Reis', 'Curitiba', tcount);
    dbms_output.put_line('total records: ' || tcount)
END;