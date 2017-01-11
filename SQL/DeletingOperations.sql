USE CentrumSportu
GO
delete from dbo.Sprzet;
delete from dbo.Kategorie;
delete from dbo.Wypozyczenia
delete from dbo.Rezerwacje
delete from Rezerwacja_Sprzet


ALTER TABLE [dbo].[Rezerwacje] DROP CONSTRAINT [rezerw_check_daty]
GO
ALTER TABLE [dbo].[Rezerwacje] DROP CONSTRAINT [Rezerwacje_Wypozyczenie_FK]
GO
ALTER TABLE [dbo].[Wypozyczenia] DROP CONSTRAINT [wypoz_check_daty]
GO
ALTER TABLE [dbo].[Rezerwacja_Sprzet] DROP CONSTRAINT [Rezerwacja_Sprzet_sprzet_FK]
GO
ALTER TABLE [dbo].[Rezerwacja_Sprzet] DROP CONSTRAINT [Rezerwacja_Sprzet_rezerwacja_FK]
GO
ALTER TABLE [dbo].[Kategorie_Sprzetu] DROP CONSTRAINT [Kategorie_Sprzetu_cennik_FK]

/****** Object:  Table [dbo].[Rezerwacje]    Script Date: 2017-01-10 18:56:57 ******/
drop table [dbo].[Wypozyczenia]
DROP TABLE [dbo].[Rezerwacje]
drop table dbo.Rezerwacja_Sprzet
drop table dbo



DROP TABLE [dbo].[Znizki]
GO
DROP TABLE [dbo].[Cenniki]
GO
DROP TABLE [dbo].[Sprzet]
GO
drop table dbo.CennikZnizki;
go
drop table dbo.Cenniki
go 
drop table dbo.Kategorie_Sprzetu
go 
use master
go
drop database CentrumSportu

