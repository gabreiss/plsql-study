DECLARE
    TYPE customer_type IS TABLE OF VARCHAR2(100) INDEX BY BINARY_INTEGER;
    customer_table customer_type;
    v_idx NUMBER;
BEGIN

    customer_table(1) := 'Mike';
    customer_table(2) := 'John';
    customer_table(5) := 'Nate';
    customer_table(7) := 'Jeff';

    --delete the third item
    customer_table.DELETE(3);

    --traverse sparse collection
    v_idx := customer_table.FIRST;

    WHILE v_idx IS NOT NULL
    LOOP
        dbms_output.put_line('Customer name:' || customer_table(v_idx));
        v_idx := customer_table.NEXT(v_idx);
    END LOOP display_loop;
END;