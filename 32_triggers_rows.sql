CREATE OR REPLACE TRIGGER customer_after_update
AFTER UPDATE
ON CUSTOMER

FOR EACH ROW

DECLARE
    v_username VARCHAR2(10);

BEGIN
    SELECT user INTO v_username
    FROM dual;

    INSERT INTO audit_table (table_name, user_id, date, operation)
    VALUES ('customer', v_username, sysdate, 'INSERT OPERATION ROW LEVER');

END;