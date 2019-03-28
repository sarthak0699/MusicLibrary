/*Queries*/
/*Queries searching artist*/
/*Create Table artist(artist_name varchar(35),country varchar(35),artist_id int not null AUTO_INCREMENT, wiki_link varchar(30),primary key(artist_id));*/
Create or Replace Procedure artistSearch (arName varchar)
Begin
Select song_name,artist_name, album_name, Year 
from artist natural join album natural join Song
where artist_name = arNAme;
End;
/
/*Queries for Album Search*/
Create or Replace Procedure albumSearch (alName varchar)
Begin
Select song_name, artist_name , album_name
from artist natural join album natural join Song
where album_name  = alName;
End;
/
/*Query for song search*/
Create or Replace Procedure songSearch (sgName varchar)
Begin
Select song_name, artist_name , album_name, Year
from artist natural join album natural join Song
where song_name  = sgName;
End;
/
/