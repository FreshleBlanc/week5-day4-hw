---1.)
select *
from customer  --- table A 
join address    --- table b 
on customer.address_id = address.address_id 
where district = 'Texas'

--- 2.)

select first_name , last_name , amount
from customer  --- table A 
join payment    --- table b 
on customer.customer_id = payment.customer_id 
where amount > 6.99

--3.)
select first_name, last_name 
from customer
where customer_id in (
	select customer_id 
	from payment
	group by customer_id 
	having sum(amount) > 175
)

select first_name, last_name 
from customer
where customer_id in (
	select customer_id 
	from payment
	group by customer_id 
	having sum(amount) > 175
)

join payment 
on customer.customer_id = payment.customer_id 
having sum(amount)	>(
	select sum(amount) = 175
		from customer 
		join payment 
		on customer.customer_id = payment.customer_id 
	) as total_amount_175+
);

--4.)
select first_name, last_name, country
from customer  --- table A 
join address    --- table b 
on customer.address_id = address.address_id 
join city --table c
on address.city_id = city.city_id 
join country  
on country.country_id = city.country_id 
where country = 'Nepal'


--5.)
select *
from staff  
join payment 
on staff.staff_id = payment.staff_id 
having max(payment_id)	
	select sum(payment_id)
		from staff  
		join payment 
		on staff.staff_id = payment.staff_id 
	) as total_transactions
);

select count(payment.staff_id), staff.first_name, staff.last_name 
from payment
join staff
on payment.staff_id = staff.staff_id 
group by staff.first_name, staff.last_name 





--6.)
	
select rating, count(title)
from film 
group by rating 


--7.)

select first_name , last_name , amount
from customer  --- table A 
join payment    --- table b 
on customer.customer_id = payment.customer_id 
where (
	select amount > 6.99
	from payment 
) as amount_more_6.99


select first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment 
	where amount > 6.99
)

select *
from payment 
where amount > (
	select avg(amount)
	from payment

	
--8.)
select	count(amount) 
from payment 
join rental 
on payment.rental_id = rental.rental_id
where amount = 0

select	* 
from payment 
join rental 
on payment.rental_id = rental.rental_id
where amount = 0



select *
from payment
where amount = 0
select payment.amount, film.title 
from payment
join rental 
on payment.rental_id = rental.rental_id 
join inventory
on rental.inventory_id = inventory.inventory_id 
join film 
on inventory.film_id = film.film_id 
where payment.amount = 0


	
	
	
	
	
	



