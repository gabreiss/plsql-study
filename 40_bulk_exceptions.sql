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

    for indx in 1 .. l_sales.count save exceptions
        insert into sales_2 values l_sales(indx);

exit when sales_cursor%notfound;
end loop;
close sales_cursor;

exceptions
    when others then
        if sqlcode = -24381 then
        for indx in 1 .. sql%bulk_execptions.count
        loop
            dbms_output.putline(sql%bulk_execptions(indx).error_index);
            dbms_output.putline(sqlerrm(-sql%bulk_execptions(indx).error_code);
        end loop;
    else raise;
    end if;
end;

end;