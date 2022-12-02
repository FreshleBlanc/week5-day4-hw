--  find the name of products in the carts with cart_id 1
select *
from cart_item ci 
where cart_id = 1


select "name"
from	product p 
where product_id = 1 or product_id = 2

select *
from cart_item   --- table A 
join product    --- table b 
on cart_item.product_id = product.product_id 
where cart_id = 1




-- add a new cart item for testing
-- add new product item for testin
insert into cart (customer_id)
values (2);

insert into cart_item (cart_id, product_id, quantity)
values (2, 2, 1);

insert into product ("name", description, price)
values 
('jeans', 'really blue', 39.99)


-- find the name of the product and customer name for every cart item
select *
from product
join cart_item
on cart_item.product_id = product.product_id 
join cart 
on cart_item.cart_id = cart.cart_id 
join customer 
on customer.customer_id = cart.customer_id 



-- use subquery to find all of the countries with an above average count
-- of drama movie rentals 


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
) AS drama_country_rentals;











