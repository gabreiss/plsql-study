create or replace type sales_row as object (
    s_date date,
    s_orderid number,
    s_productid number
);

create or replace function fetch_sales_table (s_orderid number)
    return sales_table
    pipelined
    is
    l_tab sales_table := sales_table();
begin
    for c in (select sales_date, order_id, product_id from sales where order_id = s_orderid)
    loop
        pipe row(c.sales_date, c.order_id, c.product_id);
    end loop;

    return l_tab;
end;

select * from table (fetch_sales_table(12367))