CREATE OR REPLACE FUNCTION get_names (custid IN NUMBER)    
    RETURN SYS_REFCURSOR
    IS
        l_return SYS_REFCURSOR;
    BEGIN
        OPEN 1_return FOR
            SELECT first_name, last_name FROM customer WHERE customer_id = custid;
    RETURN 1_return;
END get_names;

CREATE OR REPLACE FUNCTION display_names
IS
c_rec SYS_REFCURSOR;
l_name  VARCHAR2(50);
f_name  VARCHAR2(50);

BEGIN
    c_rec := get_names(10);
    
    LOOP
        FETCH c_rec INTO l_name, f_name;
        EXIT WHEN c_rec%NOTFOUND;
        dbms_output.put_line('First name: ' || f_name)
        dbms_output.put_line('Last name: ' || l_name)
        END LOOP
    
    CLOSE c_rec
END display_names;