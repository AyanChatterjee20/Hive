set hive.cli.print.header=true;
set hive.cli.print.current.db=true;
set hive.exec.dynamic.partition.mode=nonstrict;
set hive.exec.dynamic.partition=true;
set hive.enforce.bucketing=true;

use hive_project;

drop table if exists temp_country_details ;
drop table if exists country_iconWise;

create external table if not exists temp_country_details(country STRING, landmass INT, zone STRING , area INT , population INT, language INT , 
relegion INT , bars INT , stripes INT , colours INT , red INT , green INT , Blue INT , gold INT , white INT , 
black INT , orange INT , mainhue STRING , Circles INT , Crosses INT , Saltires INT , Quarters INT , Sunstars INT,
Crescent INT , Triangle INT , Icon INT , Animate INT , Text INT , TopLeft STRING , Botright String )
row format delimited
fields terminated by ','
stored as textfile
location '/InputFiles/Project/flag_dataset';

add jar Untitled.jar;
create temporary function country_iconWise as 'training.country_iconWise';

create table if not exists country_iconWise
row format delimited 
fields terminated by ','
stored as avro
as
select count(country),country_iconWise(icon) from temp_country_details group by icon;

select * from country_iconWise;

