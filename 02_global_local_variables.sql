DECLARE
    --global variables
    num1 number := 95;

BEGIN

    dbms_output.put_line('Outer variable num1: ' || num1);

    DECLARE
        --local variables
        num2 number := 185;
    BEGIN
        dbms_output.put_line('Inner variable num1: ' || num1)
        dbms_output.put_line('Inner variable num2: ' || num2)
    END;
END;
    