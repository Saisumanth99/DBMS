select count(film.film_id) from film_actor inner join film on film_actor.film_id = film.film_id where film_actor.actor_id = (select actor_id from actor where first_name = "SEAN" and last_name="WILLIAMS");