-- Verificar que las siguientes sean las tuplas que están insertadas en las tablas JUGADOR y
--PENALIZACION, antes de continuar. Para recuperar la fecha como dd mm yyyy solicitar explícitamente
--en la cláusula SELECT EXTRACT(DAY FROM fecha), EXTRACT(MONTH FROM fecha),
--EXTRACT(YEAR FROM fecha) por separado para poder visualizarlo correctamente:


SELECT * FROM JUGADOR ORDER BY codigo ASC

SELECT codigo, monto, EXTRACT(DAY FROM fecha) AS DIA, EXTRACT(MONTH FROM fecha) AS MES, EXTRACT(YEAR FROM fecha) AS ANIO FROM PENALIZACION

-- Encontrar el monto más caro pagado por una penalización
SELECT MAX(monto) FROM PENALIZACION

-- Encontrar el monto más caro pagado por una penalización incurrida durante 2014, donde el título
--del atributo de la relación resultante sea maximo_14.

SELECT MAX(monto) AS maximo_14 FROM PENALIZACION WHERE EXTRACT(YEAR FROM fecha) = 2014


--Encontrar el monto que en total pagó cada jugador por las penalizaciones incurridas. Mostrar el
--resultado acompañando dicha cifra por el nombre del jugador, ordenado ascendentemente por nombre.
--Tener en cuenta que los nombres de los jugadores podrían repetirse (Ej: 'B04' y 'B06' podrían llamarse
--igual) pero el resultado debe separar a los montos de los distintos jugadores (pensar que lo que los diferencia
--unívocamente NO es el nombre). Si hubiera dos Cardoso deben haber dos líneas: una por cada uno de ellos,
--aunque no se sepa cual es de uno y del otro.

SELECT SUM(P.monto) AS suma, J.nombre
FROM PENALIZACION P
JOIN JUGADOR J ON P.codigo = J.codigo 
GROUP BY J.codigo, J.nombre ORDER BY J.nombre


--Suponiendo que los precios de las penalizaciones están guardados en pesos y se quiere obtener la
--información en dólares, asumiendo que el cambio es 8.5 pesos equivale a 1 dólar, expresar la misma
--consulta anterior en dólares. Mostrar la columna numérica con el nombre de atributo DOLAR. 

SELECT SUM(P.monto)/8.5 AS DOLAR, J.nombre
FROM PENALIZACION P
JOIN JUGADOR J
ON J.codigo = P.codigo
GROUP BY J.codigo, J.nombre
ORDER BY J.nombre


-- Mostrar cada nombre de jugador acompañado por la primera fecha en la que incurrió en alguna
--penalización. Se pide que si un jugador no cometió ninguna falta, igual aparezca en el resultado.

SELECT DISTINCT J.nombre, TO_CHAR(MIN(P.fecha), 'DD-MM-YYYY') 
FROM JUGADOR J
LEFT JOIN PENALIZACION P
ON J.codigo = P.codigo 
GROUP BY J.nombre, P.fecha



CREATE VIEW EQUIPO AS
  SELECT J.codigo AS codigo, J.nombre AS nombre, TO_CHAR(MAX(P.fecha), 'DD/MM/YYYY') as ultima, COALESCE(SUM(P.monto), 0) as acumulado 
  FROM JUGADOR J
  LEFT JOIN PENALIZACION P
ON J.codigo = P.codigo
GROUP BY J.nombre, J.codigo



