use sakila;

-- Question 1: 
-- Retrieve the total number of rentals made in the Sakila database. 
SELECT  COUNT(rental_id) FROM rental;

-- Question 2: 
-- Find the average rental duration (in days) of movies rented from the Sakila database.
SELECT AVG(rental_duration)  from film;

-- Question 3: 
-- Display the first name and last name of customers in uppercase.
SELECT upper(first_name),upper(last_name) from customer ;

-- Question 4: 
-- Extract the month from the rental date and display it alongside the rental ID
select rental_id, month(rental_date) from rental;

-- Question 5: 
-- Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
select count(rental_id),customer_id from rental group by customer_id;

-- Question 6: 
-- Find the total revenue generated by each store. 
select sum(p.amount) AS total_revenue, s.store_id, st.staff_id
from store s 
join staff st on s.store_id = st.staff_id
join payment p on st.staff_id = p.staff_id
group by s.store_id;

-- Question 7: 
-- Display the title of the movie, customer s first name, and last name who rented it. 
select f.title, c.first_name,  c.last_name
from film f
join inventory i on i.film_id=f.film_id
join rental r on r.inventory_id=i.inventory_id
join customer c on c.customer_id= r.customer_id;

-- Question 8: 
-- Retrieve the names of all actors who have appeared in the film "Gone with the Wind." 
select a.first_name, a.last_name
from actor a
join film_actor fa on fa.actor_id=a.actor_id
join film f on f.film_id=fa.film_id
where f.title = 'Gone with the Wind';

-- Question 9: 
-- Determine the total number of rentals for each category of movies. 
SELECT fc.category_id, COUNT(r.rental_id) AS rental_count
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
GROUP BY fc.category_id;

-- Question 10: 
-- Find the average rental rate of movies in each language. 
SELECT la.name, avg(f.rental_rate) AS avg_of_rental_rate
FROM film f
RIGHT JOIN language la ON f.language_id = la.language_id
GROUP BY la.name;

-- Question 11: 
-- Retrieve the customer names along with the total amount they've spent on rentals. 
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_amount_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id;

-- Question 12: 
-- List the titles of movies rented by each customer in a particular city (e.g., 'London'). 
SELECT c.first_name, c.last_name, f.title AS rented_movie_title
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE ci.city = 'London'
ORDER BY c.first_name, c.last_name, f.title;

-- Question 13: 
-- Display the top 5 rented movies along with the number of times they've been rented. 
SELECT f.title AS movie_title, COUNT(*) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 5;

-- Question 14: 
-- Determine the customers who have rented movies from both stores (store ID 1 and store ID 2). 
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN store s ON i.store_id = s.store_id
WHERE s.store_id IN (1, 2)
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(*)>1;

