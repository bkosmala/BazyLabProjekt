USE CentrumSportu
GO

--********************* Tabela Kategorie_Sprzetu
-- bardziej w sensie rodzaj ni� kategoria, np: 
-- sprz�t w kategorii pi�ki do siatk�wki, to bedzie ile� tam takich samych pi�ek, tylko o innym id

INSERT INTO dbo.Kategorie_Sprzetu VALUES (NULL,'Pi�ki');


--********************* Tabela Sprzet
-- stany: wolna, rezerwacja, wypo�yczenie, wypo�yczenie-rezerwacja
-- sprawnosc: sprawna, uszkodzona,

INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do siatk�wki','wolna','sprawna','Zakupiona w 2016 roku');
INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do siatk�wki','wolna','sprawna',Null);
INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do siatk�wki','wolna','sprawna','Zakupiona w 2016 roku');
INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do koszyk�wki','wolna','uszkodzona','Uchodzi powietrze');
INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do koszyk�wki','wolna','sprawna','Zakupiona w 2015 roku');
INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do pi�ki no�nej','wolna','sprawna',Null);
INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do pi�ki no�nej','wolna','uszkodzona','Starta powierzchnia');
INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do pi�ki r�cznej','wolna','sprawna',null);

--********************* Tabela Rezerwacje
-- status: 
-- typ rezerwacji
-- INSERT INTO dbo.Sprzet VALUES (1,'status',0,'2016-12-07 13:01','2016-12-14 13:01',null,'typ_rezerwacji');

--********************* Tabela Rezerwacja_Sprzet


--********************* Tabela Wypozyczenia


--********************* Tabela Cennik ?


--********************* Tabela CennnikZnizki ?


--********************* Tabela Znizki ?