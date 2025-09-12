-- Encontrar el nombre de todos los estudiantes que se inscribieron en 2014 en alguna materia.

SELECT A.nombre from ALUMNO A
WHERE EXISTS (
	SELECT 1
  	FROM INSCRIPCION I
  	WHERE I.legajo = A.legajo
  	AND I.anio = 2014
)
ORDER BY A.nombre ASC

-- Encontrar los legajos de los alumnos que se anotaron alguna vez en por lo menos dos materias distintas. NO usar "count", hacerlo como en el álgebra o cálculo relacional.
SELECT DISTINCT A.legajo
FROM INSCRIPCION A
JOIN INSCRIPCION B
	ON A.legajo = B.legajo
    AND A.codigo <> B.codigo
ORDER BY A.legajo ASC


-- Listar los nombres de las materias en las que todavía no se anotó Patan, Pamela
SELECT C.nombre from CURSO C
WHERE NOT EXISTS(
	SELECT 1 
  FROM INSCRIPCION I
  NATURAL JOIN ALUMNO A
  WHERE A.nombre = 'Patan, Pamela'
  AND C.codigo = I.codigo
)


-- Mostrar los nombres de los alumnos que se anotaron en alguna materia de Programación, ordenados descendentemente
SELECT DISTINCT A.nombre from ALUMNO A
WHERE EXISTS (
	SELECT 1 
  	FROM INSCRIPCION I
  	NATURAL JOIN CURSO C
  	WHERE C.codigo = I.codigo
  	AND I.legajo = A.legajo
)
ORDER BY A.nombre DESC
