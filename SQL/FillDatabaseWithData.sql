USE CentrumSportu
GO

--********************* Tabela Kategorie_Sprzetu
-- bardziej w sensie rodzaj ni¿ kategoria, np: 
-- sprzêt w kategorii pi³ki do siatkówki, to bedzie ileœ tam takich samych pi³ek, tylko o innym id

INSERT INTO dbo.Kategorie_Sprzetu VALUES (NULL,'Pi³ki do siatkówki');
INSERT INTO dbo.Kategorie_Sprzetu VALUES (NULL,'Pi³ki do gry w pi³kê no¿n¹');
INSERT INTO dbo.Kategorie_Sprzetu VALUES (NULL,'Pi³ki do koszykówki');
INSERT INTO dbo.Kategorie_Sprzetu VALUES (NULL,'Pi³ki do gry w pi³kê rêczn¹');

--********************* Tabela Sprzet
-- stany: wolna, rezerwacja, wypo¿yczenie, wypo¿yczenie-rezerwacja
-- sprawnosc: sprawna, uszkodzona,

INSERT INTO dbo.Sprzet VALUES (1,'Pi³ka zwyk³a','wolna','sprawna','Zakupiona w 2016 roku');