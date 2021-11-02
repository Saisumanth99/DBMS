select title from rental join inventory on rental.inventory_id = inventory.inventory_id
inner join film on inventory.film_id = film.film_id
inner join film_category on film.film_id = film_category.film_id and film_category.category_id = (select category_id from category where name="Horror") group by film.title order by count(film.title) desc limit 3;