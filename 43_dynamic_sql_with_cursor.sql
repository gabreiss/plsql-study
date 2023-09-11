create or replace procedure fetch_sales_dynamic (s_orderid number, s_cust_id number)
as
type sales_cur is ref cursor;
s_cursor sales_cur;
sales_rec sales%rowtype;
sql_smt varchar(500) := 'SELECT SALES_DATE, ORDER_ID, PRODUCT_ID FROM SALES WHERE 1 = 1';

begin
if s_orderid is not null then
sql_smt := sql_smt || 'AND ORDER_ID = :var1';
end if;

begin
if s_cust_id is not null then
sql_smt := sql_smt || 'AND CUSTOMER_ID = :var2';
end if;

dbms_output.putline(sql_smt);

if s_orderid is not null and s_cust_id is null then
    open s_cursor for sql_smt using s_orderid;
if s_orderid is null and s_cust_id is not null then
    open s_cursor for sql_smt using s_cust_id;
if s_orderid is not null and s_cust_id is not null then
    open s_cursor for sql_smt using s_orderid, s_cust_id;

loop
    fetch s_cursor into sale_rec;
    exit when s_cursor%notfound;
    dbms_output.putline(sale_rec.sales_date);
    dbms_output.putline(sale_rec.order_id);
    dbms_output.putline(sale_rec.produt_id);
end loop;

exception
when no_data_found then
    dbms_output.putline('No data found');
when too_many_rows then
    dbms_output.putline('Too many rows');
when others then
    dbms_output.putline('Error');

close s_cursor;
end;