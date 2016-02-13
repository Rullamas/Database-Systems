-- Checks to see if the length of a film is positive
ALTER TABLE dv_film
ADD CONSTRAINT positive_length CHECK (length>0);

-- Updates all NULL address_id records in mg_customers
UPDATE mg_customers
SET address_id = 1
WHERE address_id IS NULL;

-- Checks to see if there is an empty foreign key in the address table
ALTER TABLE dv_address
ADD CONSTRAINT nulladdress CHECK (address_id IS NOT NULL);

-- Checks to see if there is an empty address field in the address table
ALTER TABLE dv_address
ADD CONSTRAINT emptyaddress CHECK (address IS NOT NULL);