--Hello World SQL Query, SELECT all records FROM actor table
SELECT *
FROM actor;



-- Query for first_name and last_name in the actor table
 SELECT first_name, last_name
 FROM actor;
 
 
-- Query for first_name that equals Nick using the WHERE clause
-- using LIKE and WHERE  (WHERE first_name = 'Nick';)
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Query for all first_name that starts with J using LIKE WHERE and (WILDCARD = %)
SELECT first_name,actor_id
FROM actor
WHERE first_name LIKE 'J%';

-- Query for all first_name data that starts with K and has 2 letters after it using LIKE
-- WHERE and the underscore__
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'K___';

-- Query for all first_name data that starts with 'K' and ends with 'th'
-- using LIKE WHERE %(wildcard) and underscore
SELECT first_name,last_name,actor_id
FROM actor
WHERE first_name LIKE 'K__%th';



-- Comparing Operators:
-----------------------
-- Greater Than (>) Less Than (<)
-- Greater or Equal (>=) Less or Equal (<=)
--Not Equal (<>)

-- Explore the Payment Table
SELECT *
FROM payment;

-- Query for the data that shows who paid an amount
-- GREATER than $2
SELECT payment_id,customer_id, amount
FROM payment
WHERE amount > 2.00;

-- Query for data showing who paid less than 7.99
SELECT customer_id, amount
FROM payment
WHERE amount < 7.99;

-- Query for data showing who paid less or equal than 7.99
SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99;

-- Query for data showing who paid greater or equal to $2
-- in Ascending ORDER-- ORDER by default to Ascending(ASC)--Descending (DESC)
SELECT customer_id, amount
FROM payment
WHERE amount >= 2.00
ORDER BY amount ASC;

-- Query for data showing who paid
-- an amount BETWEEN $2 and $8
-- using BETWEEN & AND
SELECT customer_id,amount
FROM payment
WHERE amount BETWEEN 2.00 AND 8.00
ORDER BY amount ASC;

-- Query for data showing who paid an amount not equal to $0.00
--ORDER BY desending order
SELECT customer_id, amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount DESC;


--EXPLORE OTHER TABLES, AND COME BACK TO TELL US SOMETHING ABOUT THEM.
SELECT picture
FROM staff;

-- working with film title
SELECT film_id, title
FROM film
WHERE title LIKE 'N%';
-- replacement cost
SELECT replacement_cost,title
FROM film
WHERE title LIKE 'E%';

SELECT title,description
FROM film;

SELECT *
FROM public.language;

-- SQL Aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()

-- Query that displays the sum of amountd payed that are greater than 5.99
SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;
-- Display average amountd of the same
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

-- Display count of the same
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;
-- Display distinct count of amount
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;
-- Display the min amount that is greater than 7.99
SELECT MIN(amount) AS min_num_payments
FROM payment
WHERE amount > 7.99;

-- GROUP BY is great with agregate functions

--payments that are 7.99
SELECT amount, COUNT(amount)
FROM payment
WHERE amount = 7.99
GROUP BY amount;

--How much did each customer pay in total? (sum amount)
SELECT customer_id, SUM(amount) AS customer_total
FROM payment
GROUP BY customer_id
ORDER BY customer_total DESC;

-- Group By customer_id and amount
SELECT customer_id,COUNT(amount) AS num_payments
FROM payment
GROUP BY customer_id
ORDER BY customer_id;

--Check out the customer table
SELECT * 
FROM customer;

-- Count the customers with "J" starting emails
SELECT COUNT(customer_id), email
FROM customer
WHERE email LIKE 'j%'
GROUP BY email
HAVING COUNT(customer_id) > 0;