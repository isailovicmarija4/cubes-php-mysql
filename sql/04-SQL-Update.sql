-- Zadatak: Napisati upit koji menja naziv proizvoda u 'HTC U12' za proizvod sa ID-jem 20.


UPDATE 
    `products`
SET 
    title='HTC U12'
WHERE
    id=20;
--Zadatak:NApisati  upit koji naziv i opis proizvoda menja u "UTC 12" za id =20
UPDATE 
    `products`
SET 
    title='HTC U12',
    description='Mobilni Telefon  HTC U12'
WHERE
    id=20;
-- Zadatak: Napisati upit koji podize cenu za 200.00 za sve proizvode koji su na rasprodaji

UPDATE 
    `products`
SET 
    price=price+200
WHERE
    on_sale=1;





-- Zadatak: Napisati upit koji sizava cenu za 10% za sve proizvode koji su na rasprodaji i koji su u kategoriji 'Mobilni Telefon'
UPDATE 
    `products`
SET 
    price=price*((100-10)/100)
WHERE
    on_sale=1 
    AND category='Mobilni Telefon';
