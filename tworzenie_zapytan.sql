--1
SELECT AVG(zarobki)
FROM pensja;
--2
SELECT COUNT(plec) AS ile_kobiet
FROM klient
WHERE plec = 'kobieta';
--3
SELECT *
FROM
(
	SELECT imie, nazwisko
	FROM przemytnik
	WHERE plec = 'mezczyzna'

) AS MojePodzapytanie
WHERE imie LIKE 'M%'
--4
SELECT przemytnik.imie, przemytnik.nazwisko, przemytnik.pesel, MAX(pensja.zarobki) AS zarobki
FROM przemytnik
INNER JOIN pensja ON przemytnik.id_pensja = pensja.id;
--5
SELECT count(zamowienie.id) AS zamowienia
FROM zamowienie
INNER JOIN transport ON zamowienie.id_transport = transport.id
WHERE transport.typ = 'lądowy';
--6
SELECT panstwo.nazwa, COUNT(zamowienie.skad)
FROM zamowienie
INNER JOIN panstwo ON zamowienie.skad = panstwo.id
GROUP BY zamowienie.skad
HAVING COUNT(zamowienie.skad) > 1
LIMIT 1;
--7
SELECT avg(cennik.kwota) AS cena
FROM zamowienie
INNER JOIN cennik ON zamowienie.id_cena = cennik.id;
--8
SELECT *
FROM
(
	SELECT imie, nazwisko, nr_tel
	FROM klient
	WHERE plec = 'kobieta'

) AS MojePodzapytanie2
WHERE nr_tel LIKE '0%';
--9
SELECT przemytnik.imie, przemytnik.nazwisko, pensja.zarobki
FROM pensja
RIGHT JOIN przemytnik
ON pensja.id = przemytnik.id_pensja;
--10
SELECT year(data) AS rok, COUNT(year(data)) AS ile_przemycen
FROM zamowienie
GROUP BY year(data)
HAVING COUNT(year(data)) > 1;
--1 srednia pensja przemytnika
--2 ile jest klientow plci zenskiej
--3 przemytnicy mężczyźni, ktorych imie zaczyna sie na M
--4 przemytnik z najwieksza pensja
--5 ilosc zamowien z typem lądowym
--6 najwiecej zamowien z danego państwa
--7 srednia cena zamowienia
--8 klienci ktorych numer zaczyna sie od 0 i ktorzy sa kobieta
--9 zestawienie zarobków przemytników
--10 lata, które miały więcej przemyceń niż jedno
