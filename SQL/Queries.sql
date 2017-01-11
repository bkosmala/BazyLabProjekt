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
