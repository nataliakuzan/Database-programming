--1 All the dinners which are less expensive than 20

SELECT m.dish_name, m.dish_description, m.price - m.price*d.discount_percent AS price FROM Menu m
LEFT OUTER JOIN Discounts d ON (m.dish_type = d.dish_type)
WHERE m.dish_type = 'Dinner' 
AND m.price - m.price*d.discount_percent < 20;

--2 Money earned at 06/01/2019

SELECT sum(total_price)
FROM orders
WHERE EXTRACT(DAY FROM order_date) = 6 AND EXTRACT(MONTH FROM order_date) = 1 AND EXTRACT(YEAR FROM order_date) = 2019;

--3 Contact number of the most lazy employee (with the lowest amount of orders :))

SELECT employee_name, contact_number
FROM (SELECT s.employee_id as emp_id, COUNT(o.employee_id) as orders, contact_number, employee_name
        FROM staff s JOIN orders o
        ON (s.employee_id  = o.employee_id)
        GROUP BY s.employee_id, contact_number, employee_name) subquery
WHERE orders IN ( SELECT min(orders)
                FROM (SELECT s.employee_id as emp_id, COUNT(o.employee_id) as orders
                        FROM staff s JOIN orders o
                        ON (s.employee_id  = o.employee_id)
                         GROUP BY s.employee_id))
						 


-- 4 Number of orders and quantity of dishes that were ordered at 07/01/2019

SELECT m.dish_name, COUNT(m.dish_id) AS num_of_orders, SUM(od.quantity) AS quantity_of_dish FROM ordered_dishes od
LEFT OUTER JOIN menu m ON (od.dish_id = m.dish_id)
LEFT OUTER JOIN orders o ON (od.order_id = o.order_id)
WHERE EXTRACT(DAY FROM o.order_date) = 7 AND EXTRACT(MONTH FROM o.order_date) = 1 AND EXTRACT(YEAR FROM o.order_date) = 2019
GROUP BY m.dish_name
ORDER BY m.dish_name ASC; 

-- 5 ID of free tables at 06/01/2019

SELECT table_id as free_tables FROM tables
WHERE table_id NOT IN (SELECT DISTINCT r.table_id 
                       FROM reservation r
                       WHERE EXTRACT(DAY FROM r.reservation_date) = 6 
                       AND EXTRACT(MONTH FROM r.reservation_date) = 1 
                       AND EXTRACT(YEAR FROM r.reservation_date) = 2019)
ORDER BY table_id;

-- 6 Daily sales in January 

SELECT EXTRACT(DAY FROM order_date) as day_in_January, sum(total_price) as daily_sales
FROM orders
WHERE EXTRACT(MONTH FROM order_date) = 1 AND EXTRACT(YEAR FROM order_date) = 2019
GROUP BY EXTRACT(DAY FROM order_date);

-- 7 Maximum, minimum and avarage price for dinner

SELECT MAX(price) as maximum_price,
MIN(price) as minimum_price,
ROUND(AVG(price),00) as avarage_price FROM menu
WHERE dish_type ='Dinner';

-- 8 Hours of orders served by waiters at 06/01/2019

SELECT s.employee_name, to_char(order_date, 'HH24:MI') AS hour_of_order FROM staff s
JOIN orders o ON (s.employee_id = o.employee_id)
WHERE EXTRACT(DAY FROM o.order_date) = 6 
AND EXTRACT(MONTH FROM o.order_date) = 1 AND EXTRACT(YEAR FROM o.order_date) = 2019;

-- 9 Money brought by every waiter at 06/01/2019

SELECT s.employee_name, SUM(total_price) FROM staff s
JOIN orders o ON (s.employee_id = o.employee_id)
WHERE EXTRACT(DAY FROM o.order_date) = 6 AND EXTRACT(MONTH FROM o.order_date) = 1 AND EXTRACT(YEAR FROM o.order_date) = 2019
GROUP BY s.employee_name;

-- 10 Quantity of dishes bigger than two dishes for every order at 06/01/2019

SELECT o.order_id, SUM(od.quantity) as quantity_of_ordered_dishes FROM orders o, ordered_dishes od
WHERE od.order_id = o.order_id AND 
EXTRACT(DAY FROM o.order_date) = 6 AND EXTRACT(MONTH FROM o.order_date) = 1 AND EXTRACT(YEAR FROM o.order_date) = 2019
GROUP BY o.order_id
HAVING SUM(od.quantity) > 2
ORDER BY SUM(od.quantity) DESC;
						 
-- 11
select distinct menu.dish_name, percent_of_dish(ordered_dishes.dish_id, '06/01/2019 18:00:00') from ordered_dishes join menu on (ordered_dishes.dish_id = menu.dish_id);
