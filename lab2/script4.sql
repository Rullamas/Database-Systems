-- Selects first and last names of customers of both Downtown Video and City Books
SELECT dvd.first_name, dvd.last_name
FROM cb_customers cbc, dv_customer dvd
WHERE cbc.first_name = dvd.first_name AND cbc.last_name = dvd.last_name;

-- Selects phone numbers of customers of both Downtown Video and City Books
SELECT dva.phone
FROM dv_address dva, dv_customer dvc, cb_customers cbc
WHERE dvc.first_name = cbc.first_name AND cbc.last_name = dvc.last_name AND dvc.address_id = dva.address_id;

-- Selects first and last names of customers living in district with most customers	
SELECT mgc.first_name, mgc.last_name
FROM mg_customers mgc, dv_address dva
WHERE mgc.address_id = dva.address_id AND dva.district = (SELECT dva.district
														FROM dv_address dva, mg_customers mgc
														WHERE dva.address_id = mgc.address_id
														GROUP BY dva.district
														ORDER BY COUNT(mgc.customer_id) DESC
														LIMIT 1);

-- 	Selects least popular rating of film and any film with that rating
SELECT dvf.rating, count(dvf.film_id)
FROM dv_film dvf
GROUP BY dvf.rating
ORDER BY COUNT(dvf.rating) ASC
LIMIT 1;

-- Selects first and last names of top 10 authors ranked by number of books written
SELECT first_name, last_name
FROM (SELECT cba.first_name, cba.last_name, COUNT(cbb.title) as bookcount
	  FROM cb_authors cba, cb_books cbb
	  WHERE cba.author_id = cbb.author_id
	  GROUP BY cba.first_name, cba.last_name) counting
GROUP BY first_name, last_name, bookcount
ORDER BY bookcount DESC
LIMIT 10;