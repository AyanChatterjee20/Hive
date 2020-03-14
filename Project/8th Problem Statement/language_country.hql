set hive.cli.print.header=true;
set hive.cli.print.current.db=true;
set hive.exec.dynamic.partition.mode=nonstrict;
set hive.exec.dynamic.partition=true;
set hive.enforce.bucketing=true;

use hive_project;

drop table if exists temp_country_details ;
drop table if exists country_details ;
drop table if exists language_country ;

create external table if not exists temp_country_details(country STRING, landmass STRING, zone STRING , area INT , population INT, language STRING , 
relegion INT , bars INT , stripes INT , colours INT , red INT , green INT , Blue INT , gold INT , white INT , 
black INT , orange INT , mainhue STRING , Circles INT , Crosses INT , Saltires INT , Quarters INT , Sunstars INT,
Crescent INT , Triangle INT , Icon INT , Animate INT , Text INT , TopLeft STRING , Botright String )
row format delimited
fields terminated by ','
stored as textfile
location '/InputFiles/Project/flag_dataset';

add jar language.jar;
create temporary function language_details as 'training.languageDetails';

create table if not exists country_details(country STRING, landmass STRING, zone STRING , area INT , population INT, language STRING , 
relegion INT , bars INT , stripes INT , colours INT , red INT , green INT , Blue INT , gold INT , white INT , 
black INT , orange INT , mainhue STRING , Circles INT , Crosses INT , Saltires INT , Quarters INT , Sunstars INT,
Crescent INT , Triangle INT , Icon INT , Animate INT , Text INT , TopLeft STRING , Botright String )
clustered by(language) sorted by(country) into 10 buckets 
row format delimited
fields terminated by ','
stored as parquet;

from temp_country_details
INSERT OVERWRITE TABLE country_details
select country, landmass, zone, area, population, language_details(language), relegion, bars, stripes, colours, red, green, Blue, gold, white, 
black, orange, mainhue, Circles, Crosses, Saltires, Quarters, Sunstars, Crescent, Triangle, Icon, Animate, Text, TopLeft, Botright ;

create table if not exists language_country 
row format delimited 
fields terminated by ','
stored as avro
as
select language,count(country) as noCountry from country_details group by language order by noCountry desc limit 1;

select * from language_country;

