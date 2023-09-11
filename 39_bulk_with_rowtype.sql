create or replace procedure fetch_sales_cur (s_date date)
as
    cursor sales_cursor is
    select * from sales where sales_date = date;

    type l_salestable is table of sales%rowtype;
    l_sales l_salestable;

begin
open cursor sales_cursor;

loop
    fetch sales_cursor bulk collect into l_sales
    limit 100;

    for indx in 1 .. l_sales.count
    loop
        dbms_output.putline(l_sales(indx).1s_field)
        dbms_output.putline(l_sales(indx).2nd_field)
        dbms_output.putline(l_sales(indx).3rd_field)
    end loop;

exit when sales_cursor%notfound;
end loop;
close sales_cursor;
end;