# Proyecto: sistema Biblioteca

# 1. creacion de TABLAS -------------
create database libros_db;
use libros_db;
create table libros (
	id int auto_increment primary key, # identificador unico
    titulo varchar(100) not null,
    autor varchar(100) not null,
    año int check(año > 1800),  # validacion basica
    disponibilidad boolean default true
);

create table usuarios (
	id int auto_increment primary key,
    nombre varchar(100) not null,
    email varchar(100) unique
);

# relacionamos las tablas entre si 
create table prestamos (
	id int auto_increment primary key,
    libro_id int,
    usuario_id int,
    fecha_prestamo date default (current_date),
    fecha_devolucion date,
    foreign key (libro_id) references libros(id),
    foreign key (usuario_id) references usuarios(id)
);

# 2. poblado de DATOS -----------------
insert into libros (titulo, autor, año) values 
("Cien años de soledad ", "Gabriel Garcia Marquez", 1967),
("1964 ", "Jorge Orwell", 1949),
("El principito ", "Antonie de saint exupery", 1943),
("Harry Potter y la piedra filosofal ", "J.K Rowling", 1997),
("La sombra del viento ", "Carlos Ruiz Zafon", 2001),
("To Kill a Mockingbird ", "Harper Lee", 1960),
("Pride and Prejudice ", "Jane Austen", 1813),
("The Great Gatsby ", "F. Scott Fitzgerald", 1925),
("The Catcher in the Rye", "J.D. Salinger", 1951),
("The Hobbit ", "J.R.R. Tolkien", 1937),
("The Alchemist", "Paulo Coelho", 1988);

insert into usuarios (nombre, email) values
("ana mendoza", "ana@base.com"),
("Maximo Corona", "maximo@base.com"),
("julio berne", "julio@base.com"),
("saul perez", "saul@base.com"),
("robert whitaker", "robert@base.com"),
("islam makachev", "islam@base.com");

insert into prestamos(libro_id, usuario_id) values
	(1,1), # ana tiene el primer libro
    (2,3); # maximo tine el 3

update libros set disponibilidad = false where id in (1,3,6,7,8,9,10);

select * from prestamos;








