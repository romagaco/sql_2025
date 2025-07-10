/* Tablas cruzadas */
use sakila;
select  rating, special_features, count(*) as total_peliculas,
	avg(length) as duracion_promedio, SUM(replacement_cost) 
    as costo_total from film group by rating, special_features
    order by rating, total_peliculas desc;


select 
case when
	replacement_cost < 15 then "Bajo"
    when replacement_cost between 15 and 20 then "Medio"
    else "Alto"
end as segmento_costo,

count(*) as cantidad,
	avg(rental_rate) as tarifa_promedio,
    avg(length) as duracion_promedio
from film
group by segmento_costo
order by cantidad desc;

select title, length from film where length > (
	select avg(length) from film
)
order by length desc;

select rating, avg(rental_rate) as tarifa_promedio,
(select avg(rental_rate) from film) as tarifa_global,
avg(rental_rate) - (select avg (rental_rate) from film) as diferencia
from film
group by rating
order by diferencia desc;

/*  reportes  */ 
/* se unen todos los titulos sin limite */
select rating, group_concat(
title separator " | "
) as muestra_titulos,
count(*) as total_peliculas
from film group by rating
order by total_peliculas Desc;

/* se unen todos los titulos con  limite */
select rating, substring_index(group_concat(
title separator " | "
), "|", 5) as muestra_titulos,
count(*) as total_peliculas
from film group by rating
order by total_peliculas Desc;


select ifnull(rating , "TOTAL") as rating,
ifnull(release_year, "SUBTOTAL") as año,
count(*) as total, 
avg(length) as duracion_promedio
from film
group by rating, release_year with rollup;



