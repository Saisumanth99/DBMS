select film.title from rental inner join inventory on rental.inventory_id = inventory.inventory_id
inner join film on inventory.film_id = film.film_id
inner join customer on rental.customer_id = customer.customer_id
where customer.first_name = "PATRICIA" and customer.last_name = "JOHNSON"
group by film.film_id order by count(film.film_id) desc limit 3;