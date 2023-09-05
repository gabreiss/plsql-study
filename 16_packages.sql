CREATE OR REPLACE PACKAGE CUSTOMER_PACKAGE
AS

FUNCTION find_salescount
(
    p_sales_date IN NUMBER
) RETURN NUMBER;

PROCEDURE ADD_CUSTOMER
(
    c_id        IN NUMBER,
    c_fname     IN VARCHAR2,
    c_lname     IN VARCHAR2,
    c_addr      IN VARCHAR2
);



END CUSTOMER_PACKAGE;