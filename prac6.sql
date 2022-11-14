-- Joren liégeois
-- s129792

-- oef 1
-- 1
select (select divisie from tennis3.teams where teamnr = 1) as divisie_t1, (select divisie from tennis3.teams where teamnr = 2) as divisie_t2;
-- 2
select spelersnr, (select count(spelersnr) 
from tennis3.wedstrijden w 
where s.spelersnr = w.spelersnr) as aantal
from tennis3.spelers s;

-- oef 2
select bedrag, betalingsnr 
from tennis3.boetes b
inner join
    (select spelersnr, concat(voorletters, ". ", naam) as `volledige naam`, plaats 
    from tennis3.spelers
    where left(naam, 1) = "c" or plaats = "Den Haag" ) t
on b.spelersnr = t.spelersnr

-- oef 3
select spelersnr, naam, voorletters
from tennis3.spelers S
where S.spelersnr = (select spelersnr 
                    from tennis3.boetes 
                    where )
