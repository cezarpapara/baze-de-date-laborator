-- =====================================================================
-- Baza de date BIBLIOTECA (exemplul 1, cel mai simplu)
-- Laborator: Baze de date / Informatică aplicată
-- Motor: SQLite (se rulează în DBeaver: Execute SQL Script, Alt+X)
-- Conține 2 tabele legate între ele: AUTORI (1) ---- (N) CARTI
-- Scriptul poate fi rulat de mai multe ori: la început șterge tabelele vechi.
-- =====================================================================

PRAGMA foreign_keys = ON;

-- tabelele create la exercițiile din capitolul 11 (dacă există) se șterg primele
DROP TABLE IF EXISTS carti_autori;
DROP TABLE IF EXISTS imprumuturi;
DROP TABLE IF EXISTS cititori;
DROP TABLE IF EXISTS carti;
DROP TABLE IF EXISTS autori;

CREATE TABLE autori (
    id_autor     INTEGER PRIMARY KEY,
    nume         TEXT    NOT NULL,
    prenume      TEXT    NOT NULL,
    tara         TEXT,
    an_nastere   INTEGER
);

CREATE TABLE carti (
    id_carte     INTEGER PRIMARY KEY,
    titlu        TEXT    NOT NULL,
    id_autor     INTEGER NOT NULL REFERENCES autori(id_autor),
    an_aparitie  INTEGER,
    gen          TEXT,
    nr_pagini    INTEGER CHECK (nr_pagini > 0),
    pret         REAL    CHECK (pret >= 0),
    disponibila  INTEGER NOT NULL DEFAULT 1 CHECK (disponibila IN (0, 1))
);

INSERT INTO autori (id_autor, nume, prenume, tara, an_nastere) VALUES
  (1, 'Eminescu', 'Mihai', 'România', 1850),
  (2, 'Creangă', 'Ion', 'România', 1837),
  (3, 'Caragiale', 'Ion Luca', 'România', 1852),
  (4, 'Slavici', 'Ioan', 'România', 1848),
  (5, 'Rebreanu', 'Liviu', 'România', 1885),
  (6, 'Sadoveanu', 'Mihail', 'România', 1880),
  (7, 'Petrescu', 'Camil', 'România', 1894),
  (8, 'Preda', 'Marin', 'România', 1922),
  (9, 'Eliade', 'Mircea', 'România', 1907),
  (10, 'Blaga', 'Lucian', 'România', 1895),
  (11, 'Arghezi', 'Tudor', 'România', 1880),
  (12, 'Sorescu', 'Marin', 'România', 1936),
  (13, 'Cărtărescu', 'Mircea', 'România', 1956),
  (14, 'Orwell', 'George', 'Regatul Unit', 1903),
  (15, 'Austen', 'Jane', 'Regatul Unit', 1775),
  (16, 'Dostoievski', 'Feodor', 'Rusia', 1821),
  (17, 'Tolstoi', 'Lev', 'Rusia', 1828),
  (18, 'Hugo', 'Victor', 'Franța', 1802),
  (19, 'García Márquez', 'Gabriel', 'Columbia', 1927),
  (20, 'Saint-Exupéry', 'Antoine de', 'Franța', 1900),
  (21, 'Kafka', 'Franz', 'Cehia', 1883),
  (22, 'Hemingway', 'Ernest', 'SUA', 1899),
  (23, 'Christie', 'Agatha', 'Regatul Unit', 1890),
  (24, 'Tolkien', 'J.R.R.', 'Regatul Unit', 1892),
  (25, 'Asimov', 'Isaac', 'SUA', 1920),
  (26, 'Knuth', 'Donald', 'SUA', 1938),
  (27, 'Codd', 'Edgar F.', 'Regatul Unit', 1923),
  (28, 'Kernighan', 'Brian', 'Canada', 1942),
  (29, 'Stroustrup', 'Bjarne', 'Danemarca', 1950),
  (30, 'Hawking', 'Stephen', 'Regatul Unit', 1942),
  (31, 'Stănescu', 'Nichita', 'România', 1933),
  (32, 'Blandiana', 'Ana', 'România', 1942);

INSERT INTO carti (id_carte, titlu, id_autor, an_aparitie, gen, nr_pagini, pret, disponibila) VALUES
  (1, 'Poezii', 1, 1883, 'Poezie', 320, 48.99, 1),
  (2, 'Luceafărul', 1, 1883, 'Poezie', 48, 44.99, 1),
  (3, 'Geniu pustiu', 1, 1904, 'Roman', 208, 64.99, 1),
  (4, 'Sărmanul Dionis', 1, 1872, 'Nuvelă', 120, 38.99, 1),
  (5, 'Amintiri din copilărie', 2, 1881, 'Memorialistică', NULL, 36.99, 0),
  (6, 'Povestea lui Harap-Alb', 2, 1877, 'Basm', 64, 38.99, 1),
  (7, 'Capra cu trei iezi', 2, 1875, 'Basm', 32, 33.99, 1),
  (8, 'O scrisoare pierdută', 3, 1884, 'Teatru', 147, 39.99, 1),
  (9, 'O noapte furtunoasă', 3, 1879, 'Teatru', 110, 37.99, 1),
  (10, 'D-ale carnavalului', 3, 1885, 'Teatru', 98, 25.99, 0),
  (11, 'Momente și schițe', 3, 1901, 'Proză scurtă', 211, 42.99, 1),
  (12, 'Moara cu noroc', 4, 1881, 'Nuvelă', 101, 33.99, 1),
  (13, 'Mara', 4, 1894, 'Roman', 288, 61.99, 1),
  (14, 'Ion', 5, 1920, 'Roman', 528, 43.99, 1),
  (15, 'Pădurea spânzuraților', 5, 1922, 'Roman', 360, 52.99, 1),
  (16, 'Răscoala', 5, 1932, 'Roman', 480, 48.99, 1),
  (17, 'Baltagul', 6, 1930, 'Roman', 192, 52.99, 0),
  (18, 'Hanu-Ancuței', 6, 1928, 'Proză scurtă', 176, 49.99, 1),
  (19, 'Frații Jderi', 6, 1935, 'Roman', 1297, 85.99, 0),
  (20, 'Ultima noapte de dragoste, întâia noapte de război', 7, 1930, 'Roman', 400, 34.99, 1),
  (21, 'Patul lui Procust', 7, 1933, 'Roman', 336, 42.99, 1),
  (22, 'Moromeții', 8, 1955, 'Roman', 626, 59.99, 1),
  (23, 'Cel mai iubit dintre pământeni', 8, 1980, 'Roman', 1008, 56.99, 1),
  (24, 'Maitreyi', 9, 1933, 'Roman', 200, 41.99, 0),
  (25, 'La țigănci', 9, 1969, 'Nuvelă', 112, 40.99, 0),
  (26, 'Poemele luminii', 10, 1919, 'Poezie', 96, 42.99, 0),
  (27, 'Meșterul Manole', 10, 1927, 'Teatru', 149, 42.99, 0),
  (28, 'Cuvinte potrivite', 11, 1927, 'Poezie', 144, 36.99, 1),
  (29, 'Flori de mucigai', 11, 1931, 'Poezie', 112, 50.99, 1),
  (30, 'Iona', 12, 1968, 'Teatru', 139, 28.99, 1),
  (31, 'Nostalgia', 13, 1993, 'Roman', 437, 41.99, 1),
  (32, 'Orbitor', 13, 1996, 'Roman', 826, 66.99, 1),
  (33, 'Solenoid', 13, 2015, 'Roman', 840, 44.99, 1),
  (34, '1984', 14, 1949, 'Roman', 336, 74.99, 0),
  (35, 'Ferma animalelor', 14, 1945, 'Roman', 128, 42.99, 1),
  (36, 'Mândrie și prejudecată', 15, 1813, 'Roman', 432, 68.99, 1),
  (37, 'Rațiune și simțire', 15, 1811, 'Roman', 384, 35.99, 0),
  (38, 'Crimă și pedeapsă', 16, 1866, 'Roman', 576, 67.99, 1),
  (39, 'Idiotul', 16, 1869, 'Roman', 720, 61.99, 0),
  (40, 'Frații Karamazov', 16, 1880, 'Roman', 960, 70.99, 1),
  (41, 'Război și pace', 17, 1869, 'Roman', 1193, 91.99, 1),
  (42, 'Anna Karenina', 17, 1878, 'Roman', 864, 58.99, 0),
  (43, 'Mizerabilii', 18, 1862, 'Roman', 1488, 43.99, 1),
  (44, 'Notre-Dame de Paris', 18, 1831, 'Roman', 560, 62.99, 1),
  (45, 'Un veac de singurătate', 19, 1967, 'Roman', 424, 67.99, 1),
  (46, 'Dragostea în vremea holerei', 19, 1985, 'Roman', 448, 37.99, 1),
  (47, 'Micul prinț', 20, 1943, 'Roman', 96, NULL, 1),
  (48, 'Procesul', 21, 1925, 'Roman', 256, 52.99, 1),
  (49, 'Metamorfoza', 21, 1915, 'Nuvelă', 122, 31.99, 0),
  (50, 'Bătrânul și marea', 22, 1952, 'Nuvelă', 152, 46.99, 0),
  (51, 'Pentru cine bat clopotele', 22, 1940, 'Roman', 528, 66.99, 1),
  (52, 'Crima din Orient Express', 23, 1934, 'Polițist', 256, 35.99, 0),
  (53, 'Și n-a mai rămas niciunul', 23, 1939, 'Polițist', 246, 46.99, 0),
  (54, 'Hobbitul', 24, 1937, 'Fantasy', 320, 63.99, 0),
  (55, 'Stăpânul inelelor', 24, 1954, 'Fantasy', 1244, 89.99, 1),
  (56, 'Fundația', 25, 1951, 'SF', 288, 33.99, 0),
  (57, 'Eu, robotul', 25, 1950, 'SF', 272, 52.99, 1),
  (58, 'The Art of Computer Programming, Vol. 1', 26, 1968, 'Informatică', 672, 247.99, 1),
  (59, 'The Relational Model for Database Management', 27, 1990, 'Informatică', 538, 195.99, 0),
  (60, 'The C Programming Language', 28, 1978, 'Informatică', 272, 227.99, 1),
  (61, 'The C++ Programming Language', 29, 1985, 'Informatică', 328, 183.99, 0),
  (62, 'Scurtă istorie a timpului', 30, 1988, 'Știință', 204, 44.99, 1);

-- Verificare rapidă: ar trebui să vedeți 32 de autori și 62 de cărți.
SELECT (SELECT COUNT(*) FROM autori) AS nr_autori, (SELECT COUNT(*) FROM carti) AS nr_carti;
