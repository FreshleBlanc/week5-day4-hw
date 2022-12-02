-- find every payment above the average payment amount
select avg(amount)
from payment ;


select *
from payment 
where amount > 4.2006056453822965


select *
from payment 
where amount > (
	select avg(amount)
	from payment
)


---- write a subquery to find all of the films
-- that have a language of english



select language_id
from "language" 
where "name" = 'English'

select *
from film
where language_id  = (
	select language_id 
	from	"language" 
	where "name" = 'English'
)

--- find all the films with an actor
-- with the last name Allen


select *
from actor a 
where last_name = 'Allen'



select *
from film_actor fa 
where actor_id in (
	select actor_id 
	from actor a 
	where last_name = 'Allen'
)



select film_id 
from film_actor fa 
where actor_id in (
	select actor_id 
	from actor a 
	where last_name = 'Allen'
)


select title
from film f 
where film_id in (
	select film_id 
	from film_actor fa 
	where actor_id in (
		select actor_id 
		from actor a 
		where last_name = 'Allen'
)


-- use subquery to find all of the countries with an above average count
-- of drama movie rentals 


SELECT country.country, COUNT(country.country)
FROM category
JOIN film_category
ON film_category.category_id = category.category_id
JOIN film
ON film.film_id = film_category.film_id 
JOIN inventory
ON inventory.film_id = film.film_id
JOIN rental
ON rental.inventory_id = inventory.inventory_id
JOIN customer
ON customer.customer_id = rental.customer_id 
JOIN address
ON customer.address_id = address.address_id 
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE category."name" = 'Drama' AND release_year = 2006
GROUP BY country.country
HAVING count(*) > (
	SELECT AVG(count)
	FROM (
		SELECT country.country, COUNT(country.country)
		FROM category
		JOIN film_category
		ON film_category.category_id = category.category_id
		JOIN film
		ON film.film_id = film_category.film_id 
		JOIN inventory
		ON inventory.film_id = film.film_id
		JOIN rental
		ON rental.inventory_id = inventory.inventory_id
		JOIN customer
		ON customer.customer_id = rental.customer_id 
		JOIN address
		ON customer.address_id = address.address_id 
		JOIN city
		ON address.city_id = city.city_id
		JOIN country
		ON city.country_id = country.country_id
		WHERE category."name" = 'Drama' AND release_year = 2006
		GROUP BY country.country
	) AS drama_country_rentals
);

CREATE VIEW drama_country_rentals
AS
	SELECT country.country, COUNT(country.country)
	FROM category
	JOIN film_category
	ON film_category.category_id = category.category_id
	JOIN film
	ON film.film_id = film_category.film_id 
	JOIN inventory
	ON inventory.film_id = film.film_id
	JOIN rental
	ON rental.inventory_id = inventory.inventory_id
	JOIN customer
	ON customer.customer_id = rental.customer_id 
	JOIN address
	ON customer.address_id = address.address_id 
	JOIN city
	ON address.city_id = city.city_id
	JOIN country
	ON city.country_id = country.country_id
	WHERE category."name" = 'Drama' AND release_year = 2006
	GROUP BY country.country;


SELECT DISTINCT title, description
FROM film
WHERE film_id IN (
	SELECT film_id
	FROM film_actor
	WHERE actor_id IN (
		SELECT actor_id
		FROM actor
		WHERE last_name = 'Allen'
	)
);


create or replace function filmsWithActor(_last_name var char)
returns table (
	title varchar,
	description varchar
)
language plpgsql as $$
begin
	return query(
	SELECT DISTINCT title, description
		FROM film
		WHERE film_id IN (
			SELECT film_id
			FROM film_actor
			WHERE actor_id IN (
				SELECT actor_id
				FROM actor
				WHERE last_name = last_name
	)
end;
$$





