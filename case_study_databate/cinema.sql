drop database cinema;
create database cinema;
use cinema;

create table film (
id int AUTO_INCREMENT PRIMARY KEY,
`name` varchar(45)
);

create table cinema (
id varchar(45),
id_film int,
show_day date,
amount_ticket int,
`status` bit DEFAULT 0,

foreign key (id_film) REFERENCES film (id)
);

insert into film values 
(1,"Spider man"),
(2, "Iron man"),
(3, "Super man"),
(4, "Ant man");


insert into cinema 
values ("CI-1223","1","2022-12-1",100,0),
		("CI-1113","1","2022-12-2",200,0),
		("CI-4444","3","2022-12-3",300,0),
		("CI-5555","4","2022-12-4",400,0);
        