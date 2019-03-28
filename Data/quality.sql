/*Create Table Quality(bitrate int,song_quality Varchar(10), check (bitrate >=128 and bitrate <=320), primary key (song_quality));*/
insert into Quality Values ('High', 320);
insert into Quality Values ('Medium', 256);
insert into Quality Values ('Low', 128);