# Consultas ---------------------
use libros_db;


#libros disponibles (titulo, autor, año)
select titulo, autor, año from libros 
where disponibilidad = true 
order by año desc;

#ver quien tiene libro prestado
select
u.nombre as usuario,
l.titulo as libro,
p.fecha_prestamo as "fecha de prestamo",
datediff(current_date, p.fecha_prestamo) as "dias prestado"
from prestamos p 
join libros l on p.libro_id = l.id
join usuarios u on p-usuario_id = u.id
where p.fecha_devolucion is null;

select * from prestamos;


# idices -------------------
create index idx_ñibros_titulos on libros(titulo);

create index isx_prestamos_usuari on prestamos(usuario_id);







