CREATE TABLE proveedor (
    nroProv INTEGER PRIMARY KEY NOT NULL,
    nombre TEXT,
    ciudad TEXT
);

CREATE TABLE producto (
    codProd INTEGER PRIMARY KEY NOT NULL,
    descripcion TEXT
);

CREATE TABLE cliente (
    nroCli INTEGER PRIMARY KEY NOT NULL,
    nombre TEXT,
    ciudad TEXT
);

CREATE TABLE pedido (
    nroCli INTEGER NOT NULL,
    nroProv INTEGER NOT NULL,
    codProd INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY(nroCli, nroProv, codProd, fecha),
    FOREIGN KEY(nroCli) REFERENCES cliente(nroCli)
        ON DELETE CASCADE,
    FOREIGN KEY(nroProv) REFERENCES proveedor(nroProv)
        ON DELETE CASCADE,
    FOREIGN KEY (codProd) REFERENCES producto(codProd)
        ON DELETE CASCADE
);

INSERT INTO proveedor (nroProv, nombre, ciudad) VALUES
    (10, 'Importaciones ABC', 'Capital Federal'),
    (20, 'Revistas Unidas', 'Rosario'),
    (30, 'Distribuidora Manfretti', 'Cordoba'),
    (40, 'Distribuidora PPP', 'Rosario');

INSERT INTO producto (codProd, descripcion) VALUES
    (1, 'Revista Gente'),
    (2, 'Caras'),
    (3, 'Foco'),
    (4, 'Speak Up'),
    (5, 'Learn English'),
    (6, 'El Grafico'),
    (7, 'Pelo'),
    (8, '100 recetas fáciles-Arguiñano'),
    (9, 'Cocinando con Choly Berreteaga'),
    (10, 'La Nación'),
    (11, 'Pagina 12'),
    (12, 'Clarín'),
    (13, 'La Razon'),
    (14, 'Buenos Aires Herald');

INSERT INTO cliente (nroCli, nombre, ciudad) VALUES
    (10, 'Felipe Garcia', 'Capital Federal'),
    (20, 'Anastasia Le Court', 'Capital Federal'),
    (30, 'Teodora Boorman', 'Rosario'),
    (40, 'Jose Ryan', 'Rosario'),
    (50, 'Maria Carbajal', 'Capital Federal'),
    (60, 'Sonia Santillan', 'Capital Federal'),
    (70, 'ITBA', 'Capital Federal'),
    (80, 'Franco Ronelli', 'Rosario'),
    (90, 'Monica Musso', 'Parana');

INSERT INTO pedido (nroCli, nroProv, codProd, cantidad, fecha) VALUES
    (10, 10, 4, 1, '2015-06-30'),
    (10, 10, 5, 3, '2015-06-30'),
    (40, 30, 9, 1, '2015-09-15'),
    (40, 10, 11, 4, '2014-12-10'),
    (40, 10, 1, 1, '2013-10-12'),
    (50, 30, 10, 1, '2014-04-08'),
    (50, 40, 11, 1, '2014-10-30'),
    (50, 30, 12, 1, '2014-01-31'),
    (50, 30, 13, 1, '2014-04-08'),
    (50, 40, 14, 1, '2014-01-31'),
    (70, 40, 10, 3, '2012-02-29'),
    (70, 40, 11, 3, '2012-02-29'),
    (70, 40, 12, 1, '2012-02-29'),
    (70, 30, 12, 2, '2012-02-18'),
    (70, 40, 13, 3, '2012-02-29'),
    (70, 40, 14, 3, '2012-02-29'),
    (90, 40, 2, 2, '2015-09-08'),
    (90, 30, 2, 3, '2013-02-10'),
    (90, 30, 8, 1, '2015-06-30');


ALTER TABLE producto ADD COLUMN genero TEXT;
ALTER TABLE cliente  ADD COLUMN direccion TEXT;

UPDATE producto SET genero = 'Chismes'
WHERE codProd IN (1,2,3);

UPDATE producto SET genero = 'Ingles'
WHERE codProd IN (4,5);

UPDATE producto SET genero = 'Deporte'
WHERE codProd = 6;

UPDATE producto SET genero = 'Musical'
WHERE codProd = 7;

UPDATE producto SET genero = 'Cocina'
WHERE codProd IN (8,9);

UPDATE producto SET genero = 'Diario'
WHERE codProd IN (10,11,12,13,14);


UPDATE cliente SET direccion = 'Tucuman 110' WHERE nroCli = 10;
UPDATE cliente SET direccion = 'Alvear 1256' WHERE nroCli = 20;
UPDATE cliente SET direccion = '25 de Mayo 1400' WHERE nroCli = 30;
UPDATE cliente SET direccion = '25 de Mayo 240'     WHERE nroCli = 40;
UPDATE cliente SET direccion = 'Viamonte 6822' WHERE nroCli = 50;
UPDATE cliente SET direccion = 'Alem 500' WHERE nroCli = 60;
UPDATE cliente SET direccion = 'Madero 399'           WHERE nroCli = 70;
UPDATE cliente SET direccion = 'Francia 200' WHERE nroCli = 80;
UPDATE cliente SET direccion = 'Lima 189'   WHERE nroCli = 90;
