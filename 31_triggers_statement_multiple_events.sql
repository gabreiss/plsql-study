CREATE OR REPLACE TRIGGER customer_after_action
AFTER INSERT OR UPDATE OR DELETE
ON CUSTOMER

DECLARE
    v_username VARCHAR2(10);

BEGIN
    SELECT user INTO v_username
    FROM dual;

    IF INSERTING THEN
        INSERT INTO audit_table (table_name, user_id, date, operation)
        VALUES ('customer', v_username, sysdate, 'insert');
    IF UPDATING THEN
        INSERT INTO audit_table (table_name, user_id, date, operation)
        VALUES ('customer', v_username, sysdate, 'update');
    IF DELETING THEN
        INSERT INTO audit_table (table_name, user_id, date, operation)
        VALUES ('customer', v_username, sysdate, 'delete');