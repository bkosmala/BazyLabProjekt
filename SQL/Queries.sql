-- Zapytania

--1
-- ID i nazwy kategorii wysokiego poziomu bez podkategorii posortowane rosn¹co wzglêdem nazwy
use CentrumSportu

Select id_kategorii, nazwa_kat from dbo.Kategorie as t1
 where id_kategoria_nadrzedna is null and
 not exists( select 1 from dbo.Kategorie where id_kategoria_nadrzedna=t1.id_kategorii)
 order by nazwa_kat asc

--2
-- ID, nazwy kategorii i liczba podkategorii dla kategorii g³ównych o wiêcej ni¿ 3 podkategoriach

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
-- nazwa i cena zakupu pierwszych 10 przedmiotów o najwiêkszej wartoœci (sprawnych, czyli sprawnosc=1)

select distinct top 10  nazwa, cena_zakupu from dbo.Sprzet where sprawnosc=1 order by cena_zakupu desc 

--5
--  nazwy kategorii,id kategorii, liczba sprzêtu, dla podkategorii kategorii g³ównych które maj¹ przypisany sprzêt zakupiony pomiêdzy 2015-12-10 - 2016-05-10
-- przy czym statystyki sprzêtu dotycz¹ w³aœnie sprzêtu zakupionego pomiêdzy 2015-12-10 - 2016-05-10
-- posortowane po nazwie malej¹co

select t1.nazwa_kat,count(t1.nazwa_kat) as 'Iloœæ sprzêtu wg kryteriów' from dbo.Kategorie as t1
join dbo.Sprzet as t2 on t2.id_kat=t1.id_kategorii
where data_zakupu between '2015-12-10' AND '2016-05-10'
group by t1.nazwa_kat
order by t1.nazwa_kat desc

--6
-- nazwy Kategorii g³ównych do których nie jest przypisany ani jeden egzemplarz sprzêtu i
-- dla których nie istnieje podkategoria która ma przypisany sprzêt
-- tzn. sprzêt nie mo¿e byæ przypisany ani do kategorii g³ównych ani ich podkategorii

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
-- œrednia cena zakupu pojedynczych egzemplarzy sprzêtu wg ich kategorii zaokr¹glona do pe³nych jednostek i posortowana z do³¹czon¹
-- nazw¹ kategorii

select t2.nazwa_kat,t1.id_kat,t1.sr as 'œrednia cena w kategorii w pe³nych z³' from 
(select id_kat, cast(round(avg(cena_zakupu),0) as int) as 'sr' from dbo.Sprzet group by id_kat) as t1
join dbo.Kategorie as t2 on t1.id_kat=t2.id_kategorii

--8
-- liczba sprzêtu zakupionego w sierpniu roku 2015
select count(id_sprzetu) as 'iloœæ' from dbo.Sprzet where datepart(year,data_zakupu) = 2015 and datepart(month,data_zakupu) = 8

--dalej np lista dostêpnego sprzêtu w wybranej kategorii, ze sprawdzeniem czy istnieje rezerwacja zaczynaj¹ca siê
-- w okresie 3 dni do przodu
--  sprzêt, który nigdy nie by³ wypo¿yczony (móg³ byæ zarezerwowany itp)
--itd

-- 9 podaj id i nazwiska klientów, którzy wypo¿yczyli sprzêt z kategorii 'Pi³ki No¿ne' 
select id_klienta, nazwisko from Klient where id_klienta in 
(select id_klienta from Rezerwacje where id_wypozyczenia is not null and id_rezerwacji in 
(select id_rezerwacji from Rezerwacja_Sprzet where id_sprzetu in (select id_sprzetu from Sprzet where id_kat = 8)))

-- 10 podaæ ca³kowit¹ cenê za godzinê dla ka¿dej z rezerwacji
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

-- 13 podaæ przedmioty, które by³y rezerwowane co najmniej raz, ale nigdy nie by³y wypo¿yczone
select s.* from Sprzet s right join Rezerwacja_Sprzet rs on s.id_sprzetu=rs.id_sprzetu 
where id_rezerwacji in (select id_rezerwacji from Rezerwacje r where r.id_wypozyczenia is null)

-- 14 podac sredni sredni stosunek ceny wypozyczenia na godzine do ceny_zakupu sprzetu w procentach wedlug kategorii
select id_kat, cast(cast(avg(cena_za_godzine/cena_zakupu * 100) as decimal (3,1) ) as varchar) + '%' as sredni_procent from Sprzet group by id_kat

-- 15 podaj id i nazwiska klientów, którzy wypozyczyli sprzet o lacznej wartosci wiekszej od 200
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