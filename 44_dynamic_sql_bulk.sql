create or replace procedure update_tax (tax_rate number)
as 
    l_eligible boolean;
    type order_type is table of sales.order_id%type index by pls_integer; -- associative array
    l_order_ids order_type;
    l_eligible_orders order_type;
    l_sql varchar(200) := 'select distinct order_id from sales;';

begin
    execute immediate s_sql bulk collect into l_order_ids;

    for indx in 1 .. l_eligible_orders.count
    loop
        check_eligible(l_order_ids(indx), l_eligible);
        if l_eligible then
            l_eligible_orders(l_eligible_orders.count + 1) := l_order_ids(indx);
        end if;
    end loop;

    forall indx in 1 .. l_eligible_orders.count
        update sales s
        set s.tax_amount = s.tax_amount * tax_rate
        whete s.order_id = l_eligible_orders(indx);
    commit;
end;