-- Adds address_id as a foreign key to mg_customers
ALTER TABLE mg_customers
ADD FOREIGN KEY (address_id)
REFERENCES dv_address(address_id);

-- Adds author_id as a foreign key to cb_books
ALTER TABLE cb_books
ADD FOREIGN KEY (author_id)
REFERENCES cb_authors(author_id);