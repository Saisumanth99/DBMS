select count(rental_id) from rental inner join inventory on rental.inventory_id = inventory.inventory_id
inner join film_list on inventory.film_id = film_list.FID
inner join customer_list on rental.customer_id = customer_list.ID
where customer_list.name = "SUSAN WILSON" and film_list.rating = "R";