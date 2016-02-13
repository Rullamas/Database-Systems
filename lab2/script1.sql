-- Drops all objects from database
DROP TABLE dv_customer;
DROP TABLE dv_address; 
DROP TABLE dv_film;
DROP TABLE cb_customers;
DROP TABLE cb_books;
DROP TABLE cb_authors; 
DROP TABLE mg_customers;
DROP TYPE mpaa_rating;

-- Creates table dv_customer
CREATE TABLE dv_customer (
	customer_id integer,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	address_id integer,
	active boolean
);

-- Creates table dv_address
CREATE TABLE dv_address (
	address_id integer,
	address varchar(50),
	address2 varchar(50),
	district varchar(50),
	city_id integer,
	postal_code varchar(50),
	phone varchar(50)
);

-- Creates type mpaa_rating for use in table dv_film
CREATE TYPE mpaa_rating AS ENUM (
	'G',
	'PG',
	'PG-13',
	'R',
	'NC-17'
);

-- Creates table dv_film
CREATE TABLE dv_film (
	film_id integer,
	title varchar(50),
	description TEXT,
	length smallint,
	rating mpaa_rating
);

-- Creates table db_customers
CREATE TABLE cb_customers (
	last_name varchar(50),
	first_name varchar(50)
);

-- Creates table cb_books
CREATE TABLE cb_books (
	title varchar(50),
	author_id integer
);

-- Creates table cb_authors
CREATE TABLE cb_authors (
	author_id integer,
	first_name varchar(50),
	last_name varchar(50)
);

-- Creates table mg_customers
CREATE TABLE mg_customers (
	customer_id integer,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	address_id integer,
	active boolean
);