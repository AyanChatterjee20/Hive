set hive.cli.print.header=true;
set hive.cli.print.current.db=true;
set hive.exec.dynamic.partition.mode=nonstrict;
set hive.exec.dynamic.partition=true;
set hive.enforce.bucketing=true;

use hive_project;

drop table if exists temp_country_details ;
drop table if exists topCountry_bars_stripsFlags; 

create external table if not exists temp_country_details(country STRING, landmass INT, zone STRING , area INT , population INT, language INT , 
relegion INT , bars INT , stripes INT , colours INT , red INT , green INT , Blue INT , gold INT , white INT , 
black INT , orange INT , mainhue STRING , Circles INT , Crosses INT , Saltires INT , Quarters INT , Sunstars INT,
Crescent INT , Triangle INT , Icon INT , Animate INT , Text INT , TopLeft STRING , Botright String )
row format delimited
fields terminated by ','
stored as textfile
location '/InputFiles/Project/flag_dataset';

create table if not exists topCountry_bars_stripsFlags 
row format delimited 
fields terminated by ','
stored as avro
as
select country,sum(bars) as noBars, sum(stripes) as noStripes from temp_country_details group by country order by noBars desc limit 5;

select * from topCountry_bars_stripsFlags; 

