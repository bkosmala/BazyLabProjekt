CREATE DATABASE CentrumSportu;

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
id_Cennik INT IDENTITY(1,1) CONSTRAINT Znizki_PK PRIMARY KEY,
cena_Podstawowa float not null,
waluta varchar(3) not null,
CONSTRAINT cena_nie_ujemna CHECK(cena_Podstawowa>=0)
)

CREATE TABLE CennikZnizki
(
idZnizka int not null,
idCennik int not null,
CONSTRAINT Znizka_FK FOREIGN KEY(idZnizka) REFERENCES Znizki(id_Znizka), 
CONSTRAINT Cennik_FK FOREIGN KEY(idCennik) REFERENCES Cenniki(id_Cennik)
)

CREATE TABLE Kategorie_Sprzetu 
(
id_kategorii INT IDENTITY(1,1) CONSTRAINT kategoria_PK PRIMARY KEY,
id_cennika INT not null,
nazwa_kat VARCHAR(40) NOT NULL,
CONSTRAINT cennik_FK FOREIGN KEY(id_cennika) REFERENCES Cenniki(idCennik)
)

CREATE TABLE Sprzet
(
id_sprzetu INT IDENTITY(1,1) CONSTRAINT sprzet_PK PRIMARY KEY,
id_kat INT not null,
nazwa VARCHAR(20) NOT NULL,
stan VARCHAR(20) NULL,
sprawnosc VARCHAR(40) NULL,
opis VARCHAR(255) NULL,
CONSTRAINT kategoria_FK FOREIGN KEY(id_kat) REFERENCES Kategorie_Sprzetu(id_kategorii)
)

CREATE TABLE Wypozyczenie
(
id_wypozyczenia INT IDENTITY(1,1) CONSTRAINT wypozyczenie_PK PRIMARY KEY,
data_wypozyczenia DATETIME NOT NULL,
data_zwrotu DATETIME NULL, 
uwagi VARCHAR(255) NULL,
CONSTRAINT wypoz_check_daty CHECK(data_wypozyczenia < isnull(data_zwrotu,dateadd(y,1,data_wypozyczenia)
)

CREATE TABLE Rezerwacja
(
id_rezerwacji INT IDENTITY(1,1) CONSTRAINT rezerwacja_PK PRIMARY KEY,
status_rezerwacji VARCHAR(40),
czy_oplacona BIT NOT NULL,
od_terminu TIMESTAMP NOT NULL,
do_terminu TIMESTAMP NOT NULL,
CONSTRAINT rezerw_check_daty  CHECK(od_terminu < do_terminu)
)

CREATE TABLE Rezerwacja_Sprzet
(
id_rezerwacji INT NOT NULL,
id_sprzetu INT NOT NULL,
CONSTRAINT rezerwacja_FK FOREIGN KEY(id_rezerwacji) REFERENCES Rezerwacja(id_rezerwacji),
CONSTRAINT sprzet_FK FOREIGN KEY(id_sprzetu) REFERENCES Sprzet(id_sprzetu) 
)