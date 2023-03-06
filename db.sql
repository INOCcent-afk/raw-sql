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

CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE car (
    id SERIAL PRIMARY KEY,
    person_id INTEGER NOT NULL,
    plate_number VARCHAR(255) NOT NULL,

    FOREIGN KEY (person_id) REFERENCES person (id)
);

CREATE TABLE carcolor (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE carcolorrelation (
    car_id INTEGER NOT NULL,
    carcolor_id INTEGER NOT NULL,

    FOREIGN KEY (carcolor_id) REFERENCES carcolor(id),
    FOREIGN KEY (car_id) REFERENCES car(id)
);

-- INNER JOINS gives rows with car.id
SELECT * FROM person JOIN car ON person.car_id = car.id;

-- LEFT JOINS gives all rows despit of car.id being null
SELECT * FROM person LEFT JOIN car ON car.id = person.car_id; 

insert into person (name) values ('eparfrey0');
insert into person (name) values ('sreicharz1');
insert into person (name) values ('rhague2');
insert into person (name) values ('tswendell3');
insert into person (name) values ('tgrigori4');
insert into person (name) values ('bvanderkruijs5');
insert into person (name) values ('lchimenti6');
insert into person (name) values ('eroskell7');
insert into person (name) values ('emunro8');
insert into person (name) values ('crennebach9');

insert into car (plate_number, person_id) values ('123', 1);
insert into car (plate_number, person_id) values ('NC 123', 1);
insert into car (plate_number, person_id) values ('AB 123', 1);
insert into car (plate_number, person_id) values ('AC 123', 1);
insert into car (plate_number, person_id) values ('AD 1234', 1);
insert into car (plate_number, person_id) values ('AE 123', 2);
insert into car (plate_number, person_id) values ('AF 1', 3);

insert into carcolor (name) values ('red');
insert into carcolor (name) values ('blue');
insert into carcolor (name) values ('green');

insert into carcolorrelation (car_id, carcolor_id) values (1, 1);
insert into carcolorrelation (car_id, carcolor_id) values (1, 2);
insert into carcolorrelation (car_id, carcolor_id) values (2, 1);
insert into carcolorrelation (car_id, carcolor_id) values (3, 1);
insert into carcolorrelation (car_id, carcolor_id) values (3, 3);
insert into carcolorrelation (car_id, carcolor_id) values (4, 1);
insert into carcolorrelation (car_id, carcolor_id) values (5, 1);
