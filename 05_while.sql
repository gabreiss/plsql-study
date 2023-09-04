DECLARE 
    CNTR number(2) := 10;
BEGIN
    WHILE CNTR < 20
    LOOP
        dbms_output.put_line('Value of CNTR:' || CNTR);
        CNTR:= CNTR + 1;
    END LOOP;
END;