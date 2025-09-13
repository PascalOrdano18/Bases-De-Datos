-- Listar los nombres de los clientes que viven en 'Capital Federal' y solicitaron el producto 'Pagina 12'.

SELECT C.nombre 
FROM CLIENTE C
JOIN PEDIDO P
ON P.nroCli = C.nroCli
JOIN PRODUCTO B
ON B.codProd = P.codProd
WHERE B.descripcion = 'Pagina 12' AND C.ciudad = 'Capital Federal'


-- ESTO ES MAS RAPIDO
SELECT nombre FROM pedido, cliente, producto
WHERE pedido.nrocli = cliente.nrocli
AND ciudad = 'Capital Federal'
AND descripcion = 'Pagina 12'
AND producto.codprod = pedido.codprod

-- Listar los pares de nombres (sin repeticiones) de clientes tal que los dos vivan en la misma ciudad.
SELECT DISTINCT c1.nombre, c2.nombre
FROM CLIENTE c1
JOIN CLIENTE c2
  ON c1.ciudad = c2.ciudad
 AND c1.nroCli < c2.nroCli
ORDER BY c1.nombre, c2.nombre;


-- Listar código, nombre y ciudad de los proveedores y clientes que vivan en Capital
SELECT nrocli, nombre, ciudad FROM cliente
WHERE ciudad = 'Capital Federal'
UNION
SELECT nroprov, nombre, ciudad FROM proveedor
WHERE ciudad = 'Capital Federal'
