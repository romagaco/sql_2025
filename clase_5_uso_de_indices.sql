use sakila;

/* Index B-tree  */ 
# peliculas por año 

# Btree index
create index idx_film_year_lenght on film(release_year, length);

# consulta
# peñicñas de ñps 2006 con duracion > 120mits
select title, release_year, length 
from film where release_year = 2006 
and length between 120 and 180;

/* 2 index tiopo HASh */ 
create index id_customer on customer (email);
/* dada a la version de mysql no podemos usnar el hash pero btree nos sirve para la comparacion */
# busqueda por email espesicico 
# consulta de login 

explain analyze
select * from customer where email = "kathleen.adams@sakilacustomer.com";
/* previo a la  creacion del indice el resultado en time era de 12.01*/
/* luego del indice el resultado en time es de 0.431 */


/* INDEX  full text */
create fulltext index film_desc_on on film(description);

/* busqueda avanzada | drama - amor - sin muerte */
/* explain analyze  */
select title, description from film where match (description) 
against ("+drama -boring" in boolean mode);

/* el signo +  se utiliza para indicar que queremos que la palabra si se contenga */ 

/* el signo - se utiliza para indicar que queremos que la palabra no se contenga */ 


/* obtener las ventas activas ordenadas por fecha usando indices */
create index id_rental_cx_retal on rental(customer_id, return_date);


explain analyze
select rental_id, rental_date, inventory_id from rental where customer_id = 461
	and return_date is NULL 
    order by rental_date desc;


/* previo a la  creacion del indice el resultado en time era de 0.3776*/
/* luego del indice el resultado en time es de 0.028 */



