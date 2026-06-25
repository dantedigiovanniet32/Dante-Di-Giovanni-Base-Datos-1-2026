# Dante-Di-Giovanni-Base-Datos-1-2026


En las consultas:
En el punto 4 el like quedo con comillas dobles y tenian que ser simples, por eso devuelve muchos valores que no van, la correccion seria: 

select nombre from objetos_misticos
where nombre like '%Espada%' or nombre like '%Anillo%';

En la conaulta 9 del documento quedo lo mismo que en la 10, la correccion:

select id_serie, avg(rating_audiencia) as promedio_rating from episodios
group by id_serie
having avg(rating_audiencia) > 7.5;
