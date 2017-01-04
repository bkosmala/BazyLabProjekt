if exists(select 1 from master.dbo.sysdatabases where name = 'CentrumSportu') drop database CentrumSportu
CREATE DATABASE CentrumSportu;
GO
USE CentrumSportu
GO

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
)

CREATE TABLE Kategorie_Sprzetu 
(
id_kategorii INT IDENTITY(1,1) CONSTRAINT kategoria_PK PRIMARY KEY,
id_cennika INT null, 
nazwa_kat VARCHAR(40) NOT NULL,
CONSTRAINT Kategorie_Sprzetu_cennik_FK FOREIGN KEY(id_cennika) REFERENCES Cenniki(id_Cennik)
)

CREATE TABLE Sprzet
(
id_sprzetu INT IDENTITY(1,1) CONSTRAINT sprzet_PK PRIMARY KEY,
id_kat INT not null,
nazwa VARCHAR(30) NOT NULL,
stan VARCHAR(30) NULL,
sprawnosc BIT NULL,
opis VARCHAR(255) NULL,
CONSTRAINT Sprzet_kategoria_FK FOREIGN KEY(id_kat) REFERENCES Kategorie_Sprzetu(id_kategorii),
CHECK (stan in ('dostêpny', 'wypo¿yczony'))
)

CREATE TABLE Wypozyczenia
(
id_wypozyczenia INT IDENTITY(1,1) CONSTRAINT wypozyczenie_PK PRIMARY KEY,
data_wypozyczenia DATETIME NOT NULL,
data_zwrotu DATETIME NULL, 
uwagi VARCHAR(255) NULL,
CONSTRAINT wypoz_check_daty CHECK(data_wypozyczenia < isnull(data_zwrotu,dateadd(y,1,data_wypozyczenia)))
)

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

CREATE TABLE Rezerwacja_Sprzet
(
id_rezerwacji INT NOT NULL,
id_sprzetu INT NOT NULL,
CONSTRAINT Rezerwacja_Sprzet_rezerwacja_FK FOREIGN KEY(id_rezerwacji) REFERENCES Rezerwacje(id_rezerwacji),
CONSTRAINT Rezerwacja_Sprzet_sprzet_FK FOREIGN KEY(id_sprzetu) REFERENCES Sprzet(id_sprzetu) 
)