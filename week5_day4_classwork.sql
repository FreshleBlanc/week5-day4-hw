-- Find the first and last names of all of the actors in the film 'Alice Fantasia'

-- Find the name of all of the films in the category: 'Animation'

-- Find 


select first_name, last_name
from film
join actor
on film_actor.film_id  = film.film_id  
join film_actor  
on actor.actor_id = film_actor.actor_id 
where title = 'Alice Fantasia';



select "name", film.title
from category 
join film_category
on film_category.category_id = category.category_id 
join film 
on film.film_id = film_category.film_id  
where "name" = 'Animation';






