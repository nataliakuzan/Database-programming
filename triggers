alter session set nls_timestamp_format = 'DD-MON-YYYY HH24:MI:SS';

CREATE OR REPLACE TRIGGER CHECK_TABLE_RESERVATION
BEFORE INSERT OR UPDATE ON RESERVATION
FOR EACH ROW
DECLARE
boolean_check number := 0;
BEGIN
    FOR table_record IN (SELECT table_id FROM Tables) LOOP
        IF table_record.table_id = :NEW.table_id THEN
            boolean_check := 1;
        END IF;
    END LOOP;
    IF boolean_check = 0 THEN
    RAISE_APPLICATION_ERROR(-20000, 'Table with ID: ' || :NEW.table_id ||' does not exist.');
    END IF;
    
    FOR reservation_record IN (SELECT table_id, reservation_date FROM Reservation) LOOP
        IF reservation_record.table_id = :NEW.table_id 
            AND EXTRACT(YEAR FROM reservation_record.reservation_date) = EXTRACT(YEAR FROM :NEW.reservation_date)
            AND EXTRACT(MONTH FROM reservation_record.reservation_date) = EXTRACT(MONTH FROM :NEW.reservation_date)
            AND EXTRACT(DAY FROM reservation_record.reservation_date) = EXTRACT(DAY FROM :NEW.reservation_date)
            AND ABS(EXTRACT(HOUR FROM CAST(reservation_record.reservation_date AS TIMESTAMP)) - EXTRACT(HOUR FROM CAST(:NEW.reservation_date AS TIMESTAMP))) <= 2 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Table with ID: ' || :NEW.table_id ||' is already reserved in this time period. Chose another table.');
        END IF;
    END LOOP;
END;
/

/* NOT WORKING

CREATE OR REPLACE TRIGGER CHANGE_TOTAL_PRICE
AFTER INSERT OR UPDATE ON ORDERED_DISHES
FOR EACH ROW
DECLARE
v_total_price NUMBER;
BEGIN
SELECT total_price_of_meal INTO v_total_price
      FROM (SELECT sum(price*quantity) AS total_price_of_meal
        FROM ordered_dishes JOIN menu
        ON (ordered_dishes.dish_id = menu.dish_id)
        WHERE order_id = :NEW.order_id);
UPDATE orders SET total_price = v_total_price WHERE order_id = :NEW.order_id;
END;*/

--WORKING
CREATE OR REPLACE TRIGGER CHANGE_TOTAL_PRICE
AFTER INSERT OR UPDATE ON ORDERED_DISHES
BEGIN
UPDATE orders SET total_price = price_of_order(order_id) where order_id > 0;
END;

CREATE TABLE audit_table
(old_dish_name varchar2(25),
 new_dish_name varchar2(25),
 old_price decimal(6,2),
 new_price decimal(6,2),
 date_of_change TIMESTAMP DEFAULT SYSTIMESTAMP);
 
CREATE OR REPLACE TRIGGER audit_menu
AFTER INSERT OR UPDATE OR DELETE ON menu
FOR EACH ROW
WHEN (NEW.dish_name <> OLD.dish_name or NEW.price <> OLD.price 
OR (NEW.dish_name IS NOT NULL AND OLD.dish_name IS NOT NULL) 
OR (NEW.price IS NOT NULL AND OLD.price IS NOT NULL))
BEGIN
   INSERT INTO audit_table(old_dish_name,new_dish_name,old_price,new_price)
   VALUES(:OLD.dish_name, :NEW.dish_name, :OLD.price, :NEW.price);
END;
/

UPDATE menu SET dish_name = 'Pizza Prosciutto' where dish_id = 1;