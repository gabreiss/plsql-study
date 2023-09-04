DECLARE
    total_amount number := 105;
    discount number := 0;
BEGIN
    CASE
    WHEN total_amount > 200
    then
    discount:= total_amount * .2;

    WHEN total_amount < 200 and total_amount > 100
    then
    discount:= total_amount * .0;
    else
    discount:= total_amount * 0.5;
    end CASE;

    dbms_output.put_line( discount);

END;