select count(rental_id) from rental inner join inventory on rental.inventory_id = inventory.inventory_id
inner join film on inventory.film_id = film.film_id
inner join film_category on film.film_id = film_category.film_id
where film_category.category_id = (select category_id from category where name = "Sci-Fi")
and
inventory.store_id = (select store_id from store where manager_staff_id = (select staff_id from staff where first_name="Jon" and last_name = "Stephens") );