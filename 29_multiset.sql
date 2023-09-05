--MULTISET UNION
--MULTISET UNION DISTINCT
--MULTISET EXCEPT
--MULTISET INTERSECT

DECLARE
    TYPE t_tab IS TABLE OF NUMBER;
    1_tab1 t_tab := t_tab(1, 2, 3, 4, 5, 6);
    1_tab2 t_tab := t_tab(5, 6, 7, 8, 9, 10);
BEGIN
    1_tab1 := 1_tab MULTISET UNION 1_tab2;

    FOR i IN 1_tab1.first .. 1_tab1_last LOOP
        dbms_output.put_line(1_tab1(i));
    END LOOP;
END;