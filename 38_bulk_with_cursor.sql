create or replace function update_tax (tax_rate number)
as
    l_eligible booelan;
    type order_type is table of sales.order_id%type index by pls_integer; -- defines an associative array
    l_order_ids order_type;
    l_eligible_orders order_type;
    cursor sales_cursor is select distinct order_id from sales;
begin
open sales_cursor;

loop 
    fetch sales_cursor;
    bulk collect into l_order_ids limit 100;

    for indx in 1 .. l_order_ids.count
    loop 
        check_eligible(l_order_ids(indx), l_eligible);
        if l_eligible then
            l_eligible_orders(l_eligible_orders.count + 1) := l_order_ids(indx);
        end if;
    end loop;

    exit when l_order_ids.count = 0;

forall indx in 1 .. l_eligible_orders.count
    update sales s
    set s.tax_amount = s.total_amount * tax_rate
    where s.order_id = l_eligible_orders(indx);
commit;

close sales_cursor;

end;