set hive.cli.print.header=true;
set hive.cli.print.current.db=true;
set hive.exec.dynamic.partition.mode=nonstrict;
set hive.exec.dynamic.partition=true;
set hive.enforce.bucketing=true;

use hive_project;

drop table if exists temp_country_details ;
drop table if exists country_details ;
drop table if exists icon_text_country ;

create external table if not exists temp_country_details(country STRING, landmass STRING, zone STRING , area INT , population INT, language INT , 
relegion INT , bars INT , stripes INT , colours INT , red INT , green INT , Blue INT , gold INT , white INT , 
black INT , orange INT , mainhue STRING , Circles INT , Crosses INT , Saltires INT , Quarters INT , Sunstars INT,
Crescent INT , Triangle INT , Icon INT , Animate INT , Text INT , TopLeft STRING , Botright String )
row format delimited
fields terminated by ','
stored as textfile
location '/InputFiles/Project/flag_dataset';

add jar Untitled.jar;
create temporary function country_iconWise as 'training.country_iconWise';

add jar text.jar;
create temporary function text_details as 'training.textDetails';

create table if not exists country_details(country STRING, landmass STRING, zone STRING , area INT , population INT, language INT , 
relegion INT , bars INT , stripes INT , colours INT , red INT , green INT , Blue INT , gold INT , white INT , 
black INT , orange INT , mainhue STRING , Circles INT , Crosses INT , Saltires INT , Quarters INT , Sunstars INT,
Crescent INT , Triangle INT , Icon INT, Animate INT , TopLeft STRING , Botright String )
partitioned by (Text INT)
clustered by(Icon) sorted by(country) into 2 buckets 
row format delimited
fields terminated by ','
stored as parquet;

from temp_country_details
INSERT OVERWRITE TABLE country_details PARTITION(Text)
select country, landmass, zone, area, population, language, relegion, bars, stripes, colours, red, green, Blue, gold, white, 
black, orange, mainhue, Circles, Crosses, Saltires, Quarters, Sunstars, Crescent, Triangle, Icon, Animate, TopLeft, Botright, Text ;

create table if not exists icon_text_country 
row format delimited 
fields terminated by ','
stored as avro
as
select country_iconwise(Icon) as ICON, text_details(Text) as TEXT,count(country) as noCountry from country_details where Icon = 1 and Text = 1 group by ICON,TEXT;

select * from icon_text_country ;

