create database bankiru

create table rating2008 (pos integer, pos_delta integer, bank_name char(200), lic integer primary key, reg char(200), money_end bigint, money_start bigint, money_delta bigint, prcnt_delta real);
create table rating2009 (pos integer, pos_delta integer, bank_name char(200), lic integer primary key, reg char(200), money_end bigint, money_start bigint, money_delta bigint, prcnt_delta real);
create table rating2010 (pos integer, pos_delta integer, bank_name char(200), lic integer primary key, reg char(200), money_end bigint, money_start bigint, money_delta bigint, prcnt_delta real);
create table rating2011 (pos integer, pos_delta integer, bank_name char(200), lic integer primary key, reg char(200), money_end bigint, money_start bigint, money_delta bigint, prcnt_delta real);
create table rating2012 (pos integer, pos_delta integer, bank_name char(200), lic integer primary key, reg char(200), money_end bigint, money_start bigint, money_delta bigint, prcnt_delta real);
create table rating2013 (pos integer, pos_delta integer, bank_name char(200), lic integer primary key, reg char(200), money_end bigint, money_start bigint, money_delta bigint, prcnt_delta real);
create table rating2014 (pos integer, pos_delta integer, bank_name char(200), lic integer primary key, reg char(200), money_end bigint, money_start bigint, money_delta bigint, prcnt_delta real);
create table rating2015 (pos integer, pos_delta integer, bank_name char(200), lic integer primary key, reg char(200), money_end bigint, money_start bigint, money_delta bigint, prcnt_delta real);

create table rating20142015 (pos integer, pos_delta integer, bank_name char(200), lic integer primary key, reg char(200), money_end bigint, money_start bigint, money_delta bigint, prcnt_delta real);
create table rating20132015 (pos integer, pos_delta integer, bank_name char(200), lic integer primary key, reg char(200), money_end bigint, money_start bigint, money_delta bigint, prcnt_delta real);

copy "rating2008" from '/home/vdv/banks/rating2008.csv' with (delimiter E'\t', encoding 'windows-1251', header 1, format csv);
copy "rating2009" from '/home/vdv/banks/rating2009.csv' with (delimiter E'\t', encoding 'windows-1251', header 1, format csv);
copy "rating2010" from '/home/vdv/banks/rating2010.csv' with (delimiter E'\t', encoding 'windows-1251', header 1, format csv);
copy "rating2011" from '/home/vdv/banks/rating2011.csv' with (delimiter E'\t', encoding 'windows-1251', header 1, format csv);
copy "rating2012" from '/home/vdv/banks/rating2012.csv' with (delimiter E'\t', encoding 'windows-1251', header 1, format csv);
copy "rating2013" from '/home/vdv/banks/rating2013.csv' with (delimiter E'\t', encoding 'windows-1251', header 1, format csv);
copy "rating2014" from '/home/vdv/banks/rating2014.csv' with (delimiter E'\t', encoding 'windows-1251', header 1, format csv);
copy "rating2015" from '/home/vdv/banks/rating2015.csv' with (delimiter E'\t', encoding 'windows-1251', header 1, format csv);

copy "rating20142015" from '/home/vdv/banks/rating20142015.csv' with (delimiter E'\t', encoding 'windows-1251', header 1, format csv);
copy "rating20132015" from '/home/vdv/banks/rating20132015.csv' with (delimiter E'\t', encoding 'windows-1251', header 1, format csv);

select bank_name, lic, avg(coalesce(cast((money_start * (cast((prcnt_delta * 100) as bigint))) as bigint), 0)) as avg_mx from
(
 (select * from rating2008)
  union all
 (select * from rating2009)
  union all
 (select * from rating2010)
  union all
 (select * from rating2011)
  union all
 (select * from rating2012)
  union all
 (select * from rating2013)
  union all
 (select * from rating2014)
  union all
 (select * from rating2015)
--  union all
-- (select * from rating20142015)
--  union all
-- (select * from rating20132015)
) as union_table
group by bank_name, lic
order by avg_mx desc limit 50;

select bank_name, lic, avg(coalesce(cast((money_delta * (cast((prcnt_delta * 100) as bigint))) as bigint), 0)) as avg_mx from
(
 (select * from rating2008)
  union all
 (select * from rating2009)
  union all
 (select * from rating2010)
  union all
 (select * from rating2011)
  union all
 (select * from rating2012)
  union all
 (select * from rating2013)
  union all
 (select * from rating2014)
  union all
 (select * from rating2015)
--  union all
-- (select * from rating20142015)
--  union all
-- (select * from rating20132015)
) as union_table
group by bank_name, lic
order by avg_mx desc limit 50;

--select bank_name from
--(
 select bank_name, lic, avg(md) as avg_money_delta, avg(pd) as avg_prcnt_delta from
 (
  (select bank_name, lic, coalesce(money_delta, 0) as md, coalesce(prcnt_delta, 0.0) as pd from rating2008)
   union all
  (select bank_name, lic, coalesce(money_delta, 0) as md, coalesce(prcnt_delta, 0.0) as pd from rating2009)
   union all
  (select bank_name, lic, coalesce(money_delta, 0) as md, coalesce(prcnt_delta, 0.0) as pd from rating2010)
   union all
  (select bank_name, lic, coalesce(money_delta, 0) as md, coalesce(prcnt_delta, 0.0) as pd from rating2011)
   union all
  (select bank_name, lic, coalesce(money_delta, 0) as md, coalesce(prcnt_delta, 0.0) as pd from rating2012)
   union all
  (select bank_name, lic, coalesce(money_delta, 0) as md, coalesce(prcnt_delta, 0.0) as pd from rating2013)
   union all
  (select bank_name, lic, coalesce(money_delta, 0) as md, coalesce(prcnt_delta, 0.0) as pd from rating2014)
   union all
  (select bank_name, lic, coalesce(money_delta, 0) as md, coalesce(prcnt_delta, 0.0) as pd from rating2015)
--   union all
--  (select bank_name, lic, coalesce(money_delta, 0) as md, coalesce(prcnt_delta, 0.0) as pd from rating20142015)
--   union all
--  (select bank_name, lic, coalesce(money_delta, 0) as md, coalesce(prcnt_delta, 0.0) as pd from rating20132015)
 ) as union_table
 group by bank_name, lic
 order by avg_prcnt_delta desc, avg_money_delta desc limit 50;
--) as res;
