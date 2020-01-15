CREATE OR REPLACE PACKAGE manage_order_pkg
IS
PROCEDURE realize_order (id_order IN orders.order_id%TYPE);
FUNCTION final_price (v_order_id IN ordered_dishes.order_id%TYPE) RETURN number;
END manage_order_pkg;
/

CREATE OR REPLACE PACKAGE BODY manage_order_pkg
IS

PROCEDURE realize_order (id_order IN orders.order_id%TYPE)
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

FUNCTION final_price
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

END manage_order_pkg;
/