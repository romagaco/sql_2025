use world;

select name, Continent from country where code in(
	select distinct countryCode from city where Population > 5000000
);

/* usando exist */ 
select language, CountryCode from countrylanguage as cl1 where not exists(
	select 1 from countrylanguage as cl2 where cl2.Language = cl1.Language 
    and cl2.CountryCode !=cl1.CountryCode
);

/* tipo escalar */
select ci. Name as Cityname,
ci.Population as citypopulation,
co.Name as countryName,
co.population as countryPopulation,
	round((ci.population *100.0) / (select Population from country where code = ci.CountryCode), 2)
    as percentageOfCountry from city ci join 
    country co on ci.CountryCode = co.code ;






