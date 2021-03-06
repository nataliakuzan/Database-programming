
create table Staff (
    employee_id varchar2(3) not null constraint staff_pk primary key,
    employee_name varchar2(25),
    contact_number varchar2(11)
);
/
create table Tables (
    table_id varchar2(5) not null constraint tables_pk primary key,
    table_availability number(1),
    people_quantity number(1),
    constraint tables_testbool_ischk check (table_availability in (1,0))
);
/
create table Reservation (
    reservation_id varchar2(5) not null,
    table_id varchar2(5) not null,
    reservation_date date,
    surname varchar2(25),
    constraint fk_table foreign key (table_id) references Tables(table_id)
);
/
create table Orders (
    order_id varchar2(5) not null constraint orders_pk primary key,
    employee_id varchar2(5),
    table_id varchar2(5),
    order_date date,
    total_price decimal(8,2),
    realized number(1),
    constraint fk_orders_employee foreign key (employee_id) references Staff(employee_id),
    constraint fk_orders_table foreign key (table_id) references Tables(table_id),
    constraint orders_testbool_ischk check (realized in (1,0))
);
/
create table Discounts (
    dish_type varchar2(10) not null constraint discount_pk primary key,
    discount_percent decimal(2,2),
    discount_date date
);
/
create table Menu (
    dish_id varchar2(5) not null constraint menu_pk primary key,
    dish_name varchar2(25),
    dish_type varchar2(10),
    dish_description varchar2(255),
    price decimal(6,2),
    constraint fk_menu_discounts foreign key (dish_type) references Discounts(dish_type)
);
/
create table Ordered_Dishes (
    order_id varchar2(5),
    dish_id varchar2(5),
    quantity number(5),
    constraint fk_ordereddishes_order foreign key (order_id) references Orders(order_id),
    constraint fk_ordereddishes_menu foreign key (dish_id) references Menu(dish_id)
);
/


