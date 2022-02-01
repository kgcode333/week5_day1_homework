--COUNT(),SUM(),MAX(),MIN(),AVG()
-- Greater Than (>) Less Than (<)
-- Greater or Equal (>=) Less or Equal (<=)
--Not Equal (<>)


--Kims week5_day1 homework
-- Ques(1):"How many actors w/ last name Wahlberg?"
--Answer:2
SELECT last_name
FROM actor
WHERE last_name LIKE 'Wahlberg';
---------------------------------

--Ques(2):"How many payments were made between $3.99 and $5.99"
--Answer:3431 payments that are between $3.99 and $5.99 not including
--Alternate Answer:5607 payments that are >= $3.99 and <= $5.99(inclusive)
SELECT COUNT(amount)
FROM payment
WHERE amount > 3.99 AND amount < 5.99;
---------------------------------------

--Ques(3):"What film does the store have the most of in inventory?"
--Answer:(SlingLuke)193,789,730,378,595,849,231,586,69,764,745,7,767,369
SELECT title, film_id
FROM film
ORDER BY film_id DESC;

SELECT film_id, COUNT(inventory_id) AS inventory_id
FROM inventory
GROUP BY film_id
ORDER BY inventory_id DESC;
--------------------

--Ques(4):"How many customers have the last name William?"
--Answer: 'William(0)'----'Williams(1)'
SELECT last_name
FROM customer
WHERE last_name LIKE 'Williams';
--------------------------------

--Ques(5):"What store employee sold the most rentals(id of emp)?"
--Answer:staff_id_1 sold 8040-Mike Hillyer
SELECT staff_id, first_name,last_name
FROM staff;


SELECT COUNT(rental_id), staff_id
FROM rental
GROUP BY staff_id;
-----------------------------------------------

--Ques(6):"How many different district names are there?"
--Answer:378 or 377 one line is blank
SELECT district, COUNT(district)
FROM address
GROUP BY district
ORDER BY district ASC;
-----------------------

--Ques(7):"What film has the most actors in it?"
--Answer:508-Kane Exorcist
SELECT title, COUNT(film_id)
FROM film
GROUP BY title
HAVING COUNT(film_id)<509
ORDER BY title DESC;

SELECT film_id, COUNT(actor_id) AS actors
FROM film_actor
GROUP BY film_id
ORDER BY actors DESC;
-----------------------

--Ques(8):"From store id 1, how many customers have the lastname ending in es?"
--Answer:13
SELECT  store_id, last_name
FROM customer
WHERE last_name LIKE '%es';
----------------------------
--Ques(9):"How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)"
--Answer:
SELECT
-----------------------------------------------------------------------------------------------------------
--Ques(10):"Within the film table, how many rating categories are there? And what rating has the most movies total?"
--Answer:G=178, PG=194, PG-13=223, R=195, NC-17=210
SELECT rating, COUNT(DISTINCT title) AS title
FROM film
GROUP BY rating;


