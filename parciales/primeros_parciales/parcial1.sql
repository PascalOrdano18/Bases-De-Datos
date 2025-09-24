--Listar los nombres de los autores que siempre han escrito libros sin compartir autoría (o sea siempre
--escribieron libros solos). Los nombres deben aparecer una sola vez en el listado. Asumir que no hay autores
--que están en la tabla AUTORES y no aparezcan en la tabla AUTORIA.


SELECT a.nombre
FROM AUTOR a
WHERE NOT EXISTS (
  SELECT 1
  FROM AUTORIA au2
  JOIN AUTORIA co
    ON co.ISBN = au2.ISBN
   AND co.autorID <> au2.autorID
  WHERE au2.autorID = a.autorID
);



SELECT legajo, 
