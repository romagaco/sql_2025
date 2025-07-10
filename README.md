# MySQL Project 2025

## Overview
Repasamos las funcionalidades de sql y las actualizaciones 2025 

## Ejemplos del contenido del repositorio
- Uso de select + where: select first_name, last_name from sakila.customer where active = 0;
- Uso de insert: Insert into Estudiantes  (Codigo, Nombre, Edad, Fecha_matricula) values (1, "Juan", 23, "2024-01-25");
- Añadiendo columnas: alter table proveedores add Fecha_mod date;
- funciones complejas: create function calcula_iva(p_codigo int)
returns decimal reads sql data
begin
	declare precio_total decimal;
		select precio + (precio*0.21) into precio_total 
			from cursos where cod_curso = p_codigo;
    return precio_total;
end//

## Prerequisites
Before you begin, ensure you have the following installed:
- MySQL version, 8.0 or higher

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/romagaco/My_SQL/