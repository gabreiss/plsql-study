create or replace procedure fetch_sales_dynamic (s_orderid number, s_cust_id number)
as
sales_rec sales%rowtype;
sql_smt varchar(500) := 'SELECT SALES_DATE, ORDER_ID, PRODUCT_ID FROM SALES WHERE 1 = 1';

begin
if s_orderid is not null then
sql_smt := sql_smt || 'AND ORDER_ID = ' || s_orderid;
end if;

begin
if s_cust_id is not null then
sql_smt := sql_smt || 'AND CUSTOMER_ID = ' || s_cust_id;
end if;

dbms_output.putline(sql_smt);

execute immediate sql_smt into sale_rec;

dbms_output.putline(sale_rec.sales_date);
dbms_output.putline(sale_rec.order_id);
dbms_output.putline(sale_rec.produt_id);

exception
when no_data_found then
    dbms_output.putline('No data found');
when too_many_rows then
    dbms_output.putline('Too many rows');
when others then
    dbms_output.putline('Error');
end;