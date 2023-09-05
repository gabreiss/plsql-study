CREATE OR REPLACE PROCEDURE process_customer
(c_id IN customer.customer_id%type)
AS
    c_rec customer%rowtype;
BEGIN
    SELECT *
    INTO c_rec
    FROM customer
    WHERE customer_id = c_id;
    insert_customer(c_rec)
END process_procuredure;

CREATE OR REPLACE PROCEDURE insert_customer
(customer_in customer%rowtype)
AS 
BEGIN
    INSERT INTO customer VALUES customer_in;
--  update customer set row = customer_in where customer_id = customer_in.customer_id;
    COMMIT
END;

 

     