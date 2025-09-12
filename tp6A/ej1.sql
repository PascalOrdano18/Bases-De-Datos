-- Listar los códigos de jugadores y fechas de penalizaciones que ocurrieron durante el año 2015 --
SELECT codigo, fecha FROM PENSLIZACIONES WHERE 


-- Mostrar el nombre del jugador que por lo menos incurrió en una penalización --
SELECT DISTINCT J
FROM JUGADOR J
JOIN PENALIZACION P 
WHERE J.codigo = P.codigo

-- O usando EXISTS que tambien retorna una sola aparicion, como distinct --
SELECT J.nombre from JUGADOR J
WHERE EXISTS (
  SELECT 1
  FROM PENALIZACION P
  WHERE P.codigo = J.codigo
)
ORDER BY J.nombre


-- Mostrar los nombres de los jugadores que nunca incurrieron en penalización alguna. -- 
SELECT J.nombre FROM JUGADOR J
WHERE NOT EXISTS (
  SELECT 1
  FROM PENALIZACION P
  WHERE J.nombre = P.nombre
)
ORDER BY J.nombre


-- Mostrar los nombres de los jugadores acompañados de las fechas en que fueron penalizados. El
-- resultado mostrarlo ordenado ascendentemente por nombre del jugador y fecha. Como se muestra en la
-- figura, si no fueron penalizados igual deben aparecer en la salida.
SELECT J.nombre P.fecha FROM JUGADOR J LEFT JOIN PENALIZACION P USING(codigo) ORDER BY J.nombre ASC P.fecha asc;

-- Listar las tuplas de los jugadores cuya característica telefónica sea 4314 ordenado descendentemente por código. 
SELECT * FROM jugador
WHERE telefono >= '4314-0000'
AND telefono <= '4314-9999'
ORDER BY codigo DESC
