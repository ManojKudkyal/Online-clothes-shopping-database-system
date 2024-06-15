create table employee_details(
employee_id varchar(20) primary key,
employee_name varchar(20) not null,
position varchar(20),
phone_number varchar(20) not null,
salary numeric(7) not null);

create table warehouse_details
(pincode varchar(20),
city varchar(20) not null,
state varchar(20) not null,
manager_id varchar(20), 
constraint  unit_pincode_pk primary key(pincode),
constraint  manager_id_fk foreign key(manager_id) references employee_details(employee_id));




create table user_details
(user_id varchar(20),
user_password varchar(20) not null,
first_name varchar(20) not null,
last_name varchar(20) not null,
user_name varchar(40) not null unique,
shipping_address varchar(100) not null,
shipping_pincode varchar(20) not null,
email_id varchar(50) unique,
phone_number varchar(20) not null unique,
payment_details varchar(20) not null,
constraint user_details_pk primary key(user_id),
constraint shipping_pincode_fk foreign key(shipping_pincode) references warehouse_details(pincode));

create table product_category
(category_id varchar(20),
category_name varchar(20) not null,
constraint category_id_pk primary key(category_id));

create table product_details(
product_id varchar(200) primary key,
product_name varchar(2000) not null,
product_description varchar(10000),
product_brand varchar(200),
product_category varchar(20),
product_size_variations varchar(200) not null,
product_cost_price numeric(60) not null ,
product_selling_price numeric(60) not null ,
product_stock_quantity numeric(50),
constraint product_category_fk foreign key(product_category) references product_category(category_id));


create table order_details
( order_id varchar(20) ,
user_id varchar(20) not null,
product_id varchar(20) not null,
quantity varchar(20) check (quantity<50000) not null,
order_date date, 
delievry_date date,
constraint order_id_pk primary key(order_id),
constraint user_id_fk foreign key(user_id) references user_details(user_id),
constraint product_id_fk foreign key (product_id) references product_details(product_id)
);




 
create table ratings_reviews(
review_id varchar(20),
order_id varchar(20),
user_id varchar(20) not null,
rating varchar(20) check (rating>=1 and rating <=5) not null,
reviews varchar(100),
reviews_date date,
constraint review_id_pk primary key(review_id),
constraint order_id_fkss foreign key(order_id) references order_details(order_id));



create table Returns_and_Refunds(
return_id varchar(20),
order_id varchar(20),
return_reason varchar(500),
return_date date,
refund_amount numeric(8) not null,
refund_statues varchar(20) not null,
constraint return_id_pk primary key(return_id),
constraint order_Id_fk foreign key(order_id) references order_details(order_id));


create table Transaction_Details(
transaction_ID varchar(20),
order_id varchar(20),
transaction_type varchar(20) not null,
total_price numeric(6) not null,
transaction_date_time date,
payment_statues varchar(20) not null,
constraint transaction_ID_pk primary key(transaction_ID),
constraint order_id_fks foreign key(order_id) references order_details(order_id));