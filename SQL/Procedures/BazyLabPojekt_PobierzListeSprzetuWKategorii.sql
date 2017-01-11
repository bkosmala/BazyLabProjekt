/*Procedura pobieraj¹ca listê sprzêtu w danej kategorii - u¿ywaj¹c id_kategorii */
CREATE PROCEDURE [BazyLabPojekt_PobierzListeSprzetuWKategorii] @id int
AS
BEGIN

Select * from dbo.Sprzet where id_kat=@id;

END