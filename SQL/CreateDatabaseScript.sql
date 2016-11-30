CREATE DATABASE CentrumSportu;

USE CentrumSportu
GO

CREATE TABLE Znizki
(
idZnizka INT IDENTITY(1,1) CONSTRAINT Znizki_PK PRIMARY KEY,
nazwa varchar(50) not null,
wartosc float not null -- wartosc procentowa zapisna jako float
CONSTRAINT wartosc_znizki_jako_procent CHECK(wartosc >=0 and wartosc<=1)
)

CREATE TABLE Cenniki
(
idCennik INT IDENTITY(1,1) CONSTRAINT Znizki_PK PRIMARY KEY,
cenaPodstawowa float not null,
waluta varchar(3) not null,
CONSTRAINT cena_nie_ujemna CHECK(cenaPodstawowa>=0)
)

CREATE TABLE CennikZnizki
(
idZnizka int not null,
idCennik int not null,
CONSTRAINT Znizka_FK FOREIGN KEY(idZnizka) REFERENCES Znizki(idZnizka), 
CONSTRAINT Cennik_FK FOREIGN KEY(idCennik) REFERENCES Cenniki(idCennik)
)