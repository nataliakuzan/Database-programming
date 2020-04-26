--TABLES
INSERT INTO Tables (TABLE_ID, TABLE_AVAILABILITY, PEOPLE_QUANTITY)
VALUES (1, 1, 4);

INSERT INTO Tables (TABLE_ID, TABLE_AVAILABILITY, PEOPLE_QUANTITY)
VALUES (2, 1, 2);

INSERT INTO Tables (TABLE_ID, TABLE_AVAILABILITY, PEOPLE_QUANTITY)
VALUES (3, 1, 2);

INSERT INTO Tables (TABLE_ID, TABLE_AVAILABILITY, PEOPLE_QUANTITY)
VALUES (4, 1, 2);

INSERT INTO Tables (TABLE_ID, TABLE_AVAILABILITY, PEOPLE_QUANTITY)
VALUES (5, 1, 8);

INSERT INTO Tables (TABLE_ID, TABLE_AVAILABILITY, PEOPLE_QUANTITY)
VALUES (6, 1, 8);

INSERT INTO Tables (TABLE_ID, TABLE_AVAILABILITY, PEOPLE_QUANTITY)
VALUES (7, 1, 6);

INSERT INTO Tables (TABLE_ID, TABLE_AVAILABILITY, PEOPLE_QUANTITY)
VALUES (8, 1, 6);

INSERT INTO Tables (TABLE_ID, TABLE_AVAILABILITY, PEOPLE_QUANTITY)
VALUES (9, 1, 4);

INSERT INTO Tables (TABLE_ID, TABLE_AVAILABILITY, PEOPLE_QUANTITY)
VALUES (10, 1, 2);

INSERT INTO Tables (TABLE_ID, TABLE_AVAILABILITY, PEOPLE_QUANTITY)
VALUES (11, 1, 2);

INSERT INTO Tables (TABLE_ID, TABLE_AVAILABILITY, PEOPLE_QUANTITY)
VALUES (12, 1, 4);

INSERT INTO Tables (TABLE_ID, TABLE_AVAILABILITY, PEOPLE_QUANTITY)
VALUES (13, 1, 8);

INSERT INTO Tables (TABLE_ID, TABLE_AVAILABILITY, PEOPLE_QUANTITY)
VALUES (14, 1, 4);

INSERT INTO Tables (TABLE_ID, TABLE_AVAILABILITY, PEOPLE_QUANTITY)
VALUES (15, 1, 4);

INSERT INTO Tables (TABLE_ID, TABLE_AVAILABILITY, PEOPLE_QUANTITY)
VALUES (16, 1, 6);

--RESERVATIONS
ALTER SESSION SET nls_date_format='DD/MM/YYYY HH24:MI:SS';

INSERT INTO RESERVATION (RESERVATION_ID, TABLE_ID, RESERVATION_DATE, SURNAME)
VALUES (1, 1,  TO_DATE('06/01/2019 18:00:00','DD/MM/YYYY HH24:MI:SS'), 'Potter');
  
INSERT INTO RESERVATION (RESERVATION_ID, TABLE_ID, RESERVATION_DATE, SURNAME)
VALUES (2, 1,  TO_DATE('06/01/2019 16:00:00','DD/MM/YYYY HH24:MI:SS'), 'Weasley'); 
 	
INSERT INTO RESERVATION (RESERVATION_ID, TABLE_ID, RESERVATION_DATE, SURNAME)
VALUES (3, 1,  TO_DATE('06/01/2019 20:00:00','DD/MM/YYYY HH24:MI:SS'), 'Granger'); 
	
INSERT INTO RESERVATION (RESERVATION_ID, TABLE_ID, RESERVATION_DATE, SURNAME)
VALUES (4, 1,  TO_DATE('06/01/2019 14:00:00','DD/MM/YYYY HH24:MI:SS'), 'Wesoly'); 
		 
INSERT INTO RESERVATION (RESERVATION_ID, TABLE_ID, RESERVATION_DATE, SURNAME)
VALUES (5, 1,  TO_DATE('07/01/2019 18:30:00','DD/MM/YYYY HH24:MI:SS'), 'Smutny');

INSERT INTO RESERVATION (RESERVATION_ID, TABLE_ID, RESERVATION_DATE, SURNAME)
VALUES (6, 1,  TO_DATE('07/01/2019 17:00:00','DD/MM/YYYY HH24:MI:SS'), 'Wysoki'); 

INSERT INTO RESERVATION (RESERVATION_ID, TABLE_ID, RESERVATION_DATE, SURNAME)
VALUES (7, 1,  TO_DATE('07/01/2019 19:00:00','DD/MM/YYYY HH24:MI:SS'), 'Lysy'); 

INSERT INTO RESERVATION (RESERVATION_ID, TABLE_ID, RESERVATION_DATE, SURNAME)
VALUES (8, 1,  TO_DATE('07/01/2019 18:00:00','DD/MM/YYYY HH24:MI:SS'), 'Sprytny');

INSERT INTO RESERVATION (RESERVATION_ID, TABLE_ID, RESERVATION_DATE, SURNAME)
VALUES (9, 1,  TO_DATE('08/01/2019 20:15:00','DD/MM/YYYY HH24:MI:SS'), 'Niesprytny');

INSERT INTO RESERVATION (RESERVATION_ID, TABLE_ID, RESERVATION_DATE, SURNAME)
VALUES (10, 13,  TO_DATE('06/01/2019 17:00:00','DD/MM/YYYY HH24:MI:SS'), 'Marny'); 

INSERT INTO RESERVATION (RESERVATION_ID, TABLE_ID, RESERVATION_DATE, SURNAME)
VALUES (11, 5,  TO_DATE('06/01/2019 19:00:00','DD/MM/YYYY HH24:MI:SS'), 'Stoner'); 

INSERT INTO RESERVATION (RESERVATION_ID, TABLE_ID, RESERVATION_DATE, SURNAME)
VALUES (12, 9,  TO_DATE('06/01/2019 18:00:00','DD/MM/YYYY HH24:MI:SS'), 'Metaler');

INSERT INTO RESERVATION (RESERVATION_ID, TABLE_ID, RESERVATION_DATE, SURNAME)
VALUES (13, 7,  TO_DATE('06/01/2019 20:15:00','DD/MM/YYYY HH24:MI:SS'), 'Radosny');

-- DISCOUNTS
ALTER SESSION SET nls_date_format='DD/MM/YYYY';

INSERT INTO DISCOUNTS (DISH_TYPE, DISCOUNT_PERCENT, DISCOUNT_DATE)
VALUES ('Dinner', 0.10, TO_DATE('20/02/2019','DD/MM/YYYY'));

INSERT INTO DISCOUNTS (DISH_TYPE, DISCOUNT_PERCENT, DISCOUNT_DATE)
VALUES ('Drink', 0.05, TO_DATE('15/02/2019','DD/MM/YYYY'));

INSERT INTO DISCOUNTS (DISH_TYPE, DISCOUNT_PERCENT, DISCOUNT_DATE)
VALUES ('Appetizer', 0.15, TO_DATE('05/02/2019','DD/MM/YYYY'));

INSERT INTO DISCOUNTS (DISH_TYPE, DISCOUNT_PERCENT, DISCOUNT_DATE)
VALUES ('Dessert', 0.10, TO_DATE('25/01/2019','DD/MM/YYYY'));

--MENU 
INSERT INTO MENU (DISH_ID, DISH_NAME, DISH_TYPE, DISH_DESCRIPTION, PRICE)
VALUES (1, 'Pizza Margerita', 'Dinner', 'tomato sauce, mozzarella cheese, fresh basil', 19.50);

INSERT INTO MENU (DISH_ID, DISH_NAME, DISH_TYPE, DISH_DESCRIPTION, PRICE)
VALUES (2, 'Pizza Capricciosa', 'Dinner', 'tomato sauce, mozzarella cheese, baked ham, mushrooms', 23.50);

INSERT INTO MENU (DISH_ID, DISH_NAME, DISH_TYPE, DISH_DESCRIPTION, PRICE)
VALUES (3, 'Pizza Pepperoni', 'Dinner', 'tomato sauce, mozzarella cheese, pepperoni', 21.50);

INSERT INTO MENU (DISH_ID, DISH_NAME, DISH_TYPE, DISH_DESCRIPTION, PRICE)
VALUES (4, 'Pizza Quattro Formaggi', 'Dinner', 'tomato sauce, mozzarella cheese, gorgonzola cheese, ricotta cheese, parmesan cheese', 25.80);

INSERT INTO MENU (DISH_ID, DISH_NAME, DISH_TYPE, DISH_DESCRIPTION, PRICE)
VALUES (5, 'Linguine Carbonara', 'Dinner', 'pasta, egg yolk, pecorino cheese, pancetta, black pepper', 24.10);

INSERT INTO MENU (DISH_ID, DISH_NAME, DISH_TYPE, DISH_DESCRIPTION, PRICE)
VALUES (6, 'Spaghetti Bolognese', 'Dinner', 'pasta, onion, celery, carrot, minced beef, tomato sauce', 28.60);

INSERT INTO MENU (DISH_ID, DISH_NAME, DISH_TYPE, DISH_DESCRIPTION, PRICE)
VALUES (7, 'Chianti Wine', 'Drink', 'red wine', 8.90);

INSERT INTO MENU (DISH_ID, DISH_NAME, DISH_TYPE, DISH_DESCRIPTION, PRICE)
VALUES (8, 'Latte macchiato', 'Drink', 'coffee with foamed milk', 12.30);

INSERT INTO MENU (DISH_ID, DISH_NAME, DISH_TYPE, DISH_DESCRIPTION, PRICE)
VALUES (9, 'Bruschetta', 'Appetizer', 'grilled bread, garlic, chopped tomato, olive oil', 17.40);

INSERT INTO MENU (DISH_ID, DISH_NAME, DISH_TYPE, DISH_DESCRIPTION, PRICE)
VALUES (10, 'Tiramisu', 'Dessert', 'biscuits dipped in coffee, mascarpone cheese, cocoa', 13.80);

INSERT INTO MENU (DISH_ID, DISH_NAME, DISH_TYPE, DISH_DESCRIPTION, PRICE)
VALUES (11, 'Strawberry Panna Cotta', 'Dessert', 'cooked cream with strawberry sauce', 9.90);

--STAFF
INSERT INTO STAFF (EMPLOYEE_ID, EMPLOYEE_NAME, CONTACT_NUMBER)
VALUES (1, 'Anna Grant', '615223549');

INSERT INTO STAFF (EMPLOYEE_ID, EMPLOYEE_NAME, CONTACT_NUMBER)
VALUES (2, 'Tom Older', '622340908');

INSERT INTO STAFF (EMPLOYEE_ID, EMPLOYEE_NAME, CONTACT_NUMBER)
VALUES (3, 'Mary Hill', '503456723');

INSERT INTO STAFF (EMPLOYEE_ID, EMPLOYEE_NAME, CONTACT_NUMBER)
VALUES (4, 'Brian Saint', '519024733');

INSERT INTO STAFF (EMPLOYEE_ID, EMPLOYEE_NAME, CONTACT_NUMBER)
VALUES (5, 'Hank Cartman', '534620007');

INSERT INTO STAFF (EMPLOYEE_ID, EMPLOYEE_NAME, CONTACT_NUMBER)
VALUES (6, 'Linda Starr', '665734091');

INSERT INTO STAFF (EMPLOYEE_ID, EMPLOYEE_NAME, CONTACT_NUMBER)
VALUES (7, 'Jenny Young', '620345786');

INSERT INTO STAFF (EMPLOYEE_ID, EMPLOYEE_NAME, CONTACT_NUMBER)
VALUES (8, 'Alan Kowalski', '567430112');

-- ORDERS
ALTER SESSION SET nls_date_format='DD/MM/YYYY HH24:MI:SS';

INSERT INTO ORDERS (ORDER_ID, EMPLOYEE_ID, TABLE_ID, ORDER_DATE, TOTAL_PRICE, REALIZED)
VALUES (1, 2, 1, TO_DATE('06/01/2019 18:00:00','DD/MM/YYYY HH24:MI:SS'), 0, 0);

INSERT INTO ORDERS (ORDER_ID, EMPLOYEE_ID, TABLE_ID, ORDER_DATE, TOTAL_PRICE, REALIZED)
VALUES (2, 3, 5, TO_DATE('06/01/2019 17:30:00','DD/MM/YYYY HH24:MI:SS'), 0, 0);

INSERT INTO ORDERS (ORDER_ID, EMPLOYEE_ID, TABLE_ID, ORDER_DATE, TOTAL_PRICE, REALIZED)
VALUES (3, 1, 3, TO_DATE('07/01/2019 18:20:00','DD/MM/YYYY HH24:MI:SS'), 0, 0);

INSERT INTO ORDERS (ORDER_ID, EMPLOYEE_ID, TABLE_ID, ORDER_DATE, TOTAL_PRICE, REALIZED)
VALUES (4, 6, 10, TO_DATE('08/01/2019 19:50:00','DD/MM/YYYY HH24:MI:SS'), 0, 0);

INSERT INTO ORDERS (ORDER_ID, EMPLOYEE_ID, TABLE_ID, ORDER_DATE, TOTAL_PRICE, REALIZED)
VALUES (5, 4, 13, TO_DATE('06/01/2019 17:10:00','DD/MM/YYYY HH24:MI:SS'), 0, 0);

INSERT INTO ORDERS (ORDER_ID, EMPLOYEE_ID, TABLE_ID, ORDER_DATE, TOTAL_PRICE, REALIZED)
VALUES (6, 3, 4, TO_DATE('07/01/2019 18:05:00','DD/MM/YYYY HH24:MI:SS'), 0, 0);

INSERT INTO ORDERS (ORDER_ID, EMPLOYEE_ID, TABLE_ID, ORDER_DATE, TOTAL_PRICE, REALIZED)
VALUES (7, 7, 8, TO_DATE('09/01/2019 18:20:00','DD/MM/YYYY HH24:MI:SS'), 0, 0);

INSERT INTO ORDERS (ORDER_ID, EMPLOYEE_ID, TABLE_ID, ORDER_DATE, TOTAL_PRICE, REALIZED)
VALUES (8, 5, 9, TO_DATE('06/01/2019 17:50:00','DD/MM/YYYY HH24:MI:SS'), 0, 0);

INSERT INTO ORDERS (ORDER_ID, EMPLOYEE_ID, TABLE_ID, ORDER_DATE, TOTAL_PRICE, REALIZED)
VALUES (9, 6, 2, TO_DATE('08/01/2019 19:00:00','DD/MM/YYYY HH24:MI:SS'), 0, 0);

INSERT INTO ORDERS (ORDER_ID, EMPLOYEE_ID, TABLE_ID, ORDER_DATE, TOTAL_PRICE, REALIZED)
VALUES (10, 5, 11, TO_DATE('05/01/2019 20:00:00','DD/MM/YYYY HH24:MI:SS'), 0, 0);

INSERT INTO ORDERS (ORDER_ID, EMPLOYEE_ID, TABLE_ID, ORDER_DATE, TOTAL_PRICE, REALIZED)
VALUES (11, 1, 12, TO_DATE('07/01/2019 16:50:00','DD/MM/YYYY HH24:MI:SS'), 0, 0);

INSERT INTO ORDERS (ORDER_ID, EMPLOYEE_ID, TABLE_ID, ORDER_DATE, TOTAL_PRICE, REALIZED)
VALUES (12, 7, 6, TO_DATE('06/01/2019 18:00:00','DD/MM/YYYY HH24:MI:SS'), 0, 0);

INSERT INTO ORDERS (ORDER_ID, EMPLOYEE_ID, TABLE_ID, ORDER_DATE, TOTAL_PRICE, REALIZED)
VALUES (13, 6, 7, TO_DATE('06/01/2019 19:50:00','DD/MM/YYYY HH24:MI:SS'), 0, 0);

INSERT INTO ORDERS (ORDER_ID, EMPLOYEE_ID, TABLE_ID, ORDER_DATE, TOTAL_PRICE, REALIZED)
VALUES (14, 8, 16, TO_DATE('07/01/2019 17:40:00','DD/MM/YYYY HH24:MI:SS'), 0, 0);

INSERT INTO ORDERS (ORDER_ID, EMPLOYEE_ID, TABLE_ID, ORDER_DATE, TOTAL_PRICE, REALIZED)
VALUES (15, 1, 15, TO_DATE('08/01/2019 18:15:00','DD/MM/YYYY HH24:MI:SS'), 0, 0);

INSERT INTO ORDERS (ORDER_ID, TABLE_ID, ORDER_DATE, TOTAL_PRICE, REALIZED)
VALUES (16, 7, TO_DATE('06/01/2019 17:00:00','DD/MM/YYYY HH24:MI:SS'), 0, 0);

-- ORDERED_DISHES
INSERT INTO ORDERED_DISHES (ORDER_ID, DISH_ID, QUANTITY)
VALUES (3, 4, 2);

INSERT INTO ORDERED_DISHES (ORDER_ID, DISH_ID, QUANTITY)
VALUES (5, 7, 8);

INSERT INTO ORDERED_DISHES (ORDER_ID, DISH_ID, QUANTITY)
VALUES (5, 3, 4);

INSERT INTO ORDERED_DISHES (ORDER_ID, DISH_ID, QUANTITY)
VALUES (5, 1, 4);

INSERT INTO ORDERED_DISHES (ORDER_ID, DISH_ID, QUANTITY)
VALUES (11, 6, 2);

INSERT INTO ORDERED_DISHES (ORDER_ID, DISH_ID, QUANTITY)
VALUES (11, 10, 4);

INSERT INTO ORDERED_DISHES (ORDER_ID, DISH_ID, QUANTITY)
VALUES (9, 2, 1);

INSERT INTO ORDERED_DISHES (ORDER_ID, DISH_ID, QUANTITY)
VALUES (9, 5, 1);

INSERT INTO ORDERED_DISHES (ORDER_ID, DISH_ID, QUANTITY)
VALUES (9, 7, 2);

INSERT INTO ORDERED_DISHES (ORDER_ID, DISH_ID, QUANTITY)
VALUES (10, 11, 2);

INSERT INTO ORDERED_DISHES (ORDER_ID, DISH_ID, QUANTITY)
VALUES (13, 2, 3);

INSERT INTO ORDERED_DISHES (ORDER_ID, DISH_ID, QUANTITY)
VALUES (1, 3, 2);

INSERT INTO ORDERED_DISHES (ORDER_ID, DISH_ID, QUANTITY)
VALUES (1, 6, 2);

INSERT INTO ORDERED_DISHES (ORDER_ID, DISH_ID, QUANTITY)
VALUES (2, 9, 2);

INSERT INTO ORDERED_DISHES (ORDER_ID, DISH_ID, QUANTITY)
VALUES (2, 2, 2);

INSERT INTO ORDERED_DISHES (ORDER_ID, DISH_ID, QUANTITY)
VALUES (2, 1, 4);

INSERT INTO ORDERED_DISHES (ORDER_ID, DISH_ID, QUANTITY)
VALUES (4, 4, 2);

INSERT INTO ORDERED_DISHES (ORDER_ID, DISH_ID, QUANTITY)
VALUES (7, 8, 6);