-- Copies data from data files into tables created
-- in script1.sql
\copy dv_customer FROM '~/cmps180/lab2/dv_customer.data'
\copy dv_address FROM '~/cmps180/lab2/dv_address.data'
\copy dv_film FROM '~/cmps180/lab2/dv_film.data'
\copy cb_customers FROM '~/cmps180/lab2/cb_customers.data'
\copy cb_books FROM '~/cmps180/lab2/cb_books.data'
\copy cb_authors FROM '~/cmps180/lab2/cb_authors.data'