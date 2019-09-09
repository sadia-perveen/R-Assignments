create database MovieRatingsAssignment2;

use MovieRatingsAssignment2;
create table Movie
(
	movieId int primary key, 
	movieName varchar(150)
);
insert into Movie 
values(1,'Avengers - End Game'),
	(2,'John Wick 3'), 
    (3,'Aladdin'), 
    (4,'Hobbs & Shaw'), 
    (5,'The Lion King 2019'), 
    (6,'Spiderman Homecoming');

create table Rater 
(
	raterId int primary key,
	raterName varchar(150)  
);
insert into Rater 
values (1,'Syed'), 
	(2,'Nazia'), 
    (3,'Burhan'), 
    (4,'Isa'), 
    (5,'Musa');
    
create table Rating 
(
	ratingId int primary key, 
	ratingNum int
);
insert into Rating 
values (1,1), (2,2), (3,3), (4,4), (5,5);

create table MovieRating 
(
	raterId int,
    movieId int, 
    ratingId int,
    foreign key (movieId) references Movie(movieId), 
    foreign key (raterId) references Rater(raterID), 
    foreign key (ratingId) references Rating(ratingId), 
    primary key (raterId, movieId)
);
insert into MovieRating 
values (1, 1, 5), (1, 2, 5), (1, 3, 4), (1, 4, 5), (1, 5, 3), (1, 6, null);
insert into MovieRating 
values (2, 1, 4), (2, 2, 5), (2, 3, null), (2, 4, 2), (2, 5, 3), (2, 6, 5);
insert into MovieRating 
values (3, 1, 5), (3, 2, 5), (3, 3, 1), (3, 4, 5), (3, 5, 5), (3, 6, 4);
insert into MovieRating 
values (4, 1, 5), (4, 2, 4), (4, 3, 2), (4, 4, 5), (4, 5, 3), (4, 6, 5);
insert into MovieRating 
values (5, 1, 5), (5, 2, 5), (5, 3, 3), (5, 4, 5), (5, 5, 5), (5, 6, 4);

create view MovieRatingView
as 
select 
	M.movieName Movie,
    R.raterName Friend, 
    ifnull(T.ratingNum, 0) Rating
from MovieRating MR
	left join rater R 
		on R.raterId = MR.raterId
	left join movie M 
		on M.movieId = MR.movieId
	left join rating T
		on T.ratingID = MR.ratingId