-- Tries to violate foreign key constraint in dv_address
DELETE FROM dv_address WHERE address_id > 1;

-- Tries to violate foreign key constraint in cb_authors
DELETE FROM cb_authors WHERE author_id = 1;

-- Properly fits constraint in dv_film
INSERT INTO dv_film
VALUES (15000, 'UCSC', 'A movie', 5, 'G');

-- Tries to violate constraint in dv_film
INSERT INTO dv_film
VALUES (15000, 'UCSC', 'A movie', -2, 'G');

-- Properly fits constraint in dv_address
INSERT INTO dv_address
VALUES (20000, '628 Crown Road', 'Apartment 1', 'Santa Cruz', 256, '94506', '9255551234');

-- Tries to violate constraint in dv_address
INSERT INTO dv_address
VALUES (NULL, '628 Crown Road', 'Apartment 1', 'Santa Cruz', 256, '94506', '9255551234');

-- Properly fits constraint in dv_address
INSERT INTO dv_address
VALUES (20001, '628 Crown Road', 'Apartment 1', 'Santa Cruz', 256, '94506', '9255551234');

-- Tries to violate constraint in dv_address
INSERT INTO dv_address
VALUES (2000000, NULL, 'Apartment 1', 'Santa Cruz', 256, '94506', '9255551234');