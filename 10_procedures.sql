CREATE OR REPLACE PROCEDURE ADD_CUSTOMER
(
    c_id        IN NUMBER,
    c_fname     IN VARCHAR2,
    c_lname     IN VARCHAR2,
    c_addr      IN VARCHAR2
)

AS
BEGIN

    INSERT INTO CUSTOMER (customer_id, first_name, last_name, address_line)
    VALUES (c_id, c_fname, c_lname, c_addr);
    COMMIT;

    dbms_output.put_line('Data successfully added')

END ADD_CUSTOMER;

-- calling the procedure

BEGIN
    ADD_CUSTOMER (17, 'Gabriel', 'Reis', 'Curitiba');
END;
-- or

BEGIN
ADD_CUSTOMER (
    c_id        => 17,
    c_fname     => 'Gabriel',
    c_lname     => 'Reis',
    c_addr      => 'Curitiba'
);
END;