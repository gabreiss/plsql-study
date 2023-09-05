DECLARE
    TYPE customer_type IS VARRAY(4) OF VARCHAR2(100);
    customer_table customer_type := customer_type(); -- initializing the collection
    v_idx NUMBER;
BEGIN

    customer_table.EXTEND(4); -- you have to extend before using the table

    customer_table(1) := 'Mike';
    customer_table(2) := 'John';
    customer_table(3) := 'Nate';
    -- customer_table(7) := 'Jeff'; -- throws an error, must be sequential
    customer_table(4) := 'Jeff';

    --you cannot delete an item
    --customer_table.DELETE(3);

    --traverse sparse collection
    v_idx := customer_table.FIRST;

    WHILE v_idx IS NOT NULL
    LOOP
        dbms_output.put_line('Customer name:' || customer_table(v_idx));
        v_idx := customer_table.NEXT(v_idx);
    END LOOP display_loop;
END;