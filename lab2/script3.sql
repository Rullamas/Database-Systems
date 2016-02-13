DROP SEQUENCE mg_customers_seq;

-- Inserts information from dv_customer table into mg_customers
INSERT INTO mg_customers(customer_id, first_name, last_name, email, address_id, active)
SELECT dv_customer.customer_id, dv_customer.first_name, dv_customer.last_name, dv_customer.email, dv_customer.address_id, dv_customer.active
FROM dv_customer;

-- Creates a sequence for mg_customers
CREATE SEQUENCE mg_customers_seq START 600;

-- Generates new IDs values
ALTER TABLE mg_customers
ALTER COLUMN customer_id
SET DEFAULT NEXTVAL('mg_customers_seq');

-- Inserts information from cb_customers table into mg_customers
-- excluding any data already present from dv_customer
INSERT INTO mg_customers(first_name, last_name)
SELECT cb_customers.first_name, cb_customers.last_name
FROM cb_customers

EXCEPT

SELECT first_name, last_name
FROM dv_customer