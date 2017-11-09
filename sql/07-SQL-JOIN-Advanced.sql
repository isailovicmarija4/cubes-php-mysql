u-- Kreirati tabelu groups sa poljima id i title i preneti njen primarni kljuc u tabelu categories pod nazivom group_id 

-- Napisati upit koji ispisuje proizvode zajedno sa kategorijom i grupom
SELECT
    p.id,
    g.title AS group_title,
    c.title AS category_title,
    p.title
   
    
FROM
    products AS p
JOIN
    categories AS c  ON p.category_id=c.id
JOIN
    groups AS g  ON c.group_id=g.id;





-- Napisati upit koji ispisuje broj proizvoda u kategoriji

SELECT
    COUNT(p.id),
    c.title AS category_title
  
FROM
    products AS p
JOIN
    categories AS c  ON p.category_id=c.id
GROUP BY c.id;-- ili p.category_id





-- Napisati upit koji ispisuje broj proizvoda u grupi


SELECT
    COUNT(p.id),
    g.title AS group_title
  
FROM
    products AS p
JOIN
    categories AS c  ON p.category_id=c.id
JOIN
    groups AS g  ON c.group_id=g.id
GROUP BY g.id;



-- Napisati upit koji ispisuje broj proizvoda u grupi za proizvode ciji sa brand_id -jem 1
SELECT
    COUNT(p.id),
    g.title AS group_title
  
FROM
    products AS p
JOIN
    categories AS c  ON p.category_id=c.id
JOIN
    groups AS g  ON c.group_id=g.id
WHERE p.brand_id=1
GROUP BY g.id;


SELECT
    COUNT(p.id),
    g.title AS group_title
  
FROM
    products AS p
LEFT JOIN
    categories AS c  ON p.category_id=c.id
LEFT JOIN
    groups AS g  ON c.group_id=g.id
WHERE p.brand_id=1
GROUP BY g.id;



-- Napisati upit koji ispisuje broj proizvoda u grupi za proizvode ciji se brend zove 'Samsung'
SELECT
    COUNT(p.id),
    g.title AS group_title
  
FROM
    products AS p
JOIN
    categories AS c  ON p.category_id=c.id
JOIN
    groups AS g  ON c.group_id=g.id
JOIN brands AS b ON p.brand_id=b.id
WHERE b.title='Samsung'
GROUP BY g.id;








-- Napisati upit koji ispisuje broj proizvoda u grupi za proizvode ciji naslov pocinje sa 'a'
SELECT
    COUNT(p.id),
    g.title AS group_title
  
FROM
    products AS p
LEFT JOIN
    categories AS c  ON p.category_id=c.id
LEFT JOIN
    groups AS g  ON c.group_id=g.id
WHERE p.tile LIKE 'a%'
GROUP BY g.id;






--------------------veza vise:vise-----------------------



-- Kreirati tabelu tags sa poljima id i title


-- Napisati upit koji ispisuje sve proivode koji su tagovani tagom sa id-jem recimo 3 (ili neki drugi tag)

SELECT
p.*--ukljuceno sve iz svih tabelaaaaaa
FROM
    products AS p
JOIN
   product_tags   AS pt  ON p.id=pt.product_id

WHERE pt.id =3;


--vise tagova imaju
 WHERE pt.id IN(3,4,5)



-- Napisati upit koji ispisuje sve tag-ove proizvoda sa id-jem 16 (ili neki drugi id)


SELECT
   t.*
FROM
    tags AS t
 JOIN
    product_tags AS pt  ON t.id=pt.tag_id 
WHERE pt.product_id=16;






