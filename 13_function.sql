CREATE OR REPLACE FUNCTION find_salescount
(
    p_sales_date IN NUMBER
) RETURN NUMBER
AS 
    num_of_sales number := 0;
BEGIN
    SELECT COUNT(*) INTO num_of_sales FROM sales
    WHERE sales_date = p_sales_date;

    RETURN num_of_sales;
END find_salescount;

-- calling it

select find_salescount(to_date('01-01-2015', 'dd-mm-yyyy')) from dual;

--or

DECLARE
scount number:=0;
BEGIN
scount := find_salescount(to_date('01-01-2015', 'dd-mm-yyyy'));
dbms_output.put_line('total sales: ' || scount);
END;