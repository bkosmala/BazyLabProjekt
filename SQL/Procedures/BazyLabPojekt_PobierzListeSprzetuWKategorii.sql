/*Procedura pobieraj¹ca listê sprzêtu w danej kategorii i jej podkategoriach - u¿ywaj¹c id_kategorii */
CREATE PROCEDURE [BazyLabPojekt_PobierzListeSprzetuWKategorii] @id int
AS
BEGIN

Select t1.id_sprzetu, t1.nazwa, t1.id_kat, t2.nazwa_kat from dbo.Sprzet as t1 join 
dbo.Kategorie as t2 on t1.id_kat=t2.id_kategorii
where id_kat=@id or id_kategoria_nadrzedna=@id

END