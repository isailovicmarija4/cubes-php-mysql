-- Obnavljanje
-- Zadatak: Selektuj sve kategorije bez ponavljanja (DISTINCT)
SELECT 
    DISTINCT(category)
FROM 
    `products`;

-- Zadatak: Selektuj sve kategorije bez ponavljanja (GROUP BY)(ovo u dva nacina  isti rezulata 1 i 2 zadatak)
SELECT 
    category
FROM 
    `products`
GROUP BY 
    category;
-- Zadatak: Selektuj koja kategorija koliko proizvoda ima
SELECT 
    category,
    COUNT(id) AS `broj_proizvoda`
FROM 
    `products`
GROUP BY 
    category;
-- Zadatak: Selektuj koja kategorija koliko proizvoda ima i sortiraj opadajuce po broju proizvoda
SELECT 
    category,
    COUNT(id) AS `broj_proizvoda`
FROM 
    `products`
GROUP BY 
    category
ORDER BY COUNT(id) DESC;
-- Zadatak: Selektuj koja kategorija ima najvise proizvoda (LIMIT)
SELECT 
    category,
    COUNT(id) AS `broj_proizvoda`
FROM 
    `products`
GROUP BY 
    category
ORDER BY COUNT(id) DESC
LIMIT 1;
-- Zadatak: Selektuj sve kategorije osim one koja ima najvise proizvoda
SELECT 
    category,
    COUNT(id) AS `broj_proizvoda`
FROM 
    `products`
GROUP BY 
    category
ORDER BY COUNT(id) DESC
LIMIT 1000000
OFFSET 1;
-- Zadatak: Selektuj samo drugu kategoriju koja ima najvise proizvoda
SELECT 
    category,
    COUNT(id) AS `broj_proizvoda`
FROM 
    `products`
GROUP BY 
    category
ORDER BY COUNT(id) DESC
LIMIT 1
OFFSET 1;
-- Zadatak: Selektuj kategorije koji imaju vise od 5proizvoda (GROUP BY HAVING)MORA HAVING JER TEK NAKON GROUP BY IDE OVAJ USLOV > 3 ,NE SME PRE DA BI SE AKTIVIRAO WHERE
SELECT 
    category
    
FROM 
    `products`

GROUP BY 
    category
HAVING COUNT(id)>5;

-- Vise agregatnih funckxija

-- Zadatak: Selektuj kategorije i njihov broj proizvoda, njihovu prosecnu cenu proizvoda i ukupno komada
SELECT 
    category,
    COUNT(id) AS `broj_proizvoda`,
    ROUND(AVG(price),2) AS `prosecne_cene`,
    SUM(quantity) AS `ukupan_broj`
FROM 
    `products`
GROUP BY 
    category;
-- Zadatak: Selektuj brendove i broj kategorija u brendu, broj proizvoda u brendu i prosecnu cenu proizvoda u brendu
SELECT 
    brand,
    COUNT(DISTINCT category) AS `broj_kategorija` ,
    COUNT(id) AS `broj_proizvoda`,
    ROUND(AVG(price),2) AS `prosecne_cene`
FROM 
    `products`
GROUP BY 
    brand;
-- Zdatak:Selektuj 5 nasumicnih proizvoda
SELECT 
    *
FROM 
    `products`
ORDER BY 
   RAND() 
LIMIT 5;


-- Upit u upitu(IN)
-- Zadatak: Selektuj sve proizvode iz kategorija koje imaju vise od 5 proizvoda

SELECT category FROM  `products` GROUP BY category HAVING COUNT(id)>5;--obo je bilo da se izvuku kategorije

SELECT
 *
FROM
`products`
WHERE category IN(SELECT category FROM  `products` GROUP BY category HAVING COUNT(id)>5);






-- Zadatak: Selektuj sve proizvode iz brenda koji imaju vise od 5 proizvoda

SELECT
 *
FROM
`products`
WHERE brand IN(SELECT brand FROM  `products` GROUP BY brand HAVING COUNT(id)>5);
\

-- Zadatak: Selektuj proizvode iz kategorije sa najvise proizvoda


SELECT category FROM `products` GROUP BY category ORDER BY COUNT(id) DESC  LIMIT 1;--LIMIT ne sme u podupit trazi nov nacin!!!!!!!!!!!


 
