-- function that takes an order_id and check if it's eligible for taxes
create or replace function check_eligible(p_order number, l_eligible out boolean)
as
    l_total number;
BEGIN

select sum(total_amount) into l_total from sales
where order_id = p_order;

if l_total > 1000 then
    l_eligible = True;
end if;

END;

create or replace procedure update_tax (tax_rates in number)
as
    l_eligible booelan;
    type order_type is table of sales.order_id%type index by pls_integer; -- defines an associative array
    l_order_ids order_type;
    l_eligible_orders order_type;

BEGIN

select distinct order_id from bulk collect into l_order_ids from sales;

for indx in 1 .. l_order_ids.count
loop
    check_eligible(l_order_ids(indx), l_eligible);

    if l_eligible then
        l_eligible_orders(l_eligible_orders.count + 1) := l_order_ids(indx);
    end if;
end loop;

forall indx in 1 .. l_eligible_orders.count
    update sales s
    set s.tax_amount = s.total_amount * tax_rates
    where s.order_id = l_eligible(indx);

commit;
end;
