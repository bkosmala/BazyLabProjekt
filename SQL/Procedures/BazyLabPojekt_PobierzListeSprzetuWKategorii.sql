/*Procedura pobieraj�ca list� sprz�tu w danej kategorii - u�ywaj�c id_kategorii */
CREATE PROCEDURE [BazyLabPojekt_PobierzListeSprzetuWKategorii] @id int
AS
BEGIN

Select * from dbo.Sprzet where id_kat=@id;

END