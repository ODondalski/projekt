--tabela pensja
CREATE TABLE pensja(
  id INT PRIMARY KEY AUTO_INCREMENT,
  zarobki INT(6)
);
--tabela klient
CREATE TABLE klient(
  pesel VARCHAR(11) PRIMARY KEY,
  imie VARCHAR(25),
  nazwisko VARCHAR(25),
  nr_tel VARCHAR(20),
  email VARCHAR(200),
  plec ENUM('kobieta', 'mezczyzna')
);
--tabela miasto
CREATE TABLE miasto(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nazwa VARCHAR(30)
);
--tabela panstwo
CREATE TABLE panstwo(
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_miasto INT,
  nazwa VARCHAR(30),
  FOREIGN KEY(id_miasto) REFERENCES miasto(id)
);
--tabela transport
CREATE TABLE transport(
  id INT PRIMARY KEY AUTO_INCREMENT,
  typ ENUM('lądowy', 'wodny', 'powietrzny')
);
--tabela cennik
CREATE TABLE cennik(
  id INT PRIMARY KEY AUTO_INCREMENT,
  kwota DECIMAL(10, 2)
);
--tabela przemytnik
CREATE TABLE przemytnik(
  pesel VARCHAR(11) PRIMARY KEY,
  imie VARCHAR(30),
  nazwisko VARCHAR(30),
  plec ENUM('kobieta', 'mezczyzna'),
  id_pensja INT,
  id_panstwa INT,
  FOREIGN KEY(id_pensja) REFERENCES pensja(id),
  FOREIGN KEY(id_panstwa) REFERENCES panstwo(id)
);
--tabela zamowienie
CREATE TABLE zamowienie(
  id INT PRIMARY KEY AUTO_INCREMENT,
  data DATE,
  id_klient VARCHAR(11),
  id_przemytnik VARCHAR(11),
  id_transport INT,
  id_cena INT,
  skad INT,
  dokad INT,
  FOREIGN KEY(id_klient) REFERENCES klient(pesel),
  FOREIGN KEY(id_przemytnik) REFERENCES przemytnik(pesel),
  FOREIGN KEY(id_transport) REFERENCES transport(id),
  FOREIGN KEY(id_cena) REFERENCES cennik(id),
  FOREIGN KEY(skad) REFERENCES miasto(id),
  FOREIGN KEY(dokad) REFERENCES miasto(id)
);


--INSERT

INSERT INTO pensja (zarobki) VALUES (2500),(11000),(15000),(7500),(8100),(4000);

INSERT INTO klient (pesel, imie, nazwisko, nr_tel, email, plec) VALUES
('53052841398' ,'Maurycy', 'Kucharski', '024020516', 'maurycy.k@wp.pl', 'mezczyzna'),
('70122176673' ,'Julianna', 'Kalinowska', '253272345', 'julianna.k@wp.pl', 'kobieta'),
('68032215577' ,'Jan', 'Andrzejewski', '024032516', 'jan.k@wp.pl', 'mezczyzna'),
('66030568185' ,'Magdalena', 'Rutkowska', '212402016', 'magdalena.k@wp.pl', 'kobieta'),
('01282483844' ,'Oksana', 'Borkowska', '409920516', 'oksana.k@wp.pl', 'kobieta'),
('88011916772' ,'Oskar', 'Szewczyk', '040242056', 'oskar.k@wp.pl', 'mezczyzna'),
('79111713455' ,'Korneliusz', 'Krupa', '024320516', 'korneliusz.k@wp.pl', 'mezczyzna'),
('61042388594' ,'Luiza', 'Cieślak', '024011516', 'luiza.k@wp.pl', 'kobieta'),
('05260779747' ,'Heronim', 'Wysocki', '0240090916', 'heronim.k@wp.pl', 'mezczyzna'),
('52073112234' ,'Adrian', 'Piotrowski', '424214213', 'adrian.k@wp.pl', 'mezczyzna'),
('77100289866' ,'Anatolia', 'Ostrowska', '022510516', 'anatolia.k@wp.pl', 'kobieta'),
('74123185689' ,'Alexander', 'Dąbrowski', '024870516', 'alexander.k@wp.pl', 'mezczyzna');
INSERT INTO miasto (nazwa) VALUES
('Olsztyn'),
('Wrocław'),
('Monachium'),
('Londyn'),
('Kijów'),
('Moskwa'),
('Lublin');
INSERT INTO panstwo (id_miasto, nazwa) VALUES
(1, 'Polska'),
(2, 'Polska'),
(3, 'Niemcy'),
(4, 'Anglia'),
(5, 'Ukraina'),
(6, 'Rosja'),
(7, 'Polska');
INSERT INTO transport (typ) VALUES
('lądowy'),
('powietrzny'),
('wodny');
INSERT INTO cennik (kwota) VALUES
(1000),
(2000),
(3000),
(5000);
INSERT INTO przemytnik (pesel, imie, nazwisko, plec, id_pensja, id_panstwa) VALUES
('65102646192', 'Marcel', 'Zalewski', 'mezczyzna', 1, 1),
('56091347814', 'Mariusz', 'Górecki', 'mezczyzna', 2, 1),
('77082265272', 'Milan', 'Sokołowski', 'mezczyzna', 3, 3),
('96110947818', 'Paulina', 'Pietrzak', 'kobieta', 4, 3),
('00311765711', 'Nina', 'Lis', 'kobieta', 5, 5),
('88033046693', 'Luiza', 'Jankowska', 'kobieta', 6, 5);
INSERT INTO zamowienie (data, id_klient, id_przemytnik, id_transport, id_cena, skad, dokad) VALUES
('2005-06-10', '53052841398', '65102646192', 2, 1, 1, 2),
('2006-04-21', '70122176673', '65102646192', 3, 2, 3, 2),
('2008-02-18', '68032215577', '56091347814', 1, 3, 3, 4),
('2008-06-13', '66030568185', '56091347814', 2, 4, 5, 2),
('2008-09-10', '01282483844', '77082265272', 2, 2, 1, 5),
('2009-10-26', '61042388594', '77082265272', 2, 2, 2, 3),
('2010-12-30', '05260779747', '96110947818', 3, 1, 5, 6),
('2016-01-26', '52073112234', '96110947818', 3, 1, 7, 6),
('2018-12-03', '77100289866', '00311765711', 1, 3, 6, 7),
('2021-02-03', '74123185689', '88033046693', 1, 3, 1, 6);
