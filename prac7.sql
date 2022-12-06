-- Joren liégeois
-- s129792

-- oef 1
-- 1
/*
A) W2 en Null
B) W2 W3, W2 Null, Null Null
*/ 
-- 2
SELECT DISTINCT plaats
FROM tennis3.spelers

-- 3
SELECT DISTINCT bedrag, month(datum)
FROM tennis3.boetes

--4
SELECT DISTINCT functie
FROM tennis3.bestuursleden

-- oef 2
-- 1
SELECT * 
FROM tennis3.spelers
ORDER BY naam DESC

-- 2
SELECT *
FROM tennis3.spelers
ORDER BY jaartoe, plaats, naam DESC

-- 3
SELECT naam, voorletters, spelersnr
FROM tennis3.spelers
ORDER BY right(naam, 1) DESC

-- 4
SELECT naam, (
    SELECT count(spelersnr)
    FROM tennis3.boetes b 
    WHERE b.spelersnr = s.spelersnr
    ) as aantal
FROM tennis3.spelers s
ORDER BY aantal DESC, naam ASC

-- oef 3
-- 1
SELECT * 
FROM tennis3.boetes
ORDER BY bedrag DESC
LIMIT 3

-- 2
SELECT *
FROM tennis3.spelers
WHERE plaats = (
    SELECT plaats
    FROM tennis3.spelers
    WHERE naam = "Bischoff")
ORDER BY jaartoe DESC
LIMIT 3

-- 3
SELECT naam, geb_datum, (
    SELECT count(spelersnr)
    FROM tennis3.boetes b
    WHERE b.spelersnr = s.spelersnr) as aantal
FROM tennis3.spelers s
ORDER BY aantal DESC, geb_datum ASC
LIMIT 3

-- oef 4
-- 1
SELECT jaartoe
FROM tennis3.spelers
GROUP BY jaartoe

-- 2
SELECT jaartoe, count(*) as aantal
FROM tennis3.spelers
GROUP BY jaartoe

-- 3
SELECT teamnr, count(teamnr) as Wedstrijden, sum(GEWONNEN) as aantal_gewonnen_sets
FROM tennis3.wedstrijden
WHERE teamnr = (
    SELECT teamnr
    FROM tennis3.teams
    WHERE divisie = "ere") /* werkt wel maar gebruikt geen group by? */


-- 4
SELECT spelersnr, sum(bedrag) as totaal_bedrag, (
    SELECT NAAM
    FROM tennis3.spelers S
    where S.spelersnr = b.spelersnr 
) as naam
FROM tennis3.boetes b
GROUP BY spelersnr

-- 5
SELECT teamnr, sum(GEWONNEN) as aantal_gewonnen_sets, (
    SELECT divisie
    FROM tennis3.teams t
    WHERE t.teamnr = w.teamnr
) as Divisie
FROM tennis3.wedstrijden w
GROUP BY teamnr

-- 6
SELECT spelersnr, (
    SELECT count(spelersnr)
    FROM tennis3.BOETES b
    WHERE b.spelersnr = w.spelersnr
) as boetes
FROM tennis3.wedstrijden w
GROUP BY spelersnr

-- 7
SELECT teamnr, spelersnr, count(spelersnr) as aantal
FROM tennis3.wedstrijden
WHERE gewonnen > verloren and teamnr = (
    SELECT teamnr
    FROM tennis3.teams t
    WHERE t.spelersnr in (
        SELECT spelersnr
        FROM tennis3.spelers s
        WHERE s.plaats = "Den Haag"
))
GROUP BY spelersnr

-- oef 5
-- 1
SELECT plaats, count() 
FROM spelersgroup 
BY plaats HAVING count()>4

-- 2
select spelersnr 
from boetes 
group by spelersnr 
having sum(bedrag)>150;

-- 3
select teamnr, divisie 
from teams 
group by teamnr 
having count(spelersnr)>4;
