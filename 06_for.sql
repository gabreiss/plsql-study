DECLARE 
    CNTR number(2) := 10;
BEGIN
    FOR CNTR IN REVERSE 10..20
    LOOP   
        dbms_output.put_line('value of CNTR:' || CNTR);
    END LOOP;
END;