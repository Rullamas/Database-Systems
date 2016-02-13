-- Creates customer_city view containing first name, last name, and city_id
CREATE VIEW customer_city AS
SELECT dvc.first_name, dvc.last_name, dva.city_id
FROM cb_customers cbc, dv_customer dvc, dv_address dva
WHERE cbc.first_name = dvc.first_name AND cbc.last_name = dvc.last_name
	AND dvc.address_id = dva.address_id;

-- Creates district_stats view containing district and number of customers
CREATE VIEW district_stats AS
SELECT dva.district AS district, COUNT(dvc.customer_id) AS count
FROM dv_address dva, dv_customer dvc
WHERE dva.address_id = dvc.address_id
GROUP BY district
ORDER BY COUNT(dvc.customer_id) ASC;

-- Finds the district with the least number of customers
SELECT ds.district
FROM district_stats ds
GROUP BY ds.district, ds.count
ORDER BY ds.count ASC
LIMIT 5;

-- ALters the name of the customer_city view to customer_cities
ALTER VIEW customer_city RENAME TO customer_cities;