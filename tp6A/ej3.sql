-- Listar título, autor y precio de los libros infantiles.
SELECT titulo, autor, precio FROM LIBRO WHERE genero = 'Infantil'


-- Listar los pares título y nombre de la editorial de los libros que cuestan menos que $27.5
SELECT L.titulo, E.nombre
FROM LIBRO L
JOIN EDITORIAL E
ON L.codEdit = E.codEdit
WHERE L.precio < 27.5

-- Listar los títulos de libros alfabéticamente
SELECT titulo from LIBRO ORDER BY titulo

-- Listar los títulos y nombres de las editoriales de los libros publicados por editoriales canadienses.
SELECT L.titulo, E.nombre
FROM LIBRO L
JOIN EDITORIAL E
ON L.codEdit = E.codEdit
WHERE E.pais = 'Canada'

-- Listar el ISBN y títulos de los libros que tiene precio mayor a $50 y fueron vendidos
SELECT DISTINCT L.ISBN, L.titulo
FROM LIBRO L 
JOIN DETALLE_FACTURA D
ON L.ISBN = D.ISBN 
WHERE L.precio > 50

-- Listar los nombres de editoriales estadounidenses que trabajaron en el género computación
SELECT DISTINCT E.nombre 
FROM EDITORIAL E
JOIN LIBRO L
ON E.codEdit = L.codEdit
WHERE L.genero = 'Computacion'AND E.pais = 'USA'

-- Listar ordenados, los nombres de los libros que se facturaron entre el 01/09/2015 y el 10/09/2015 inclusive. Cada título debe aparecer una única vez.
SELECT DISTINCT L.titulo
FROM LIBRO L
JOIN DETALLE_FACTURA D
ON D.ISBN = L.ISBN
JOIN FACTURA F
ON F.codFact = D.codFact
WHERE F.fecha BETWEEN DATE '2015-09-01' AND DATE '2015-09-10'
ORDER BY L.titulo
