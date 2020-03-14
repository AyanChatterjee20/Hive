set hive.cli.print.header=true;
set hive.cli.print.current.db=true;
set hive.exec.dynamic.partition.mode=nonstrict;
set hive.exec.dynamic.partition=true;
set hive.enforce.bucketing=true;

use hive_project;

drop table if exists temp_country_details ;
drop table if exists country_details ;
drop table if exists tmp_country_minpop_SAMERICA ;
drop table if exists country_minpop_SAMERICA ;

create external table if not exists temp_country_details(country STRING, landmass STRING, zone STRING , area INT , population INT, language INT , 
relegion INT , bars INT , stripes INT , colours INT , red INT , green INT , Blue INT , gold INT , white INT , 
black INT , orange INT , mainhue STRING , Circles INT , Crosses INT , Saltires INT , Quarters INT , Sunstars INT,
Crescent INT , Triangle INT , Icon INT , Animate INT , Text INT , TopLeft STRING , Botright String )
row format delimited
fields terminated by ','
stored as textfile
location '/InputFiles/Project/flag_dataset';

add jar landmass.jar;
create temporary function landmass_details as 'training.landMassDetails';

create table if not exists country_details(country STRING, zone STRING , area INT , population INT, language INT , 
relegion INT , bars INT , stripes INT , colours INT , red INT , green INT , Blue INT , gold INT , white INT , 
black INT , orange INT , mainhue STRING , Circles INT , Crosses INT , Saltires INT , Quarters INT , Sunstars INT,
Crescent INT , Triangle INT , Icon INT , Animate INT , Text INT , TopLeft STRING , Botright String )
partitioned by(landmass STRING)
row format delimited
fields terminated by ','
stored as avro;

INSERT OVERWRITE TABLE country_details PARTITION(landmass)
select country, zone, area, population, language, relegion, bars, stripes, colours, red, green, Blue, gold, white, 
black, orange, mainhue, Circles, Crosses, Saltires, Quarters, Sunstars, Crescent, Triangle, Icon, Animate, Text, TopLeft, Botright,landmass_details(landmass) from temp_country_details;

create table if not exists tmp_country_minpop_SAMERICA 
row format delimited 
fields terminated by ','
stored as avro
as
select landmass,min(population) as population from country_details where landmass = "S.AMERICA" group by landmass;


create table if not exists country_minpop_SAMERICA 
row format delimited 
fields terminated by ','
stored as avro
as
select t.landmass,c.country,t.population from country_details c ,tmp_country_minpop_SAMERICA t where t.landmass=c.landmass and t.population=c.population;

drop table if exists tmp_country_minpop_SAMERICA ;

select * from country_minpop_SAMERICA;

