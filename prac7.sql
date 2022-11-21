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

SELECT naam, (SELECT count(spelersnr)
FROM tennis3.wedstrijden w 
WHERE w.spelersnr = s.spelersnr) as aantal
FROM tennis3.spelers S
ORDER BY aantal DESC, naam ASC
