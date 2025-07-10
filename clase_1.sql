USE Sakila;
select * from film;
select COUNT(*) as total_peliculas from film;

select count(*) as peliculas_costosas from film
	where replacement_cost >20;

select count(distinct rating) as tipos_rating from film;

select SUM(replacement_cost) as costo_reemplazo from film;

select SUM(rental_duration) as dias_renta_pg from film 
	where rating="PG";
    
select AVG(length) as duracion_promedio_NC17 from film 
	where rating="NC-17";
    
select rating, avg(rental_rate) as tarifa_promedio 
	from film group by rating;
    
select MIN(length) as pelicula_minima_duracion, 
	MAX(length) as pelicula_maxima_duracion from film;

select rating, MIN(replacement_cost) as minimo_costo, MAX(replacement_cost) as maximo_costo 
	from film group by rating;


select reale_year, count(*)  as total from film group by release_year;
    
