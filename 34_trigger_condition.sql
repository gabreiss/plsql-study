CREATE OR REPLACE TRIGGER customer_after_update
AFTER UPDATE
ON CUSTOMER

FOR EACH ROW
WHEN (OLD.country = 'Brazil') -- triggers only if the field country is equals to 'Brazil'

DECLARE
    v_username VARCHAR2(10);

BEGIN
    SELECT user INTO v_username
    FROM dual;

    INSERT INTO audit_table (table_name, user_id, date, old_field, new_field)
    VALUES ('customer', v_username, sysdate, :old.first_name, :new.first_name);

END;