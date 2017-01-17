-- Zapytania

--1
-- ID i nazwy kategorii wysokiego poziomu bez podkategorii posortowane rosn�co wzgl�dem nazwy
use CentrumSportu

Select id_kategorii, nazwa_kat from dbo.Kategorie as t1
 where id_kategoria_nadrzedna is null and
 not exists( select 1 from dbo.Kategorie where id_kategoria_nadrzedna=t1.id_kategorii)
 order by nazwa_kat asc

--2
-- ID, nazwy kategorii i liczba podkategorii dla kategorii g��wnych o wi�cej ni� 3 podkategoriach

select t1.nazwa_kat,t1.id_kategorii, t2.Ilosc_podkategorii from dbo.Kategorie as t1 join
(
select id_kategoria_nadrzedna, count(id_kategorii) as 'Ilosc_podkategorii'  from dbo.Kategorie
 where id_kategoria_nadrzedna is not null
 group by id_kategoria_nadrzedna having count(id_kategorii)>3
) as t2
on t1.id_kategorii = t2.id_kategoria_nadrzedna


-- 3
-- nazwa kategorii i jej id o 'a' lub 'b' jako trzeciej literze nazwy dla kategorii dowolnego poziomu

select nazwa_kat, id_kategorii from dbo.Kategorie where nazwa_kat like '__[a,b]%'

--4
-- nazwa i cena zakupu pierwszych 10 przedmiot�w o najwi�kszej warto�ci (sprawnych, czyli sprawnosc=1)

select distinct top 10  nazwa, cena_zakupu from dbo.Sprzet where sprawnosc=1 order by cena_zakupu desc 

--5
--  nazwy kategorii,id kategorii, liczba sprz�tu, dla podkategorii kategorii g��wnych kt�re maj� przypisany sprz�t zakupiony pomi�dzy 2015-12-10 - 2016-05-10
-- przy czym statystyki sprz�tu dotycz� w�a�nie sprz�tu zakupionego pomi�dzy 2015-12-10 - 2016-05-10
-- posortowane po nazwie malej�co

select t1.nazwa_kat,count(t1.nazwa_kat) as 'Ilo�� sprz�tu wg kryteri�w' from dbo.Kategorie as t1
join dbo.Sprzet as t2 on t2.id_kat=t1.id_kategorii
where data_zakupu between '2015-12-10' AND '2016-05-10'
group by t1.nazwa_kat
order by t1.nazwa_kat desc

--6
-- nazwy Kategorii g��wnych do kt�rych nie jest przypisany ani jeden egzemplarz sprz�tu i
-- dla kt�rych nie istnieje podkategoria kt�ra ma przypisany sprz�t
-- tzn. sprz�t nie mo�e by� przypisany ani do kategorii g��wnych ani ich podkategorii

select id_kategorii,nazwa_kat from (
select t1.id_kategorii,t1.nazwa_kat from dbo.Kategorie as t1
where t1.id_kategoria_nadrzedna is null and not exists
(
select 1 from dbo.Sprzet where id_kat = t1.id_kategorii 
)) as k1
where not exists
(
select 1 from dbo.Kategorie as t2
where t2.id_kategoria_nadrzedna=k1.id_kategorii and exists
(
select 1 from dbo.Sprzet where id_kat = t2.id_kategorii 
))


--7
-- �rednia cena zakupu pojedynczych egzemplarzy sprz�tu wg ich kategorii zaokr�glona do pe�nych jednostek i posortowana z do��czon�
-- nazw� kategorii

select t2.nazwa_kat,t1.id_kat,t1.sr as '�rednia cena w kategorii w pe�nych z�' from 
(select id_kat, cast(round(avg(cena_zakupu),0) as int) as 'sr' from dbo.Sprzet group by id_kat) as t1
join dbo.Kategorie as t2 on t1.id_kat=t2.id_kategorii

--8
-- liczba sprz�tu zakupionego w sierpniu roku 2015
select count(id_sprzetu) as 'ilo��' from dbo.Sprzet where datepart(year,data_zakupu) = 2015 and datepart(month,data_zakupu) = 8

--dalej np lista dost�pnego sprz�tu w wybranej kategorii, ze sprawdzeniem czy istnieje rezerwacja zaczynaj�ca si�
-- w okresie 3 dni do przodu
--  sprz�t, kt�ry nigdy nie by� wypo�yczony (m�g� by� zarezerwowany itp)
--itd

-- 9 podaj id i nazwiska klient�w, kt�rzy wypo�yczyli sprz�t z kategorii 'Pi�ki No�ne' 
select id_klienta, nazwisko from Klient where id_klienta in 
(select id_klienta from Rezerwacje where id_wypozyczenia is not null and id_rezerwacji in 
(select id_rezerwacji from Rezerwacja_Sprzet where id_sprzetu in (select id_sprzetu from Sprzet where id_kat = 8)))

-- 10 poda� ca�kowit� cen� za godzin� dla ka�dej z rezerwacji
select rs.id_rezerwacji, sum(s.cena_za_godzine) as oplata_za_godzine 
from Rezerwacja_Sprzet rs left join Sprzet s on rs.id_sprzetu=s.id_sprzetu group by rs.id_rezerwacji

-- 11 podaj id i nazwiska klientow, ktorzy maja wiecej niz jedna rezerwacje
select distinct r.id_klienta, k.nazwisko from Rezerwacje r left join Klient k on k.id_klienta = r.id_klienta 
where r.id_klienta in (select id_klienta from Rezerwacje where id_rezerwacji <> r.id_rezerwacji)

-- 12 podac nazwiska wszystkich klientow, ktorzy utworzyli rezerwacje na wszystkie produkty z kategorii o id 21
select nazwisko from Klient k 
where not exists
(select * from Sprzet s where id_kat in (select id_kat from Kategorie where id_kat=21 and not exists 
(select * from Rezerwacja_Sprzet rs where rs.id_sprzetu = s.id_sprzetu 
and rs.id_rezerwacji in (select id_rezerwacji from Rezerwacje r where r.id_klienta=k.id_klienta))))

-- 13 poda� przedmioty, kt�re by�y rezerwowane co najmniej raz, ale nigdy nie by�y wypo�yczone
select s.* from Sprzet s right join Rezerwacja_Sprzet rs on s.id_sprzetu=rs.id_sprzetu 
where id_rezerwacji in (select id_rezerwacji from Rezerwacje r where r.id_wypozyczenia is null)

-- 14 podac sredni sredni stosunek ceny wypozyczenia na godzine do ceny_zakupu sprzetu w procentach wedlug kategorii
select id_kat, cast(cast(avg(cena_za_godzine/cena_zakupu * 100) as decimal (3,1) ) as varchar) + '%' as sredni_procent from Sprzet group by id_kat

-- 15 podaj id i nazwiska klient�w, kt�rzy wypozyczyli sprzet o lacznej wartosci wiekszej od 200
select id_klienta, nazwisko from Klient where id_klienta in 
(select id_klienta from Rezerwacje r where id_wypozyczenia is not null and 
(select sum(s.cena_zakupu) from Rezerwacja_Sprzet rs left join Sprzet s on rs.id_sprzetu=s.id_sprzetu 
where r.id_rezerwacji=rs.id_rezerwacji) > 200 )



-- WYZWALACZE

-- jedna osoba nie moze utworzyc wiecej niz 5 rezerwacji
GO
CREATE TRIGGER sprawdzRezerwacje on dbo.Rezerwacje
INSTEAD OF INSERT 
AS 
BEGIN
	DECLARE @ile INT
	DECLARE @idKlienta INT
	SET @ile = 0
	SELECT @idKlienta=id_klienta FROM inserted
	SELECT @ile = count(*) FROM Rezerwacje WHERE @idKlienta=id_klienta and id_wypozyczenia is null
	print @ile
	IF @ile > 4
	BEGIN
		print 'niepowodzenie - limit rezerwacji zostal osiagniety'
	END
	ELSE 
	BEGIN
		INSERT INTO Rezerwacje(status_rezerwacji,czy_oplacona, data_rezerwacji, waznosc_do, id_wypozyczenia, id_klienta) 
		SELECT status_rezerwacji, czy_oplacona, data_rezerwacji, waznosc_do, id_wypozyczenia, id_klienta FROM inserted
	END
END	

GO

-- zwrocenie sprzetu

-- PROCEDURY
-- podnies cene sprzetu z danej kategorii o x procent
GO
CREATE PROCEDURE podniesCeneWypozyczeniaSprzetuZKat
(
	@procent INT,
	@id_kategorii INT
)
AS
BEGIN
	UPDATE Sprzet SET cena_za_godzine = cena_za_godzine + cena_za_godzine * @procent where id_kat=@id_kategorii
END


-- FUNKCJE

--zwroc zysk ze wszystkich wypozyczen klienta o zadanym id
GO
CREATE FUNCTION zwrocZyskZKlienta
(
	@id_klienta INT
)
RETURNS DECIMAL(9,2)
AS
BEGIN
	DECLARE @calkowity_zysk Decimal(9,2)
	SELECT @calkowity_zysk=sum((datediff(minute, data_wypozyczenia, data_zwrotu)/60+1)*s.cena_za_godzine) from Wypozyczenia w left join Rezerwacje r on w.id_wypozyczenia=r.id_wypozyczenia 
	left join Rezerwacja_Sprzet rs on rs.id_rezerwacji=r.id_rezerwacji 
	left join Sprzet s on rs.id_sprzetu=s.id_sprzetu where r.id_klienta=@id_klienta
	RETURN @calkowity_zysk
END

go
select *, dbo.zwrocZyskZKlienta(id_klienta) from Klient