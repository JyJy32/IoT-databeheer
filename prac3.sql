-- Joren liégeois
-- s129792

-- oef 1


-- 1.2

-- INSERT INTO `Tennis3`.`Boetes` VALUES (15,27,'2021-08-08',75.00);

-- 1.3
-- INSERT INTO `Tennis3`.`Boetes` VALUES (16,7,'2021-08-12',50.00),(18,44,'2021-08-21',60.00),(19,7,'2021-09-10',100.00);

-- oef2
delete from `tennis3`.`bestuursleden`;
delete from `tennis3`.`boetes` where `spelersnr` =7;

-- oef3
select `betalingsnr`,`bedrag` from `tennis3`.`boetes`;
select `spelersnr`,`teamnr`, `gewonnen` - `verloren` as resultaat from `tennis3`.`wedstrijden`;

-- oef4
select `spelersnr`, `naam`, 
concat('(+31)', '(', left(left(`telefoon`, 3), 1), ')', right(left(`telefoon`, 3), 2), '-', right(`telefoon`, 6)) 
as `telefoon nummer` 
from `tennis3`.`spelers`;
select `spelersnr`, month(`geb_datum`) = month(curdate()) and day(`geb_datum`) = day(curdate()) as `jarig` from `tennis3`.`spelers`; 

--oef 5
select max(`gewonnen` - `verloren`) as `maximaal` from `tennis3`.`wedstrijden`;
select sum(`gewonnen`)+sum(`verloren`) as `aantal` from `tennis3`.`wedstrijden`;
