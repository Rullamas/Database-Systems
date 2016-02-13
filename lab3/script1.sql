-- Adds customer_id as a primary key to mg_customers
ALTER TABLE mg_customers
ADD PRIMARY KEY (customer_id);

-- Adds address_id as a primary key to dv_address
ALTER TABLE dv_address
ADD PRIMARY KEY (address_id);

-- Adds film_id as a primary key to dv_film
ALTER TABLE dv_film
ADD PRIMARY KEY (film_id);

-- Adds title and author_id as a primary key to cb_books
ALTER TABLE cb_books
ADD PRIMARY KEY (title, author_id);

-- Adds author_id as a primary key to cb_authors
ALTER TABLE cb_authors
ADD PRIMARY KEY (author_id);