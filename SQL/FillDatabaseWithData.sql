USE CentrumSportu
GO

--********************* Tabela Kategorie_Sprzetu
-- bardziej w sensie rodzaj ni� kategoria, np: 
-- sprz�t w kategorii pi�ki do siatk�wki, to bedzie ile� tam takich samych pi�ek, tylko o innym id

INSERT INTO dbo.Kategorie_Sprzetu VALUES (NULL,'Pi�ki do siatk�wki');
INSERT INTO dbo.Kategorie_Sprzetu VALUES (NULL,'Pi�ki do gry w pi�k� no�n�');
INSERT INTO dbo.Kategorie_Sprzetu VALUES (NULL,'Pi�ki do koszyk�wki');
INSERT INTO dbo.Kategorie_Sprzetu VALUES (NULL,'Pi�ki do gry w pi�k� r�czn�');

--********************* Tabela Sprzet
-- stany: wolna, rezerwacja, wypo�yczenie, wypo�yczenie-rezerwacja
-- sprawnosc: sprawna, uszkodzona,

INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka zwyk�a','wolna','sprawna','Zakupiona w 2016 roku');