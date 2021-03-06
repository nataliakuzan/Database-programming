create or replace PROCEDURE assign_waiter_for_order IS
   staff_id staff.employee_id%TYPE;
BEGIN
      SELECT employee_id INTO staff_id
      FROM(SELECT s.employee_id, COUNT(o.employee_id) as orders
        FROM staff s JOIN orders o
        ON (s.employee_id  = o.employee_id)
        GROUP BY s.employee_id
        ORDER BY COUNT(o.employee_id) ASC) WHERE ROWNUM = 1;

      UPDATE orders SET employee_id = staff_id WHERE employee_id IS NULL;

      IF sql%ROWCOUNT = 0 THEN
         DBMS_OUTPUT.put_line('All orders have assigned waiter.');
      ELSE 
         DBMS_OUTPUT.put_line('Waiter with id ' || staff_id || ' was assigned to ' || sql%ROWCOUNT || ' of new orders.');
      END IF;
END assign_waiter_for_order;


CREATE OR REPLACE PROCEDURE realize_order (id_order IN orders.order_id%TYPE)
IS
no_update_exception EXCEPTION;
BEGIN
  
  UPDATE orders SET realized = 1 
  WHERE order_id = id_order
  AND total_price > 0;
  
  IF SQL%NOTFOUND THEN 
    RAISE no_update_exception;
  END IF;
  dbms_output.put_line('Order was paid.');
  
  EXCEPTION
  WHEN no_update_exception THEN
       dbms_output.put_line('Error : Given order id '||id_order||' is invalid.');

END realize_order;
/

CREATE OR REPLACE FUNCTION price_of_order
   ( v_order_id IN ordered_dishes.order_id%TYPE )
   RETURN number
IS
   v_total_price number;
BEGIN
  SELECT total_price_of_meal INTO v_total_price
      FROM (SELECT sum((m.price - m.price*d.discount_percent)*od.quantity) AS total_price_of_meal
        FROM menu m 
        JOIN ordered_dishes od ON (m.dish_id = od.dish_id)
        JOIN discounts d ON (m.dish_type = d.dish_type)
        WHERE od.order_id = v_order_id);
RETURN v_total_price;
END;
/
UPDATE orders SET total_price = price_of_order(order_id) where total_price = 0;

CREATE OR REPLACE FUNCTION final_price
   ( v_order_id IN ordered_dishes.order_id%TYPE )
   RETURN number
IS
    CURSOR dish_cursor IS
        SELECT dish_id, quantity FROM ordered_dishes WHERE order_id = v_order_id;
    m_price menu.price%TYPE;
    d_discount_percent discounts.discount_percent%TYPE;
    d_discount_date discounts.discount_date%TYPE;
    v_result orders.total_price%TYPE := 0;
    o_date orders.order_date%TYPE;
BEGIN

  SELECT order_date INTO o_date FROM orders
  WHERE order_id = v_order_id;
  
    FOR dish_rec in dish_cursor LOOP
        SELECT m.price, d.discount_percent, d.discount_date
        INTO m_price, d_discount_percent, d_discount_date
        FROM menu m, discounts d
        WHERE m.dish_type = d.dish_type
        AND m.dish_id = dish_rec.dish_id;

        IF d_discount_date>o_date THEN
            v_result:= v_result+ ((m_price - m_price*d_discount_percent) * dish_rec.quantity);
        ELSE
            v_result:= v_result+ (m_price * dish_rec.quantity);
        END IF;
    END LOOP;
    RETURN v_result;
END final_price;
/


CREATE OR REPLACE Function percent_of_dish
   (v_dish_id IN ordered_dishes.dish_id%TYPE, v_order_date IN orders.order_date%TYPE)
   RETURN number
IS
    v_percent number;
    v_all number;
    v_number_of_dish number;
BEGIN
    SELECT sum_all INTO v_all
    FROM ( SELECT sum(quantity) as sum_all
            FROM orders JOIN ordered_dishes
            ON (orders.order_id=ordered_dishes.order_id)
            WHERE EXTRACT(YEAR FROM order_date) = EXTRACT(YEAR FROM v_order_date)
            AND EXTRACT(MONTH FROM order_date) = EXTRACT(MONTH FROM v_order_date)
            AND EXTRACT(DAY FROM order_date) = EXTRACT(DAY FROM v_order_date));
            
    SELECT sum_dishes INTO v_number_of_dish
    FROM ( SELECT sum(quantity) as sum_dishes
            FROM orders JOIN ordered_dishes
            ON (orders.order_id=ordered_dishes.order_id)
            WHERE EXTRACT(YEAR FROM order_date) = EXTRACT(YEAR FROM v_order_date)
            AND EXTRACT(MONTH FROM order_date) = EXTRACT(MONTH FROM v_order_date)
            AND EXTRACT(DAY FROM order_date) = EXTRACT(DAY FROM v_order_date)
            AND ordered_dishes.dish_id = v_dish_id);
            
       v_percent :=      v_number_of_dish / v_all;
       RETURN ROUND(v_percent, 2);
END;

create or replace PROCEDURE reservation_for_a_party (number_of_people IN number, v_date_of_reservation IN date) IS
number_of_free_places number := 0;
table_quantity number := 0;
number_of_reserved_places number := 0;
v_reservation_id number;
number_of_places_in_restaurant number := 0;
check_reservtion number :=0;
BEGIN
FOR reservation_record IN (SELECT table_id, reservation_date FROM Reservation) LOOP

        IF( EXTRACT(YEAR FROM reservation_record.reservation_date) = EXTRACT(YEAR FROM v_date_of_reservation)
            AND EXTRACT(MONTH FROM reservation_record.reservation_date) = EXTRACT(MONTH FROM v_date_of_reservation)
            AND EXTRACT(DAY FROM reservation_record.reservation_date) = EXTRACT(DAY FROM v_date_of_reservation) ) THEN

        SELECT people_quantity INTO table_quantity
        FROM (SELECT people_quantity
                FROM tables
                where table_id = reservation_record.table_id);
        number_of_free_places := number_of_free_places + table_quantity;
    END IF;
END LOOP;

SELECT sum_of_places INTO number_of_places_in_restaurant
FROM ( SELECT sum(people_quantity) as sum_of_places
        FROM Tables);
number_of_free_places := number_of_places_in_restaurant - number_of_free_places;

IF(number_of_people > number_of_free_places) THEN
DBMS_OUTPUT.put_line('In this date there is not enought place for such a big party');
ELSE
FOR tables_record IN (SELECT tables.table_id, tables.people_quantity FROM Tables WHERE table_id<17) LOOP
    FOR reservation_record IN (SELECT table_id, reservation_date FROM Reservation) LOOP
        IF (reservation_record.table_id = tables_record.table_id 
            AND EXTRACT(YEAR FROM reservation_record.reservation_date) = EXTRACT(YEAR FROM v_date_of_reservation)
            AND EXTRACT(MONTH FROM reservation_record.reservation_date) = EXTRACT(MONTH FROM v_date_of_reservation)
            AND EXTRACT(DAY FROM reservation_record.reservation_date) = EXTRACT(DAY FROM v_date_of_reservation)) THEN
            check_reservtion :=1;
        END IF;
    END LOOP;        
            
    IF(check_reservtion = 1) THEN      
    DBMS_OUTPUT.put_line('THIS TBALE IS RESERVED. WE WILL TRY TO CHOSE ANOTHER TABLE ' || tables_record.table_id);
    ELSE
    
    SELECT sum_of_reservation INTO v_reservation_id
    FROM ( SELECT count(*) as sum_of_reservation
            FROM Reservation);
            
    INSERT INTO RESERVATION (RESERVATION_ID, TABLE_ID, RESERVATION_DATE, SURNAME)
    VALUES (v_reservation_id, tables_record.table_id,  v_date_of_reservation, 'party');
        
    number_of_reserved_places := number_of_reserved_places + tables_record.people_quantity;
    
    IF(number_of_reserved_places >= number_of_people) THEN EXIT;
    END IF;
    END IF;
    check_reservtion :=0;
END LOOP;
END IF;
END;
   