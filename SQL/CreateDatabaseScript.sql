use model;

GO

if exists(select 1 from master.dbo.sysdatabases where name = 'CentrumSportu') drop database CentrumSportu
GO
CREATE DATABASE CentrumSportu;
GO
USE CentrumSportu
GO
/*
CREATE TABLE Znizki
(
id_Znizka INT IDENTITY(1,1) CONSTRAINT Znizki_PK PRIMARY KEY,
nazwa varchar(50) not null,
wartosc float not null -- wartosc procentowa zapisna jako float
CONSTRAINT wartosc_znizki_jako_procent CHECK(wartosc >=0 and wartosc<=1)
)

CREATE TABLE Cenniki
(
id_Cennik INT IDENTITY(1,1) CONSTRAINT Cennik_PK PRIMARY KEY,
cena_Podstawowa float not null,
waluta varchar(3) not null,
data_utworzenia datetime not null,
data_modyfikacji datetime null,
nazwa varchar(100) null,
opis varchar(250) null,
CONSTRAINT cena_nie_ujemna CHECK(cena_Podstawowa>=0),
CONSTRAINT cennik_check_daty CHECK(data_utworzenia < isnull(data_modyfikacji,dateadd(y,1,data_utworzenia)))
)

CREATE TABLE CennikZnizki
(
id_Znizka int not null,
id_Cennik int not null,
CONSTRAINT CennikZnizki_Znizka_FK FOREIGN KEY(id_Znizka) REFERENCES Znizki(id_Znizka), 
CONSTRAINT CennikZnizki_Cennik_FK FOREIGN KEY(id_Cennik) REFERENCES Cenniki(id_Cennik)
)*/

-- kategorie mog¹ teraz mieæ podkategorie - wszystko razem w jednej tabeli - materia³ do ciekawych zapytañ
CREATE TABLE Kategorie 
(
	id_kategorii INT IDENTITY(1,1) CONSTRAINT kategoria_PK PRIMARY KEY,
	id_kategoria_nadrzedna INT null,
	--id_cennika INT null, 
	nazwa_kat VARCHAR(40) NOT NULL,
	--CONSTRAINT Kategorie_Sprzetu_cennik_FK FOREIGN KEY(id_cennika) REFERENCES Cenniki(id_Cennik)
	CONSTRAINT Kategorie_Podkategorie_FK FOREIGN KEY(id_kategoria_nadrzedna) REFERENCES Kategorie(id_kategorii) -- rekurencja
)

GO

CREATE TABLE Sprzet
(
	id_sprzetu INT IDENTITY(1,1) CONSTRAINT sprzet_PK PRIMARY KEY,
	id_kat INT not null,
	nazwa VARCHAR(50) NOT NULL,
	data_zakupu date not NULL,
	cena_zakupu decimal(9,2) null,
	sprawnosc BIT NULL,
	CONSTRAINT Sprzet_kategoria_FK FOREIGN KEY(id_kat) REFERENCES Kategorie(id_kategorii),
	CONSTRAINT sprzet_check_cena_zakupu CHECK( cena_zakupu>0)
)

GO

CREATE TABLE Wypozyczenia
(
	id_wypozyczenia INT IDENTITY(1,1) CONSTRAINT wypozyczenie_PK PRIMARY KEY,
	data_wypozyczenia DATETIME NOT NULL,
	data_zwrotu DATETIME NULL, 
	uwagi VARCHAR(255) NULL,
	CONSTRAINT wypoz_check_daty CHECK(data_wypozyczenia < isnull(data_zwrotu,dateadd(y,1,data_wypozyczenia)))
)

GO

CREATE TABLE Rezerwacje
(
	id_rezerwacji INT IDENTITY(1,1) CONSTRAINT rezerwacja_PK PRIMARY KEY,
	status_rezerwacji VARCHAR(40),
	czy_oplacona BIT NOT NULL,
	data_rezerwacji DATETIME NOT NULL,
	waznosc_do DATETIME NOT NULL,
	id_wypozyczenia INT NULL,
	--typ_rezerwacji varchar(30) not null, -- wyrzucone, w celu uproszcenia - zrobione do IO
	CONSTRAINT rezerw_check_daty  CHECK(data_rezerwacji < waznosc_do),
	CONSTRAINT Rezerwacje_Wypozyczenie_FK FOREIGN KEY(id_wypozyczenia) REFERENCES Wypozyczenia(id_wypozyczenia),
	CHECK (status_rezerwacji in ('oczekuj¹ca', 'anulowana', 'zrealizowana'))
)

GO

CREATE TABLE Rezerwacja_Sprzet
(
	id_rezerwacji INT NOT NULL,
	id_sprzetu INT NOT NULL,
	CONSTRAINT Rezerwacja_Sprzet_rezerwacja_FK FOREIGN KEY(id_rezerwacji) REFERENCES Rezerwacje(id_rezerwacji) ,
	CONSTRAINT Rezerwacja_Sprzet_sprzet_FK FOREIGN KEY(id_sprzetu) REFERENCES Sprzet(id_sprzetu) 
)

GO

SET IDENTITY_INSERT dbo.Kategorie ON
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (1,Null,'Pi³ka no¿na');
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (3,Null,'Koszykówka'); -- bez sprzêtu z podkategoriami
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (5,Null,'Unihokej'); -- bez sprzêtu i podkategorii
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (6,Null,'Rugby'); -- bez podkategorii, bez sprzêtu
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (2,Null,'Siatkówka'); 
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (7,Null,'Baseball'); -- bez podkategorii, ze sprzêtem
INSERT INTO dbo.Kategorie (id_kategorii,id_kategoria_nadrzedna,nazwa_kat) VALUES (4,Null,'Pi³ka rêczna');

GO

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


GO

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

GO
--********************* Tabela Wypozyczenia
INSERT INTO dbo.Wypozyczenia VALUES('2016-03-16 10:05', '2016-03-16 10:58', null);
INSERT INTO dbo.Wypozyczenia VALUES('2016-03-20 10:02', '2016-03-20 11:01', null);
INSERT INTO dbo.Wypozyczenia VALUES('2017-01-17 18:00', '2017-01-17 20:00', null);
INSERT INTO dbo.Wypozyczenia VALUES('2016-12-29 10:03', '2016-12-29 13:10', null);
INSERT INTO dbo.Wypozyczenia VALUES('2016-01-03 10:12', '2016-01-03 11:02', null);
INSERT INTO dbo.Wypozyczenia VALUES('2016-01-05 18:07', '2016-01-05 20:17', null);

GO
--********************* Tabela Rezerwacje
-- status: 
-- typ rezerwacji
--INSERT INTO dbo.Rezerwacje VALUES ()

INSERT INTO dbo.Rezerwacje VALUES ('zrealizowana', 1, '2016-03-16 10:00', '2016-03-16 11:00', 1);
INSERT INTO dbo.Rezerwacje VALUES ('zrealizowana', 1, '2016-03-20 10:00', '2016-03-20 11:00', 2);
INSERT INTO dbo.Rezerwacje VALUES ('zrealizowana', 0, '2017-01-17 18:00', '2017-01-17 20:00', 3);
INSERT INTO dbo.Rezerwacje VALUES ('zrealizowana', 1, '2016-12-29 10:00', '2016-12-29 13:00', 4);
INSERT INTO dbo.Rezerwacje VALUES ('zrealizowana', 1, '2016-01-03 10:00', '2016-01-03 11:00', 5);
INSERT INTO dbo.Rezerwacje VALUES ('zrealizowana', 1, '2016-01-05 18:00', '2016-01-05 20:00', 6);

INSERT INTO dbo.Rezerwacje VALUES ('oczekuj¹ca', 1, '2017-02-28 10:00', '2017-02-28 13:00', null);
INSERT INTO dbo.Rezerwacje VALUES ('oczekuj¹ca', 0, '2017-01-18 12:00', '2017-01-18 13:00', null);
INSERT INTO dbo.Rezerwacje VALUES ('oczekuj¹ca', 1, '2017-01-25 08:00', '2017-01-25 12:00', null);
INSERT INTO dbo.Rezerwacje VALUES ('oczekuj¹ca', 0, '2017-02-28 18:00', '2017-02-28 20:00', null);
INSERT INTO dbo.Rezerwacje VALUES ('oczekuj¹ca', 1, '2017-02-25 10:00', '2017-02-25 13:00', null);
INSERT INTO dbo.Rezerwacje VALUES ('oczekuj¹ca', 1, '2017-01-19 10:00', '2017-01-19 13:00', null);
INSERT INTO dbo.Rezerwacje VALUES ('oczekuj¹ca', 0, '2017-01-20 12:00', '2017-01-20 13:00', null);
INSERT INTO dbo.Rezerwacje VALUES ('oczekuj¹ca', 1, '2017-01-25 10:00', '2017-01-25 12:00', null);

INSERT INTO dbo.Rezerwacje VALUES ('anulowana', 0, '2016-02-20 10:00', '2016-02-20 13:00', null);
INSERT INTO dbo.Rezerwacje VALUES ('anulowana', 0, '2017-03-20 10:00', '2017-03-20 13:00', null);
INSERT INTO dbo.Rezerwacje VALUES ('anulowana', 0, '2016-12-20 10:00', '2016-12-20 13:00', null);
INSERT INTO dbo.Rezerwacje VALUES ('anulowana', 0, '2017-03-01 10:00', '2017-03-01 13:00', null);
 
GO
--********************* Tabela Rezerwacja_Sprzet
INSERT INTO dbo.Rezerwacja_Sprzet VALUES(1, 1);
INSERT INTO dbo.Rezerwacja_Sprzet VALUES(1, 6);
INSERT INTO dbo.Rezerwacja_Sprzet VALUES(1, 11);
INSERT INTO dbo.Rezerwacja_Sprzet VALUES(2, 1);
INSERT INTO dbo.Rezerwacja_Sprzet VALUES(2, 3);
INSERT INTO dbo.Rezerwacja_Sprzet VALUES(3, 4);
INSERT INTO dbo.Rezerwacja_Sprzet VALUES(4, 4);
INSERT INTO dbo.Rezerwacja_Sprzet VALUES(5, 1);
INSERT INTO dbo.Rezerwacja_Sprzet VALUES(6, 6);

GO
--********************* Tabela Cennik ?


--********************* Tabela CennnikZnizki ?


--********************* Tabela Znizki ?

--********************* Tabela Wypozyczenia
