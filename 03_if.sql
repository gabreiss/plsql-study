DECLARE
    total_amount number := 105;
    discount number := 0;
BEGIN
    if total_amount > 200
    then
    discount:= total_amount * .2;
    elsif total_amount < 200 and total_amount > 100
    then
    discount:= total_amount * .0;
    else
    discount:= total_amount * 0.5;
    end if;

    dbms_output.put_line( discount);

END;