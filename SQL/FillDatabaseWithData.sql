USE CentrumSportu
GO

--********************* Tabela Kategorie_Sprzetu
-- bardziej w sensie rodzaj ni� kategoria, np: 
-- sprz�t w kategorii pi�ki do siatk�wki, to bedzie ile� tam takich samych pi�ek, tylko o innym id

INSERT INTO dbo.Kategorie_Sprzetu VALUES (NULL,'Pi�ki');
INSERT INTO dbo.Kategorie_Sprzetu VALUES (NULL,'Akcesoria p�ywackie');
INSERT INTO dbo.Kategorie_Sprzetu VALUES (NULL,'Rakietki');
INSERT INTO dbo.Kategorie_Sprzetu VALUES (NULL,'Akcesoria do wspinaczki');

--********************* Tabela Sprzet
-- stany: dost�pny, wypo�yczony
-- sprawnosc: BOOLEAN

INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do siatk�wki','dost�pny','sprawna','Zakupiona w 2016 roku');
INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do siatk�wki','dost�pny','sprawna',Null);
INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do siatk�wki','dost�pny','sprawna','Zakupiona w 2016 roku');
INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do koszyk�wki','dost�pny','uszkodzona','Uchodzi powietrze');
INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do koszyk�wki','dost�pny','sprawna','Zakupiona w 2015 roku');
INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do pi�ki no�nej','dost�pny','sprawna',Null);
INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do pi�ki no�nej','dost�pny','uszkodzona','Starta powierzchnia');
INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do pi�ki r�cznej','dost�pny','sprawna',null);
INSERT INTO dbo.Sprzet VALUES (2, 'Okulary p�ywackie', 'dost�pny', 'sprawna', null);
INSERT INTO dbo.Sprzet VALUES (2, 'Maska p�ywacka', 'dost�pny', 'sprawna', null)
INSERT INTO dbo.Sprzet VALUES (3, 'Rakietka do squasha', 'dost�pny', 'sprawna', null);
INSERT INTO dbo.Sprzet VALUES (3, 'Rakietka do squasha', 'dost�pny', 'sprawna', null);
INSERT INTO dbo.Sprzet VALUES (3, 'Rakietka do badmintona', 'dost�pny', 'sprawna', null);
INSERT INTO dbo.Sprzet VALUES (3, 'Rakietka do tenisa sto�owego', 'dost�pny', 'sprawna', null);


--********************* Tabela Rezerwacje
-- status: 
-- typ rezerwacji
-- INSERT INTO dbo.Sprzet VALUES (1,'status',0,'2016-12-07 13:01','2016-12-14 13:01',null,'typ_rezerwacji');

--********************* Tabela Rezerwacja_Sprzet


--********************* Tabela Wypozyczenia


--********************* Tabela Cennik ?


--********************* Tabela CennnikZnizki ?


--********************* Tabela Znizki ?