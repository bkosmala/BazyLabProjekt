/* Wypo¿yczenia sprzêtu w danej kategorii, którego wartoœæ (cena zakupu ) jest wiêksza od podanej jako parametr */
Use CentrumSportu
go
CREATE PROCEDURE [BazyLabPojekt_RezerwacjeKategoriaCena] @idKat int, @cenaZakupu float
AS
BEGIN



Select * from Rezerwacja_Sprzet as s join (
Select t1.id_sprzetu, t1.nazwa, t1.id_kat, t2.nazwa_kat from dbo.Sprzet as t1 join 
dbo.Kategorie as t2 on t1.id_kat=t2.id_kategorii
where (id_kat=@idKat or id_kategoria_nadrzedna=@idKat) and cena_zakupu>@cenaZakupu ) as p 
on s.id_sprzetu = p.id_sprzetu

END