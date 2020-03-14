set hive.cli.print.header=true;
set hive.cli.print.current.db=true;
set hive.exec.dynamic.partition.mode=nonstrict;
set hive.exec.dynamic.partition=true;
set hive.enforce.bucketing=true;

use hive_project;

drop table if exists temp_country_details ;
drop table if exists country_details ;
drop table if exists country_maxArea_NE;
drop table if exists tmp_country_maxArea_NE;

create external table if not exists temp_country_details(country STRING, landmass INT, zone STRING , area INT , population INT, language INT , 
relegion INT , bars INT , stripes INT , colours INT , red INT , green INT , Blue INT , gold INT , white INT , 
black INT , orange INT , mainhue STRING , Circles INT , Crosses INT , Saltires INT , Quarters INT , Sunstars INT,
Crescent INT , Triangle INT , Icon INT , Animate INT , Text INT , TopLeft STRING , Botright String )
row format delimited
fields terminated by ','
stored as textfile
location '/InputFiles/Project/flag_dataset';

add jar zone.jar;
create temporary function zone_val as 'training.ZoneDetails';

create table if not exists country_details(country STRING, landmass INT, area INT , population INT, language INT , 
relegion INT , bars INT , stripes INT , colours INT , red INT , green INT , Blue INT , gold INT , white INT , 
black INT , orange INT , mainhue STRING , Circles INT , Crosses INT , Saltires INT , Quarters INT , Sunstars INT,
Crescent INT , Triangle INT , Icon INT , Animate INT , Text INT , TopLeft STRING , Botright String )
partitioned by(zone STRING)
row format delimited
fields terminated by ','
stored as avro;

INSERT OVERWRITE TABLE country_details PARTITION(zone)
select country, landmass, area, population, language, relegion, bars, stripes, colours, red, green, Blue, gold, white, 
black, orange, mainhue, Circles, Crosses, Saltires, Quarters, Sunstars, Crescent, Triangle, Icon, Animate, Text, TopLeft, Botright, zone_val(zone) as zone from temp_country_details ;

create table if not exists tmp_country_maxArea_NE 
row format delimited 
fields terminated by ','
stored as avro
as
select zone,max(area) as area from country_details where zone = 'NE' group by zone;


create table if not exists country_maxArea_NE 
row format delimited 
fields terminated by ','
stored as avro
as
select c.country,t.zone,t.area from country_details c, tmp_country_maxArea_NE t where c.area=t.area and c.zone=t.zone;

drop table if exists tmp_country_maxArea_NE;

select * from country_maxArea_NE;

