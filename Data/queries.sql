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
Create Procedure Recommendation()
Begin

Create view MostPlayedGenres as
(
	Select distinct Genre, count(play_count)
	from song natural join playlist natural join playlistname
	where user_id = 1
	group by song_name, Genre
	order by count(play_count) desc limit 3
);
Select distinct Genre, count(play_count)
from song natural join playlist natural join playlistname
where user_id = 1
group by song_name, Genre
order by count(play_count) desc limit 3


CREATE PROCEDURE cursorRecom(IN usid varchar(20))
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE a CHAR(16);
/*
DECLARE var1 varchar(20);
Select Genre #into var1
from
(
Select distinct Genre, count(play_count)
from song natural join playlist natural join playlistname
where user_id = 1 #usid
group by song_name, Genre
order by count(play_count) desc limit 1
) as test;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN cur1;

read_loop: LOOP
FETCH cur1 INTO a;

IF done THEN
  LEAVE read_loop;
END IF;
insert into recommendation values ()
END IF;
END LOOP;

CLOSE cur1;
CLOSE cur2;
END;
*/
CREATE PROCEDURE Recommendation(IN usid varchar(20))
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE a INT;
DECLARE var1 CHAR(16);
Select Genre into var1
from
(
Select distinct Genre, count(play_count)
from song natural join playlist natural join playlistname
where user_id = 1 /*usid*/
group by song_name, Genre
order by count(play_count) desc limit 1
) as test;

DECLARE cur1 CURSOR FOR SELECT song_id FROM song where Genre like var1;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN cur1;

read_loop: LOOP
FETCH cur1 INTO a
IF done THEN
LEAVE read_loop;
END IF;
INSERT INTO recommendation VALUES (a);
END LOOP;

CLOSE cur1;
END;








Create Procedure Recommendation()
begin
DECLARE var1 varchar(20);
Select Genre into var1
from
(
Select distinct Genre, count(play_count)
from song natural join playlist natural join playlistname
where user_id = 1 /*usid*/
group by song_name, Genre
order by count(play_count) desc limit 1
) as test;

end;













