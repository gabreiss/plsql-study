CREATE TRIGGER customer_before_update
BEFORE UPDATE
ON CUSTOMER

DECLARE
    v_username varchar2(10);

BEGIN
    SELECT user INTO v_username
    FROM dual;

    INSERT INTO audit_table (table_name, user_id, date, operation)
    VALUES ('customer', v_username, sysdate, 'Before update');

END;