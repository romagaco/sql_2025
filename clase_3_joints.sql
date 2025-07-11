/* inner join */ 
/* devuekve registros que se encuentren en ambas tablas*/

/* left join */
/* prioriza la tabla izquierda */ 

/* right join */
/* prioriza la tabla derecha */ 

/* cross join */
/* combina todas las tablas */ 

select 
c.name as category,
count(r.rental_id) as rentas_totales, 
SUM(p.amount) as total_generado,
avg(p.amount) as total_gen_por_renta
from category c inner join 
	film_category fc on c.category_id = fc.category_id
    inner join 
    film f on fc.film_id = f.filmid;