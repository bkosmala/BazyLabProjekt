USE CentrumSportu
GO

-- dane : wypo�yczalnia sprz�tu dla sport�w dru�ynowych
-- dane wzorowane na : http://www.sport-shop.pl/pilka-nozna-c-36.html

--********************* Tabela Kategorie
-- do zapyta�:
-- kategoria kt�ra ma kategori� nadrz�dn� r�wn� null to kategoria g��wna

-- kilka kategorii nadrz�dnych b�dzie bez podkategorii
-- kilka podkategorii w r�nych kategoriach nie b�d� mia�y przypisanego sprz�tu
-- kategorie g�owne, kt�re nie maj� podkategorii a maj� przypisany sprz�t

-- kategorie g��wne
SET IDENTITY_INSERT dbo.Kategorie ON
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (1,Null,'Pi�ka no�na');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (3,Null,'Koszyk�wka'); -- bez sprz�tu z podkategoriami
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (5,Null,'Unihokej'); -- bez sprz�tu i podkategorii
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (6,Null,'Rugby'); -- bez podkategorii, bez sprz�tu
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (2,Null,'Siatk�wka'); 
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (7,Null,'Baseball'); -- bez podkategorii, ze sprz�tem
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (4,Null,'Pi�ka r�czna');

-- kategorie drugorz�dne
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (21,3,'Tablice trenera');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (8,1,'Pi�ki No�ne');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (14,4,'Akcesoria do pi�ek');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (10,1,'Buty pi�karskie');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (11,1,'Ochraniacze');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (23,3,'Pi�ki');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (12,1,'Torby pi�karskie');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (13,1,'R�kawice bramkarskie');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (22,3,'Stojaki');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (15,4,'Siatki');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (16,4,'Akcesoria s�dziowskie')
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (17,4,'Frotki');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (18,4,'Akcesoria do pi�ek');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (19,2,'Siatki');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (20,2,'Buty');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (9,1,'Akcesoria');




--********************* Tabela Sprzet

-- stany: dost�pny, wypo�yczony - wycofuj� si� z tego : mo�na to sprawdzi� zapytaniem - zamiast tego data zakupu
-- sprawnosc: BOOLEAN
-- sens jest taki, �e ka�dy rodzaj np. Pi�ka no�na halowa MAX 1000 mo�e mie� kilka egzemplarzy r�ni�cych si� jedynie id i u�ytkowaniem

-- zapytania - �rednia ilo�� egzemplarzy w podkategoriach kategorii pi�ka nozna

-- 10 sprawnych przedmiot�w o najwi�kszej warto�ci ze wszystkich kategorii

INSERT INTO dbo.Sprzet VALUES (8,'Pi�ka no�na halowa MAX 1000','2016-05-12',100.00,1);
INSERT INTO dbo.Sprzet VALUES (8,'Pi�ka no�na halowa MAX 1000','2016-05-12',100.00,0);
INSERT INTO dbo.Sprzet VALUES (8,'Pi�ka no�na halowa MAX 1000','2016-05-12',100.00,1);
INSERT INTO dbo.Sprzet VALUES (8,'Pi�ka no�na halowa MAX 1000','2016-05-12',100.00,1);
INSERT INTO dbo.Sprzet VALUES (8,'Pi�ka no�na halowa MAX 1000','2016-05-12',100.00,0);
INSERT INTO dbo.Sprzet VALUES (8,'Pi�ka no�na Team Training 5','2015-08-21',42.80,1);
INSERT INTO dbo.Sprzet VALUES (8,'Pi�ka no�na Team Training 5','2015-08-21',42.80,1);
INSERT INTO dbo.Sprzet VALUES (8,'Pi�ka no�na Team Training 5','2015-08-21',42.80,0);
INSERT INTO dbo.Sprzet VALUES (8,'Pi�ka no�na Team Training 5','2015-08-21',42.80,1);
INSERT INTO dbo.Sprzet VALUES (8,'Pi�ka no�na PSG Prestige 5','2014-03-01',79.99,1);

INSERT INTO dbo.Sprzet VALUES (10,'Ochraniacze pi�karskie Evo Speed 5','2015-08-20',24.99,1);
INSERT INTO dbo.Sprzet VALUES (10,'Ochraniacze pi�karskie Evo Speed 5','2015-08-10',24.99,0);
INSERT INTO dbo.Sprzet VALUES (10,'Ochraniacze pi�karskie Predator Club','2015-07-10',37.99,1)

INSERT INTO dbo.Sprzet VALUES (12,'Torba Club Team Hardcase M 54L','2016-07-10',139.99,1)
INSERT INTO dbo.Sprzet VALUES (12,'Torba pi�karska Trunk I 60L Spokey','2016-10-10',59.99,1)

INSERT INTO dbo.Sprzet VALUES (9,'Pompka do pi�ki Spokey Pampero 12 81603','2016-07-10',12.99,1)
INSERT INTO dbo.Sprzet VALUES (9,'Pompka do pi�ki Spokey Pampero 12 81603','2016-07-11',12.99,1)
INSERT INTO dbo.Sprzet VALUES (9,'Pompka do pi�ki Spokey Pampero 12 81603','2016-07-10',12.99,0)
INSERT INTO dbo.Sprzet VALUES (9,'Gwizdek s�dziowski','2016-10-15',29.99,1)
INSERT INTO dbo.Sprzet VALUES (9,'Gwizdek s�dziowski','2016-10-14',29.99,1)
INSERT INTO dbo.Sprzet VALUES (9,'Gwizdek s�dziowski','2016-10-15',29.99,1)

INSERT INTO dbo.Sprzet VALUES (19,'Siatka do siatk�wki 82266','2016-01-15',49.99,1)
INSERT INTO dbo.Sprzet VALUES (19,'Siatka do siatk�wki 82266','2016-01-18',49.99,1)
INSERT INTO dbo.Sprzet VALUES (19,'Siatka uniwersalna Telescop','2016-01-18',189.00,1)
INSERT INTO dbo.Sprzet VALUES (19,'Siatka uniwersalna Telescop','2016-01-18',179.00,1)

INSERT INTO dbo.Sprzet VALUES (14,'Manometr PGA10 Molten','2016-01-18',54.99,1)
INSERT INTO dbo.Sprzet VALUES (14,'Manometr PGA10 Molten','2016-09-18',48.00,1)

INSERT INTO dbo.Sprzet VALUES (16,'Liczyd�o do gier - tablica wynik�w','2015-01-18',74.99,1)

INSERT INTO dbo.Sprzet VALUES (18,'Torba na 10-12 pi�ek Select','2015-01-10',69.99,1)
INSERT INTO dbo.Sprzet VALUES (18,'Torba na 10-12 pi�ek Select','2015-12-10',79.99,1)

INSERT INTO dbo.Sprzet VALUES (17,'Frotka Wristband','2015-09-10',15.99,1)

INSERT INTO dbo.Sprzet VALUES (7,'Kij baseballowy z aluminium Rucanor','2016-11-19',28.99,1)
INSERT INTO dbo.Sprzet VALUES (7,'Kij baseballowy z aluminium Rucanor','2016-12-19',27.99,1)
INSERT INTO dbo.Sprzet VALUES (7,'Pi�ka do baseballu','2016-12-19',48.99,1)
INSERT INTO dbo.Sprzet VALUES (7,'Pi�ka do baseballu TS','2016-12-19',48.99,1)
INSERT INTO dbo.Sprzet VALUES (7,'Pi�ka do baseballu','2016-02-19',75.99,1)
INSERT INTO dbo.Sprzet VALUES (7,'Pi�ka do baseballu','2016-03-19',68.99,1)


--********************* Tabela Rezerwacje
-- status: 
-- typ rezerwacji
--INSERT INTO dbo.Rezerwacje VALUES ()

--********************* Tabela Rezerwacja_Sprzet


--********************* Tabela Wypozyczenia
