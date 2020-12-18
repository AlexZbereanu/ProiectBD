 -- 1. afisare jucatori de origine olandeza
 
select nume, prenume, nume_club,tara
from jucatori j
join echipe e ON(j.echipe_id_echipa = e.id_echipa)
where tara = 'Netherlands'
order by prenume;

-- 2. afisare jucatorii cu mai mult de 2 assist-uri
select distinct (id_jucator), nume, prenume, nr_assist
from jucatori
join statistici s ON(s.jucatori_id_jucator = id_jucator)
where nr_assist >= 2;

-- 3. afisare meciuri unde participarea la meci a fost mai mica de 50%
select id_meci, to_char(data_meci, 'DD-MM-YYYY HH24:MI'), numar_spectatori, capacitate
from meciuri
join stadioane s ON(s.id_stadion = meciuri.stadioane_id_stadion)
where numar_spectatori < capacitate * 0.5;

-- 4. afisare numarul de goluri inscrise de fiecare echipa
select sum(nr_goluri) AS total, nume_club
from jucatori j
join echipe e ON(e.id_echipa = j.echipe_id_echipa)
join statistici s ON(s.jucatori_id_jucator = j.id_jucator)
group by nume_club
order by sum(nr_goluri) desc, nume_club

--6 testare capacitate stadion <0
insert into stadioane values(13, 'Otkritie Arena', -45360);

--7 testare constrangeri la echipe nume club si nume prescurtat incorecte
insert into echipe values(13, 7, 'Steaua Bucuresti', 'FCSb');
--8 testare constrangeri jucatori
insert into jucatori values(135, 1, 'Fredrik0', 'Ivaansson0', 100, 'GKK', 'Sweden');
--9 testare constrangeri meciuri
insert into meciuri values(1, 1, 2, 1, to_date('03-11-2022 16:30:00', 'DD-MM-YYYY HH24:MI:SS'), 69454);
--10 testare constrangeri rezultate
insert into rezultate values(25, -10, 1);
--11 testare constrangeri statistici
insert into statistici values(1, 1, 1, 7, -10, 1);
