-- Joren liégeois
-- s129792

-- oef 1
-- 1
select (
    select divisie 
    from tennis3.teams 
    where teamnr = 1
    ) as divisie_t1, (
        select divisie 
        from tennis3.teams 
        where teamnr = 2) as divisie_t2;
-- 2
select spelersnr, (
    select count(spelersnr) 
    from tennis3.wedstrijden w 
    where s.spelersnr = w.spelersnr
    ) as aantal
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
-- 1
select spelersnr, naam, voorletters
from tennis3.spelers S
where S.spelersnr = (select spelersnr 
                    from tennis3.boetes 
                    where betalingsnr = 4)

select spelersnr, naam, voorletters
from tennis3.spelers S
where S.spelersnr = (
    select spelersnr 
    from tennis3.teams T
    where T.teamnr = (
        select teamnr 
        from tennis3.wedstrijden
        where wedstrijdnr = 2
    ))

-- oef 4
-- 1
select spelersnr, naam
from tennis3.spelers S
where S.spelersnr in (
    select spelersnr
    from tennis3.boetes B
    where B.bedrag > 50 and B.datum is not null
)

-- 2
select betalingsnr, bedrag
from tennis3.boetes B
where B.bedrag = 100 or B.bedrag = 5*B.betalingsnr or B.bedrag = (
    select bedrag 
    from tennis3.boetes 
    where betalingsnr = 2 
)

-- oef 5
-- 1
select spelersnr
from tennis3.spelers
where spelersnr not in (
    select spelersnr
    from tennis3.wedstrijden
    where gewonnen = 3
)

-- 2
select teamnr, divisie
from tennis3.teams
where teamnr not in (
    select teamnr
    from tennis3.wedstrijden
    where spelersnr = 6
)
