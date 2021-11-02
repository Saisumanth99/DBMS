select first_name from rental join inventory on rental.inventory_id = inventory.inventory_id
inner join customer on customer.customer_id = rental.customer_id and
(rental.customer_id in (
	select customer_id from customer inner join address on customer.address_id = address.address_id 
    inner join city on address.city_id = city.city_id
    inner join country on city.country_id = country.country_id where country.country = "Canada"
    )
)
inner join film on inventory.film_id = film.film_id
inner join film_actor on film.film_id = film_actor.film_id and film_actor.actor_id = (select actor_id from actor where first_name="NICK" and last_name = "WAHLBERG") group by customer.customer_id;