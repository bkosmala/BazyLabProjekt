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
