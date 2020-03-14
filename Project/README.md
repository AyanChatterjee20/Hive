The project is based on : **Flag Database**
Source Information : 
```
   -- Creators: Collected primarily from the "Collins Gem Guide to Flags":
      Collins Publishers (1986).
   -- Donor: Richard S. Forsyth 
             8 Grosvenor Avenue
             Mapperley Park
             Nottingham NG3 5DX
             0602-621676
   -- Date: 5/15/1990
```

Field Description in details : 

|Filed|Description|
|---|---|
|name|Name of the country concerned|
|landmass|1=N.America, 2=S.America, 3=Europe, 4=Africa, 4=Asia, 6=Oceania|
|zone|Geographic quadrant, based on Greenwich and the Equator 1=NE, 2=SE, 3=SW, 4=NW|
|area|in thousands of square km|
|population|in round millions|
|language|1=English, 2=Spanish, 3=French, 4=German, 5=Slavic, 6=Indo-European, 7=Chinese, 8=Arabic,9=Japanese/Turkish/Finnish/Magyar, 10=Others|
|religion|0=Catholic, 1=Other Christian, 2=Muslim, 3=Buddhist, 4=Hindu, 5=Ethnic, 6=Marxist, 7=Others|
|bars|Number of vertical bars in the flag|
|stripes|Number of horizontal stripes in the flag|
|colours|Number of different colours in the flag|
|red|0 if red absent, 1 if red present in the flag|
|green|0 if green absent, 1 if green present in the flag|
|blue|0 if blue absent, 1 if blue present in the flag|
|gold/yellow|0 if gold/yellow absent, 1 if gold/yellow present in the flag|
|white|0 if white absent, 1 if white present in the flag|
|black|0 if black absent, 1 if black present in the flag|
|orange/brown|0 if orange/brown absent, 1 if orange/brown present in the flag|
|mainhue|predominant colour in the flag (tie-breaks decided by taking the topmost hue, if that fails then the most central hue, and if that fails the leftmost hue)|
|circles|Number of circles in the flag|
|crosses|Number of (upright) crosses|
|saltires|Number of diagonal crosses|
|quarters|Number of quartered sections|
|sunstars|Number of sun or star symbols|
|crescent|1 if a crescent moon symbol present, else 0|
|triangle|1 if any triangles present, 0 otherwise|
|icon|1 if an inanimate image present (e.g., a boat), otherwise 0|
|animate|1 if an animate image (e.g., an eagle, a tree, a human hand) present, 0 otherwise|
|text|1 if any letters or writing on the flag (e.g., a motto or slogan), 0 otherwise|
|topleft|colour in the top-left corner (moving right to decide tie-breaks)|
|botright|Colour in the bottom-left corner (moving left to decide tie-breaks)|


Sample 10 records from flag_dataset : 
```
[cloudera@quickstart hive_project]$ hdfs dfs -cat /InputFiles/Project/flag_dataset/flag_dataset.txt | head
Afghanistan,5,1,648,16,10,2,0,3,5,1,1,0,1,1,1,0,green,0,0,0,0,1,0,0,1,0,0,black,green
Albania,3,1,29,3,6,6,0,0,3,1,0,0,1,0,1,0,red,0,0,0,0,1,0,0,0,1,0,red,red
Algeria,4,1,2388,20,8,2,2,0,3,1,1,0,0,1,0,0,green,0,0,0,0,1,1,0,0,0,0,green,white
American-Samoa,6,3,0,0,1,1,0,0,5,1,0,1,1,1,0,1,blue,0,0,0,0,0,0,1,1,1,0,blue,red
Andorra,3,1,0,0,6,0,3,0,3,1,0,1,1,0,0,0,gold,0,0,0,0,0,0,0,0,0,0,blue,red
Angola,4,2,1247,7,10,5,0,2,3,1,0,0,1,0,1,0,red,0,0,0,0,1,0,0,1,0,0,red,black
Anguilla,1,4,0,0,1,1,0,1,3,0,0,1,0,1,0,1,white,0,0,0,0,0,0,0,0,1,0,white,blue
Antigua-Barbuda,1,4,0,0,1,1,0,1,5,1,0,1,1,1,1,0,red,0,0,0,0,1,0,1,0,0,0,black,red
Argentina,2,3,2777,28,2,0,0,3,2,0,0,1,0,1,0,0,blue,0,0,0,0,0,0,0,0,0,0,blue,blue
Argentine,2,3,2777,28,2,0,0,3,3,0,0,1,1,1,0,0,blue,0,0,0,0,1,0,0,0,0,0,blue,blue
```
