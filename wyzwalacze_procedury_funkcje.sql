--wyzwalacz 1
--jezeli dodawana pensja jest mniejsza niz 0 ustawia ja na 0
DELIMITER //
CREATE TRIGGER pensja_mniej_niz_0
BEFORE INSERT ON pensja
FOR EACH ROW
BEGIN
  IF NEW.zarobki < 0
  THEN
    SET NEW.zarobki = 0;
  END IF;
END
//
DELIMITER;
--wyzwalacz 1
--jezeli dodawana kwota jest wieksza niz 500 odejmuje od niej 2000
DELIMITER //
CREATE TRIGGER kwota_minus_2000
BEFORE INSERT ON cennik
FOR EACH ROW
BEGIN
  IF NEW.kwota > 5000
  THEN
    SET NEW.kwota = NEW.kwota - 2000;
  END IF;
END
//
DELIMITER;
--procedura
--zmienia zarobki wybranego id
DELIMITER //
CREATE PROCEDURE zmiana_pensji(IN id2 int,IN zarobki2 int(6))
BEGIN
UPDATE pensja SET zarobki = zarobki2 WHERE id=id2;
END
//
DELIMITER;
--funkcja
--zwraca ilosc klientow
DELIMITER //
CREATE FUNCTION ile_klientow()
	RETURNS INT
BEGIN
	DECLARE ile INT;
    SELECT COUNT(*) INTO @ile FROM klient;
    RETURN @ile;
END //
DELIMITER

SELECT ile_klientow();
