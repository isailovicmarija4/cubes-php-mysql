-- Napisati upit koji ispisuje gradove ali sa redom sledecim informacijama: naziv drzave, naziv regije, naziv grada
SELECT
    c.name AS `naziv_drzave`,
    s.name AS `naziv_regije`,
    ci.name AS `naziv_grada`
FROM
    `cities` AS ci
JOIN 
    `states` AS s ON ci.state_id=s.id
JOIN
    `countries`AS c ON s.country_id=c.id;
-- Napisati upit koji ispipsuje gradove koji imaju populaciju milion ili vise, sortiranim po populaciji opadajuce, sa sledecim informacijama: kratki kod zemlje, naziv zemlje, naziv grada, populacija
SELECT
    c.sortname AS `kratki_kod`,
    c.name AS `naziv_drzave`,
    ci.name AS `naziv_grada`,
    ci.population AS `populacija`
FROM
    `cities` AS ci
JOIN 
    `states` AS s ON ci.state_id=s.id
JOIN
    `countries`AS c ON s.country_id=c.id
WHERE ci.population>=1000000
ORDER BY ci.population DESC;
    
-- Napisati upit koji prikazuje gradove za koje nije uneta populacija (tj populacija je 0) sa kolonama: naziv drzave, naziv regije, naziv grada
SELECT
    c.name AS `naziv_drzave`,
    s.name AS `naziv_regije`,
    ci.name AS `naziv_grada`
FROM
    `cities` AS ci
JOIN 
    `states` AS s ON ci.state_id=s.id
JOIN
    `countries`AS c ON s.country_id=c.id
WHERE ci.population=0;

-- Napisati upit koji prikazuje broj gradova za koje nije uneta populaija
SELECT
COUNT(ci.id)
FROM
  `cities` AS ci
WHERE ci.population=0;

-- Napisati upit koji prikazuje regije zajedno sa brojem stanovnika u regiji, polja koja se prikazuju su: naziv drzave, naziv regije, broj stanovnika u regiji
SELECT
    c.name AS `naziv_drzave`,
    s.name AS `naziv_regije`,
    ci.population AS `broj_stanovnika_u_regiji`
FROM
     `states` AS s 
JOIN 
  `cities` AS ci ON s.id =ci.state_id 
JOIN
    `countries`AS c ON s.country_id=c.id;
--ili 
SELECT
    c.name AS `naziv_drzave`,
    s.name AS `naziv_regije`,
   SUM(ci.population) AS `broj_stanovnika_u_regiji`
FROM
     `states` AS s 
JOIN 
  `cities` AS ci ON s.id =ci.state_id 
JOIN
    `countries`AS c ON s.country_id=c.id
GROUP BY s.id;


-- Napisati upit koji pronalazi 10 regija sa najvise stanovnika, polja koja se prikazuju su: naziv drzave, naziv regije, broj stanovnika u regiji
SELECT
    c.name AS `naziv_drzave`,
    s.name AS `naziv_regije`,
    ci.population AS `broj_stanovnika_u_regiji`
FROM
     `states` AS s 
JOIN 
  `cities` AS ci ON s.id =ci.state_id 
JOIN
    `countries`AS c ON s.country_id=c.id
GROUP BY s.id
ORDER BY ci.population DESC
LIMIT 10;

-- Napisati upit koji pronalazi regija sa brojem stanovnika vecim od milion, polja koja se prikazuju su: naziv drzave, naziv regije, broj stanovnika u regiji
SELECT
    c.name AS `naziv_drzave`,
    s.name AS `naziv_regije`,
    ci.population AS `broj_stanovnika_u_regiji`
FROM
     `states` AS s 
JOIN 
  `cities` AS ci ON s.id =ci.state_id 
JOIN
    `countries`AS c ON s.country_id=c.id
GROUP BY s.id
HAVING ci.population>=1000000;


-- Napisati upit koji pronalazi 5 regija sa najvise registrovanih gradova, polja koja se prikazuju su: naziv drzave, naziv regije, broj gradova u regiji
SELECT
    c.name AS `naziv_drzave`,
    s.name AS `naziv_regije`,
    COUNT(ci.id)
FROM
     `states` AS s 
JOIN
    `countries`AS c ON s.country_id=c.id
JOIN 
  `cities` AS ci ON s.id =ci.state_id
GROUP BY s.id
ORDER BY  COUNT(ci.id) DESC
LIMIT 5;

-- Napisati upit koji pronalazi regije sa nijednim unetim gradom (broj gradova je 0), polja koja se prikazuju su: naziv drzave, naziv regije, broj gradova u regiji

SELECT
    c.name AS `naziv_drzave`,
    s.name AS `naziv_regije`,
    COUNT(ci.id)
FROM
     `states` AS s 
JOIN
    `countries`AS c ON s.country_id=c.id
JOIN 
  `cities` AS ci ON s.id=ci.state_id
GROUP BY s.id
HAVING  COUNT(ci.id)=0;
-- Napisati upit koji pronalazi 5 regija sa najvise registrovanih gradova ciji naziv pocinje sa slovom 'r', polja koja se prikazuju su: naziv drzave, naziv regije, broj gradova u regiji

SELECT
    c.name AS `naziv_drzave`,
    s.name AS `naziv_regije`,
    COUNT(ci.id)
FROM
     `states` AS s 
JOIN
    `countries`AS c ON s.country_id=c.id
JOIN 
  `cities` AS ci ON s.id=ci.state_id
WHERE s.name LIKE 'r%'
GROUP BY s.id
ORDER BY COUNT(ci.id) DESC
LIMIT 5;

-- Napisati upit koji pronalazi 5 regija sa najvise milionskih gradova (broje se gradovi sa populacijom vecom od milion), polja koja se prikazuju su: naziv drzave, naziv regije, broj gradova u regiji

SELECT
    c.name AS `naziv_drzave`,
    s.name AS `naziv_regije`,
    COUNT(ci.id)
FROM
     `states` AS s 
JOIN
    `countries`AS c ON s.country_id=c.id
JOIN 
  `cities` AS ci ON s.id=ci.state_id
WHERE ci.population >=1000000
GROUP BY s.id
ORDER BY COUNT(ci.id) DESC
LIMIT 5;



-- Napisati upit koji pronalazi drzave koje imaju vise od 100 regija, polja koja se prikazuju su id drzave, kratki kod drzave, naziv drzave i broj regija

SELECT
    c.id,
    c.sortname AS `kratki_kod`,
    c.name AS `naziv_drzave`,
    COUNT(s.id)
FROM 
    `countries` AS c
JOIN
    `states` AS s ON c.id=s.country_id
GROUP BY c.id
HAVING COUNT(s.id)>100;

-- Napisati upit koji pronalazi drzave koje imaju vise od 10 regija ciji naziv pocinje sa slovom 'a', polja koja se prikazuju su id drzave, kratki kod drzave, naziv drzave i broj regija

SELECT
    c.id,
    c.sortname AS `kratki_kod`,
    c.name AS `naziv_drzave`,
    COUNT(s.id)
FROM 
    `countries` AS c
JOIN
    `states` AS s ON c.id=s.country_id
WHERE c.name LIKE 'a%'
GROUP BY c.id
HAVING COUNT(s.id)>10;
-- Napisati upit koji prikazuje drzave zajedno sa njihovim brojem stanovnika, sortiranih po broju stanovnika opadajuce, polja koja se prikazuju su id drzave, kratki kod drzave, naziv drzave i broj stanovnika

SELECT
    c.id,
    c.sortname AS `kratki_kod`,
    c.name AS `naziv_drzave`,
    ci.population AS `broj_stanovnika`
FROM 
    `countries` AS c
JOIN
    `states` AS s ON s.country_id=c.id
JOIN
    `cities` AS ci ON s.id=ci.state_id
GROUP BY c.id
ORDER BY ci.population DESC;
-- Napisati upit koji prolazi drzave koje imaju vise od milion stanovnika, polja koja se prikazuju su id drzave, kratki kod drzave, naziv drzave i broj stanovnika
SELECT
    c.id,
    c.sortname AS `kratki_kod`,
    c.name AS `naziv_drzave`,
    ci.population AS `broj_stanovnika`
FROM 
    `countries` AS c
JOIN
    `states` AS s ON s.country_id=c.id
JOIN
    `cities` AS ci ON s.id=ci.state_id
WHERE ci.population >1000000
GROUP BY c.id;
-- Napisati upit koji prikazuje prvih 5 drzava sa najvise milionskih gradova
SELECT
    c.id,
    c.sortname AS `kratki_kod`,
    c.name AS `naziv_drzave`,
    ci.population AS `broj_stanovnika`
FROM 
    `countries` AS c
JOIN
    `states` AS s ON s.country_id=c.id
JOIN
    `cities` AS ci ON s.id=ci.state_id
WHERE ci.population>1000000
GROUP BY c.id
ORDER BY ci.population DESC
LIMIT 5;