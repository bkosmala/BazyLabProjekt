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

INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do siatk�wki','dost�pny',1,'Zakupiona w 2016 roku');
INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do siatk�wki','dost�pny',1,Null);
INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do siatk�wki','dost�pny',1,'Zakupiona w 2016 roku');
INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do koszyk�wki','dost�pny',0,'Uchodzi powietrze');
INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do koszyk�wki','dost�pny',1,'Zakupiona w 2015 roku');
INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do pi�ki no�nej','dost�pny',1,Null);
INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do pi�ki no�nej','dost�pny',0,'Starta powierzchnia');
INSERT INTO dbo.Sprzet VALUES (1,'Pi�ka do pi�ki r�cznej','dost�pny',1,null);
INSERT INTO dbo.Sprzet VALUES (2, 'Okulary p�ywackie', 'dost�pny', 1, null);
INSERT INTO dbo.Sprzet VALUES (2, 'Maska p�ywacka', 'dost�pny', 1, null)
INSERT INTO dbo.Sprzet VALUES (3, 'Rakietka do squasha', 'dost�pny', 1, null);
INSERT INTO dbo.Sprzet VALUES (3, 'Rakietka do squasha', 'dost�pny', 1, null);
INSERT INTO dbo.Sprzet VALUES (3, 'Rakietka do badmintona', 'dost�pny', 1, null);
INSERT INTO dbo.Sprzet VALUES (3, 'Rakietka do tenisa sto�owego', 'dost�pny', 1, null);


--********************* Tabela Rezerwacje
-- status: 
-- typ rezerwacji
-- INSERT INTO dbo.Sprzet VALUES (1,'status',0,'2016-12-07 13:01','2016-12-14 13:01',null);
INSERT INTO dbo.Sprzet VALUES ('oczekuj�ca', 1, '2017-02-28 10:00', '2017-02-28 13:00', null);
INSERT INTO dbo.Sprzet VALUES ('oczekuj�ca', 0, '2017-01-18 12:00', '2017-01-18 13:00', null);
INSERT INTO dbo.Sprzet VALUES ('oczekuj�ca', 1, '2017-01-25 08:00', '2017-01-25 12:00', null);
INSERT INTO dbo.Sprzet VALUES ('oczekuj�ca', 0, '2017-02-28 18:00', '2017-02-28 20:00', null);
INSERT INTO dbo.Sprzet VALUES ('oczekuj�ca', 1, '2017-02-25 10:00', '2017-02-25 13:00', null);
INSERT INTO dbo.Sprzet VALUES ('anulowana', 0, '2016-02-20 10:00', '2016-02-20 13:00', null);
INSERT INTO dbo.Sprzet VALUES ('zrealizowana', 1, '2016-03-16 10:00', '2016-03-16 11:00', null);
INSERT INTO dbo.Sprzet VALUES ('zrealizowana', 1, '2016-03-20 10:00', '2016-03-20 11:00', null);
INSERT INTO dbo.Sprzet VALUES ('anulowana', 0, '2017-03-20 10:00', '2017-03-20 13:00', null);
 
--********************* Tabela Rezerwacja_Sprzet


--********************* Tabela Wypozyczenia


--********************* Tabela Cennik ?


--********************* Tabela CennnikZnizki ?


--********************* Tabela Znizki ?