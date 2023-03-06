SELECT country_of_birth, count(*) FROM person GROUP BY country_of_birth;

SELECT country_of_birth, count(1) FROM person 
    GROUP BY country_of_birth HAVING COUNT(1) > 5 ORDER BY country_of_birth;

SELECT * from car GROUP BY model;

SELECT reltuples::bigint AS EstimatedCount
FROM   pg_class
WHERE  oid = 'public.car'::regclass;

SELECT id, make, model, price, ROUND(price * .10, 2), ROUND(price - (price * .10), 2) FROM car
    GROUP BY id, make, model, price;

SELECT id, make, model, price AS original_price, 
    ROUND(price * .10, 2) AS ten_percent,  
    ROUND(price - (price * .10), 2) AS discount_after_10_percent 
    FROM car GROUP BY id, make, model, price;

SELECT COALESCE(email, 'email not provided') FROM person;

-- INNER JOINS gives rows with car.id
SELECT * FROM person
    JOIN car ON person.car_id = car.id;

-- LEFT JOINS gives all rows despit of car.id being null
SELECT * FROM person
    LEFT JOIN car ON car.id = person.car_id; 