create or replace procedure delete_customer (customer_id in number) as
    cursor_name integer;
    rows_processed integer;
begin
    --open the cursor
    cursor_name = dbms_sql.open_cursor; 
    --parse the sql statement
    dbms_sql.parse(cursor_name, 'delete from customer where customer_id = :var1', dbms_sql.nativa);
    --bingind the variable
    dbms_sql.bind_variable(cursor_name, ':var1', customer_id);
    --executing the cursor
    rows_processed := dbms_sql.execute(cursor_name);
    --closing the cursor
    dbms_sql.close_cursor(cursor_name);

exception
when others then
    dbms_sql.close_cursor(cursor_name);
end;