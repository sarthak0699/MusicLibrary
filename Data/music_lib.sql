Create Table artist(artist_name varchar(35),country varchar(35),artist_id int not null AUTO_INCREMENT, wiki_link varchar(30),primary key(artist_id));
Alter table artist AUTO_INCREMENT = 1000;

Create Table language(langname varchar(35)(,primary key(langname));

Create Table album(album_name varchar(35),Year int ,album_id int not null AUTO_INCREMENT,number_of_songs int not NULL, artist_id int,langname varchar (35) , primary key(album_id),constraint fk1 foreign key(artist_id) references artist(artist_id) on delete cascade, constraint fk2 foreign key (langname) references language (langname) on delete cascade, check (Year >= 1900 and Year <= 2019));
Alter Table album AUTO_INCREMENT = 2000;

Create Table Quality(bitrate varchar(20)/*int*/,song_quality int, check (bitrate >=128 and bitrate <=320), primary key (song_quality));

Create Table song(song_id int not null AUTO_INCREMENT, song_quality /*varchar(10)*/ int,song_name varchar(35),rating int, album_id int , Genre varchar(10), play_count int , artist_id int, langname Varchar(35), primary key(song_id), constraint fk3 foreign key(artist_id) references artist(artist_id) on delete cascade, constraint fk4 foreign key(album_id) references album(album_id) on delete cascade, constraint fek4 foreign key(langname) references language(langname) on delete cascade, constraint fk5 foreign key (song_quality) references Quality(song_quality), check (rating >=0 and rating <=5));
Alter Table song AUTO_INCREMENT = 3000;

Create Table user1(user_id int not null AUTO_INCREMENT,user_name Varchar(35),email Varchar(30),primary key(user_id));
Alter Table user1 AUTO_INCREMENT = 4000;


Create Table favourites(user_id int not null, song_id int, constraint fk6 foreign key (song_id) references song(song_id) on delete cascade, constraint fk7 foreign key (user_id) references user1(user_id) on delete cascade);

Create Table playlist(user_id int , song_id int ,constraint fk10 foreign key (song_id) references song(song_id) on delete cascade, constraint fk11 foreign key (user_id) references user1(user_id) on delete cascade);

Create Table user_history( user_id int, song_id int ,constraint fk12 foreign key (song_id) references song(song_id) on delete cascade, constraint fk13 foreign key (user_id) references user1(user_id) on delete cascade);

/*Create Table trending(song_rank int NOT NULL,song_id int, play_count int, constraint fk8 foreign key play_count references song(play_count) on delete cascade, constraint fk9 foreign key song_id references song(song_id) on delete cascade);*/