USE CentrumSportu
GO

--********************* Tabela Kategorie_Sprzetu
-- bardziej w sensie rodzaj ni¿ kategoria, np: 
-- sprzêt w kategorii pi³ki do siatkówki, to bedzie ileœ tam takich samych pi³ek, tylko o innym id

INSERT INTO dbo.Kategorie_Sprzetu VALUES (NULL,'Pi³ki');
INSERT INTO dbo.Kategorie_Sprzetu VALUES (NULL,'Akcesoria p³ywackie');
INSERT INTO dbo.Kategorie_Sprzetu VALUES (NULL,'Rakietki');
INSERT INTO dbo.Kategorie_Sprzetu VALUES (NULL,'Akcesoria do wspinaczki');

--********************* Tabela Sprzet
-- stany: dostêpny, wypo¿yczony
-- sprawnosc: BOOLEAN

INSERT INTO dbo.Sprzet VALUES (1,'Pi³ka do siatkówki','dostêpny','sprawna','Zakupiona w 2016 roku');
INSERT INTO dbo.Sprzet VALUES (1,'Pi³ka do siatkówki','dostêpny','sprawna',Null);
INSERT INTO dbo.Sprzet VALUES (1,'Pi³ka do siatkówki','dostêpny','sprawna','Zakupiona w 2016 roku');
INSERT INTO dbo.Sprzet VALUES (1,'Pi³ka do koszykówki','dostêpny','uszkodzona','Uchodzi powietrze');
INSERT INTO dbo.Sprzet VALUES (1,'Pi³ka do koszykówki','dostêpny','sprawna','Zakupiona w 2015 roku');
INSERT INTO dbo.Sprzet VALUES (1,'Pi³ka do pi³ki no¿nej','dostêpny','sprawna',Null);
INSERT INTO dbo.Sprzet VALUES (1,'Pi³ka do pi³ki no¿nej','dostêpny','uszkodzona','Starta powierzchnia');
INSERT INTO dbo.Sprzet VALUES (1,'Pi³ka do pi³ki rêcznej','dostêpny','sprawna',null);
INSERT INTO dbo.Sprzet VALUES (2, 'Okulary p³ywackie', 'dostêpny', 'sprawna', null);
INSERT INTO dbo.Sprzet VALUES (2, 'Maska p³ywacka', 'dostêpny', 'sprawna', null)
INSERT INTO dbo.Sprzet VALUES (3, 'Rakietka do squasha', 'dostêpny', 'sprawna', null);
INSERT INTO dbo.Sprzet VALUES (3, 'Rakietka do squasha', 'dostêpny', 'sprawna', null);
INSERT INTO dbo.Sprzet VALUES (3, 'Rakietka do badmintona', 'dostêpny', 'sprawna', null);
INSERT INTO dbo.Sprzet VALUES (3, 'Rakietka do tenisa sto³owego', 'dostêpny', 'sprawna', null);


--********************* Tabela Rezerwacje
-- status: 
-- typ rezerwacji
-- INSERT INTO dbo.Sprzet VALUES (1,'status',0,'2016-12-07 13:01','2016-12-14 13:01',null,'typ_rezerwacji');

--********************* Tabela Rezerwacja_Sprzet


--********************* Tabela Wypozyczenia


--********************* Tabela Cennik ?


--********************* Tabela CennnikZnizki ?


--********************* Tabela Znizki ?