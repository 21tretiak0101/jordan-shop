/*postgresql://localhost:5432/shop*/
create database shop;

create table customer
(
  id serial primary key,
  name varchar(255) not null,
  password varchar(255) not null,
  email varchar(255) not null,
  phone varchar(255)
);

create table product
(
  id serial primary key,
  name varchar(255) not null,
  description text,
  price integer not null
);

create table product_photo
(
  id serial primary key,
  url varchar(255),
  product_id integer references product(id)
);

create table cart
(
  id serial primary key,
  customer_id integer references customer(id)
);


create table cart_product
(
  cart_id integer references cart(id),
  product_id integer references product(id)
);