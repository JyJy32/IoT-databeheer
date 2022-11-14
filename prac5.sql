-- Joren liégeois
-- s129792

-- oef 1
select B.`betalingsnr`, B.`bedrag`, S.`naam` from `tennis3`.`boetes` as B, `tennis3`.`spelers` as S where B.`spelersnr` = S.`spelersnr`;
select W.*, S.`naam` from `tennis3`.`wedstrijden` as W, `tennis3`.`spelers` as S where S.`spelersnr` = W.`spelersnr`;

select B.`betalingsnr`, B.`bedrag`, S.`naam`, S.`plaats`
from `tennis3`.`boetes` as B, `tennis3`.`spelers` as S 
where S.`plaats` = "Den Haag" and S.`spelersnr` = B.`spelersnr`;

select W.`wedstrijdnr`, S.`naam`, T.`divisie`, W.`gewonnen`> W.`verloren` as "gewonnen/verloren" 
from `tennis3`.`wedstrijden` as W, `tennis3`.`spelers` as S, `tennis3`.`teams` as T 
where W.`wedstrijdnr` <= 10 and W.`spelersnr` = S.`spelersnr` and T.`teamnr` = W.`teamnr`;

-- oef 2

select S.*, BL.`functie`, --BL.`eind_datum` is NULL as actief
from `tennis3`.`bestuursleden` as BL
join `tennis3`.`spelers` as S on BL.`spelersnr` = S.`spelersnr`
where BL.`functie` in ("Voorzitter", "Penningsmeester") ;

select S.`naam`, S.`spelersnr`, concat(W.gewonnen, "-", W.verloren) as Uitslag 
from `tennis3`.`wedstrijden` as W
join `tennis3`.`spelers` as S on W.`spelersnr` = S.`spelersnr`;

select S.naam, W.*
from tennis3.spelers as S
join tennis3.wedstrijden W on S.spelersnr = W.spelersnr
where month(S.geb_datum) in ( 08, 09, 10) and W.gewonnen > W.verloren;

-- oef3

select S.spelersnr, T.teamnr
from tennis3.spelers as S
left join tennis3.teams T on T.spelersnr = S.spelersnr;

select S.spelersnr, coalesce(B.bedrag, 0)
from tennis3.spelers as S
left join tennis3.boetes B on B.spelersnr = S.spelersnr


-- select * from tennis3.boetes, ap.tblAfdeling;


