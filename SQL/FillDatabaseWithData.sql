USE CentrumSportu
GO

-- dane : wypo¿yczalnia sprzêtu dla sportów dru¿ynowych
-- dane wzorowane na : http://www.sport-shop.pl/pilka-nozna-c-36.html

--********************* Tabela Kategorie
-- do zapytañ:
-- kategoria która ma kategoriê nadrzêdn¹ równ¹ null to kategoria g³ówna

-- kilka kategorii nadrzêdnych bêdzie bez podkategorii
-- kilka podkategorii w ró¿nych kategoriach nie bêd¹ mia³y przypisanego sprzêtu
-- kategorie g³owne, które nie maj¹ podkategorii a maj¹ przypisany sprzêt

-- kategorie g³ówne
SET IDENTITY_INSERT dbo.Kategorie ON
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (1,Null,'Pi³ka no¿na');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (3,Null,'Koszykówka'); -- bez sprzêtu z podkategoriami
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (5,Null,'Unihokej'); -- bez sprzêtu i podkategorii
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (6,Null,'Rugby'); -- bez podkategorii, bez sprzêtu
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (2,Null,'Siatkówka'); 
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (7,Null,'Baseball'); -- bez podkategorii, ze sprzêtem
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (4,Null,'Pi³ka rêczna');

-- kategorie drugorzêdne
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (21,3,'Tablice trenera');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (8,1,'Pi³ki No¿ne');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (14,4,'Akcesoria do pi³ek');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (10,1,'Buty pi³karskie');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (11,1,'Ochraniacze');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (23,3,'Pi³ki');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (12,1,'Torby pi³karskie');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (13,1,'Rêkawice bramkarskie');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (22,3,'Stojaki');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (15,4,'Siatki');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (16,4,'Akcesoria sêdziowskie')
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (17,4,'Frotki');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (18,4,'Akcesoria do pi³ek');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (19,2,'Siatki');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (20,2,'Buty');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (9,1,'Akcesoria');




--********************* Tabela Sprzet

-- stany: dostêpny, wypo¿yczony - wycofujê siê z tego : mo¿na to sprawdziæ zapytaniem - zamiast tego data zakupu
-- sprawnosc: BOOLEAN
-- sens jest taki, ¿e ka¿dy rodzaj np. Pi³ka no¿na halowa MAX 1000 mo¿e mieæ kilka egzemplarzy ró¿ni¹cych siê jedynie id i u¿ytkowaniem

-- zapytania - œrednia iloœæ egzemplarzy w podkategoriach kategorii pi³ka nozna

-- 10 sprawnych przedmiotów o najwiêkszej wartoœci ze wszystkich kategorii

INSERT INTO dbo.Sprzet VALUES (8,'Pi³ka no¿na halowa MAX 1000','2016-05-12',100.00,1);
INSERT INTO dbo.Sprzet VALUES (8,'Pi³ka no¿na halowa MAX 1000','2016-05-12',100.00,0);
INSERT INTO dbo.Sprzet VALUES (8,'Pi³ka no¿na halowa MAX 1000','2016-05-12',100.00,1);
INSERT INTO dbo.Sprzet VALUES (8,'Pi³ka no¿na halowa MAX 1000','2016-05-12',100.00,1);
INSERT INTO dbo.Sprzet VALUES (8,'Pi³ka no¿na halowa MAX 1000','2016-05-12',100.00,0);
INSERT INTO dbo.Sprzet VALUES (8,'Pi³ka no¿na Team Training 5','2015-08-21',42.80,1);
INSERT INTO dbo.Sprzet VALUES (8,'Pi³ka no¿na Team Training 5','2015-08-21',42.80,1);
INSERT INTO dbo.Sprzet VALUES (8,'Pi³ka no¿na Team Training 5','2015-08-21',42.80,0);
INSERT INTO dbo.Sprzet VALUES (8,'Pi³ka no¿na Team Training 5','2015-08-21',42.80,1);
INSERT INTO dbo.Sprzet VALUES (8,'Pi³ka no¿na PSG Prestige 5','2014-03-01',79.99,1);

INSERT INTO dbo.Sprzet VALUES (10,'Ochraniacze pi³karskie Evo Speed 5','2015-08-20',24.99,1);
INSERT INTO dbo.Sprzet VALUES (10,'Ochraniacze pi³karskie Evo Speed 5','2015-08-10',24.99,0);
INSERT INTO dbo.Sprzet VALUES (10,'Ochraniacze pi³karskie Predator Club','2015-07-10',37.99,1)

INSERT INTO dbo.Sprzet VALUES (12,'Torba Club Team Hardcase M 54L','2016-07-10',139.99,1)
INSERT INTO dbo.Sprzet VALUES (12,'Torba pi³karska Trunk I 60L Spokey','2016-10-10',59.99,1)

INSERT INTO dbo.Sprzet VALUES (9,'Pompka do pi³ki Spokey Pampero 12 81603','2016-07-10',12.99,1)
INSERT INTO dbo.Sprzet VALUES (9,'Pompka do pi³ki Spokey Pampero 12 81603','2016-07-11',12.99,1)
INSERT INTO dbo.Sprzet VALUES (9,'Pompka do pi³ki Spokey Pampero 12 81603','2016-07-10',12.99,0)
INSERT INTO dbo.Sprzet VALUES (9,'Gwizdek sêdziowski','2016-10-15',29.99,1)
INSERT INTO dbo.Sprzet VALUES (9,'Gwizdek sêdziowski','2016-10-14',29.99,1)
INSERT INTO dbo.Sprzet VALUES (9,'Gwizdek sêdziowski','2016-10-15',29.99,1)

INSERT INTO dbo.Sprzet VALUES (19,'Siatka do siatkówki 82266','2016-01-15',49.99,1)
INSERT INTO dbo.Sprzet VALUES (19,'Siatka do siatkówki 82266','2016-01-18',49.99,1)
INSERT INTO dbo.Sprzet VALUES (19,'Siatka uniwersalna Telescop','2016-01-18',189.00,1)
INSERT INTO dbo.Sprzet VALUES (19,'Siatka uniwersalna Telescop','2016-01-18',179.00,1)

INSERT INTO dbo.Sprzet VALUES (14,'Manometr PGA10 Molten','2016-01-18',54.99,1)
INSERT INTO dbo.Sprzet VALUES (14,'Manometr PGA10 Molten','2016-09-18',48.00,1)

INSERT INTO dbo.Sprzet VALUES (16,'Liczyd³o do gier - tablica wyników','2015-01-18',74.99,1)

INSERT INTO dbo.Sprzet VALUES (18,'Torba na 10-12 pi³ek Select','2015-01-10',69.99,1)
INSERT INTO dbo.Sprzet VALUES (18,'Torba na 10-12 pi³ek Select','2015-12-10',79.99,1)

INSERT INTO dbo.Sprzet VALUES (17,'Frotka Wristband','2015-09-10',15.99,1)

INSERT INTO dbo.Sprzet VALUES (7,'Kij baseballowy z aluminium Rucanor','2016-11-19',28.99,1)
INSERT INTO dbo.Sprzet VALUES (7,'Kij baseballowy z aluminium Rucanor','2016-12-19',27.99,1)
INSERT INTO dbo.Sprzet VALUES (7,'Pi³ka do baseballu','2016-12-19',48.99,1)
INSERT INTO dbo.Sprzet VALUES (7,'Pi³ka do baseballu TS','2016-12-19',48.99,1)
INSERT INTO dbo.Sprzet VALUES (7,'Pi³ka do baseballu','2016-02-19',75.99,1)
INSERT INTO dbo.Sprzet VALUES (7,'Pi³ka do baseballu','2016-03-19',68.99,1)


--********************* Tabela Rezerwacje
-- status: 
-- typ rezerwacji
--INSERT INTO dbo.Rezerwacje VALUES ()

--********************* Tabela Rezerwacja_Sprzet


--********************* Tabela Wypozyczenia
