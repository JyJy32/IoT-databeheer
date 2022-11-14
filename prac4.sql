-- Joren liégeois
-- s129792

-- oef 1
select `betalingsnr`, `bedrag` from `tennis3`.`boetes` where `bedrag`> 60;
select `spelersnr`, `gewonnen`, `verloren`, `gewonnen`+ `verloren` as `aantal_sets` from `tennis3`.`wedstrijden` where `gewonnen`+ `verloren` = 5 ;
select `naam`, `plaats` from `tennis3`.`spelers` where `plaats` = 'Den Haag' or `plaats` = 'Rijswijk';
select `naam`, `geslacht`, `plaats` from `tennis3`.`spelers` where `geslacht` = 'v';
select `naam`, `geslacht`, `plaats` from `tennis3`.`spelers` where `geslacht` = 'v' and `plaats` = 'Zoetermeer';
select `betalingsnr`, `datum`, `spelersnr` from `tennis3`.`boetes` where `spelersnr` = 44 and year(`datum`) = 1988 or month(`datum`) != 12
select `spelersnr`, `naam`, `plaats`, `straat` from `tennis3`.`spelers` where left(`straat`, 1) = 's' and `plaats` != 'Den Haag';
select `spelersnr`, `naam`, `jaartoe` from `tennis3`.`spelers` where `jaartoe` >= 1982;
select `spelersnr`, `naam`, `plaats` from `tennis3`.`spelers` where `geslacht` = 'v' and `plaats` != 'Den Haag';

-- oef 2
select `betalingsnr`, `bedrag` from `tennis3`.`boetes` where `bedrag` in (50, 75, 100);
select * from `tennis3`.`wedstrijden` where `spelersnr` not in (1, 27, 112);
select `spelersnr`, `naam`, `straat` from `tennis3`.`spelers` where left(`straat`, 1) in ('e', 'l', 's');

-- oef 3
select `betalingsnr` from `tennis3`.`boetes` where `bedrag` between 50 and 100;
select `betalingsnr` from `tennis3`.`boetes` where `bedrag` not between 50 and 100;
select * from `tennis3`.`wedstrijden` where `wedstrijdnr` between 5 and 10 and `spelersnr` not in (8, 27);

-- oef 4
select `spelersnr`, `naam`, `straat` from `tennis3`.`spelers` where `straat` like '%weg';
select `spelersnr`, `naam`, `straat` from `tennis3`.`spelers` where `straat` like 'h%e%';
select `spelersnr`, `naam` from `tennis3`.`spelers` where `naam` not like '_i%';
select `spelersnr`, `naam` from `tennis3`.`spelers` where left(`naam`, 2) like '_e' and right(`naam`, 2) like 'e_';

-- oef 5
select `spelersnr` from `tennis3`.`spelers` where `bondsnr` is null;
select count(`spelersnr`) from `tennis3`.`bestuursleden` where `eind_datum` is not null;
