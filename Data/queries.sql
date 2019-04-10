/*Queries*/
/*Queries searching artist*/
/*Create Table artist(artist_name varchar(35),country varchar(35),artist_id int not null AUTO_INCREMENT, wiki_link varchar(30),primary key(artist_id));*/

/* REAL SHIT*/
Delimiter $$

Create Procedure artistSearch (IN arName varchar(30))
Begin
	Select song_name,artist_name, album_name, Year, song_id
	from artist 
	where artist_name like arName;
End
$$
call artistSearch('')

Create Procedure albumSearch (IN alName varchar(30))
Begin
Select song_name,artist_name, album_name, Year, song_id
from artist natural join album natural join song
where album_name  like alName;
End
$$
call albumSearch('')

Create Procedure songSearch (IN sname varchar(30))
Begin
Select song_name,artist_name, album_name, Year, song_id, playcount #playcount to update play count
from artist natural join album natural join song
where song_name  like sname;
End
$$
call songSearch('')

Create Procedure playHistory(IN sid int, IN usID int)
Begin
insert into user_history values (usid, sid);
End
$$
call playHistory(,)

/* play button*/
Create Procedure updatePlayCount (IN sid int)
Begin
update song
set play_count := play_count + 1
where song_id = sid;
End
$$
call updatePlayCount(3001, 1)
/*TRIGGER for play button on user_history*/
Create TRIGGER playcount
after update
on 
song
for each row
insert into user_history values (new.song_id); ##usid is predefined
$$
/*Insert into playlist table*/
Create Procedure SearchPlaylistID(IN plname varchar)
Begin
Select playlist_ID 
from playlistname
where playlist_name like plname;
End
$$
/*ADD TO PLAYLIST BUTTON*/
Create Procedure AddToPlaylist(IN sid int, IN usID int, IN selectedplaylistname varchar(20)) 
Begin
Declare plid int;
Select playlist_ID into plid
from playlistname
where playlist_name like selectedplaylistname and user_id = usID;

insert into playlist values(plid, sid);
End
$$
call AddToPlaylist(3020, 1, 'Happy')$$
/*Recommendation*/
Create Table recommendation(song_id int, constraint fk15 foreign key (song_id) references song(song_id) on delete cascade);

Create Procedure Recommendation(IN usid int)
begin
DECLARE done INT DEFAULT FALSE;
DECLARE a int;
DECLARE var1 int;
DECLARE cur1 CURSOR FOR 
Select song_id
from song 
where genre in
(
Select distinct Genre#, count(play_count)
from song natural join playlist natural join playlistname
where user_id = usid
-- group by song_name, Genre
order by play_count desc 
) limit 20;
delete from recommendation;
open cur1;

fetch cur1 into a;

start_loop: loop
fetch cur1 into var1;
insert into recommendation values (var1);        
end loop;

close cur1;
Select * from song natural join recommendation;

end;
