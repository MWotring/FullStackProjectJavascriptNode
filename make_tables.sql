CREATE database student_database;
USE student_database;

delete from students;
drop table students;


delete from classes;
drop table classes;

delete from studentClasses;
drop table studentClasses;


create table students
	(first VARCHAR(20) not null,
	last VARCHAR(20) not null,
	email VARCHAR(30) not null,
	primary key(email));
	
create table classes
	(id int not null,
	class_name VARCHAR(20) not null,
	primary key(id));

	
create table studentClasses
	(email VARCHAR(30) not null,
	id int not null,
	grade decimal not null,
	foreign key(email) references students(email),
	foreign key(id) references classes(id));
	
insert into students values ('John','Smith','johnsmith@mailinator.com');
insert into students values ('Jane', 'Smith', 'janesmith@mailinator.com');
insert into students values ('Jim', 'Johnson', 'jim-johnson@mailinator.com');
insert into students values ('Tyler', 'Cortez', 'tyler_cortez@mailinator.com');
insert into students values ('Julio', 'Jones', 'jjones@mailinator.com');
insert into students values ('Jamal', 'Ortez', 'jamaal-ortez@mailinator.com');
insert into students values ('Mike', 'Williams', 'mikewilliams@mailinator.com');
insert into students values ('Joe', 'Xue', 'joe_xue@mailinator.com');
insert into students values ('Alan', 'Jordan', 'ajordan@mailinator.com');
insert into students values ('Samantha', 'Ware', 'sware@mailinator.com');
insert into students values ('Michael', 'Soo', 'michael_soo@mailinator.com');
insert into students values ('Mary', 'Moon', 'mmoon@mailinator.com');
insert into students values ('Jose', 'Santiago', 'jsantiago@mailinator.com');
insert into students values ('Jose', 'Santiago', 'jsantiago@mailinator.com');

insert into classes values ('1', 'Math 101');
insert into classes values ('2', 'English 101');
insert into classes values ('3', 'Science 101');
insert into classes values ('4', 'Social Studies 101');
insert into classes values ('5', 'Health 101');
insert into classes values ('6', 'Chemistry 101');
insert into classes values ('7', 'English 201');
insert into classes values ('8', 'Math 201');

insert into studentClasses values ( 'johnsmith@mailinator.com', '1', '4');
insert into studentClasses values ( 'johnsmith@mailinator.com', '2', '3');
insert into studentClasses values ( 'johnsmith@mailinator.com', '3', '2');
insert into studentClasses values ( 'johnsmith@mailinator.com', '4', '2.5');
insert into studentClasses values ( 'johnsmith@mailinator.com', '5', '3.5');
insert into studentClasses values ( 'johnsmith@mailinator.com', '6', '4');
insert into studentClasses values ( 'johnsmith@mailinator.com', '6', '4');

insert into studentClasses values ( 'jim-johnson@mailinator.com', '1', '2.5');
insert into studentClasses values ( 'jim-johnson@mailinator.com', '3', '3.5');
insert into studentClasses values ( 'jim-johnson@mailinator.com', '5', '4');
insert into studentClasses values ( 'jim-johnson@mailinator.com', '7', '3');
insert into studentClasses values ( 'jim-johnson@mailinator.com', '2', '2');
insert into studentClasses values ( 'jim-johnson@mailinator.com', '4', '2.5');

insert into studentClasses values ( 'tyler_cortez@mailinator.com', '2', '3.5');
insert into studentClasses values ( 'tyler_cortez@mailinator.com', '4', '4');
insert into studentClasses values ( 'tyler_cortez@mailinator.com', '6', '3.5');
insert into studentClasses values ( 'tyler_cortez@mailinator.com', '8', '3');
insert into studentClasses values ( 'tyler_cortez@mailinator.com', '1', '2.5');
insert into studentClasses values ( 'tyler_cortez@mailinator.com', '3', '3');

insert into studentClasses values ( 'jjones@mailinator.com', '8', '2.5');
insert into studentClasses values ( 'jjones@mailinator.com', '7', '2.5');
insert into studentClasses values ( 'jjones@mailinator.com', '6', '2.5');
insert into studentClasses values ( 'jjones@mailinator.com', '5', '3');
insert into studentClasses values ( 'jjones@mailinator.com', '4', '2.5');
insert into studentClasses values ( 'jjones@mailinator.com', '3', '3.5');

insert into studentClasses values ( 'jamaal-ortez@mailinator.com', '2', '3.5');
insert into studentClasses values ( 'jamaal-ortez@mailinator.com', '3', '2.5');
insert into studentClasses values ( 'jamaal-ortez@mailinator.com', '4', '3');
insert into studentClasses values ( 'jamaal-ortez@mailinator.com', '5', '4');
insert into studentClasses values ( 'jamaal-ortez@mailinator.com', '6', '1.5');
insert into studentClasses values ( 'jamaal-ortez@mailinator.com', '7', '3');

insert into studentClasses values ( 'mikewilliams@mailinator.com', '4', '2');
insert into studentClasses values ( 'mikewilliams@mailinator.com', '5', '3');
insert into studentClasses values ( 'mikewilliams@mailinator.com', '6', '4');
insert into studentClasses values ( 'mikewilliams@mailinator.com', '7', '2');
insert into studentClasses values ( 'mikewilliams@mailinator.com', '8', '1.5');
insert into studentClasses values ( 'mikewilliams@mailinator.com', '1', '3.5');

insert into studentClasses values ( 'joe_xue@mailinator.com', '3', '4');
insert into studentClasses values ( 'joe_xue@mailinator.com', '4', '4');
insert into studentClasses values ( 'joe_xue@mailinator.com', '5', '3.5');
insert into studentClasses values ( 'joe_xue@mailinator.com', '6', '3.5');
insert into studentClasses values ( 'joe_xue@mailinator.com', '7', '3');
insert into studentClasses values ( 'joe_xue@mailinator.com', '8', '3.5');

insert into studentClasses values ( 'ajordan@mailinator.com', '1', '2');
insert into studentClasses values ( 'ajordan@mailinator.com', '2', '1.5');
insert into studentClasses values ( 'ajordan@mailinator.com', '3', '2.5');
insert into studentClasses values ( 'ajordan@mailinator.com', '6', '2');
insert into studentClasses values ( 'ajordan@mailinator.com', '7', '2.5');
insert into studentClasses values ( 'ajordan@mailinator.com', '8', '2');

insert into studentClasses values ( 'sware@mailinator.com', '1', '4');
insert into studentClasses values ( 'sware@mailinator.com', '3', '4');
insert into studentClasses values ( 'sware@mailinator.com', '4', '4');
insert into studentClasses values ( 'sware@mailinator.com', '5', '3.5');
insert into studentClasses values ( 'sware@mailinator.com', '6', '3');
insert into studentClasses values ( 'sware@mailinator.com', '8', '4');

insert into studentClasses values ( 'michael_soo@mailinator.com', '2', '2');
insert into studentClasses values ( 'michael_soo@mailinator.com', '4', '1');
insert into studentClasses values ( 'michael_soo@mailinator.com', '5', '1');
insert into studentClasses values ( 'michael_soo@mailinator.com', '6', '2');
insert into studentClasses values ( 'michael_soo@mailinator.com', '7', '2');
insert into studentClasses values ( 'michael_soo@mailinator.com', '1', '1.5');

insert into studentClasses values ( 'mmoon@mailinator.com', '1', '3');
insert into studentClasses values ( 'mmoon@mailinator.com', '2', '3');
insert into studentClasses values ( 'mmoon@mailinator.com', '3', '3.5');
insert into studentClasses values ( 'mmoon@mailinator.com', '4', '2.5');
insert into studentClasses values ( 'mmoon@mailinator.com', '5', '2');
insert into studentClasses values ( 'mmoon@mailinator.com', '6', '3');

insert into studentClasses values ( 'jsantiago@mailinator.com', '2', '4');
insert into studentClasses values ( 'jsantiago@mailinator.com', '3', '2');
insert into studentClasses values ( 'jsantiago@mailinator.com', '4', '2');
insert into studentClasses values ( 'jsantiago@mailinator.com', '5', '2.5');
insert into studentClasses values ( 'jsantiago@mailinator.com', '6', '3.5');
insert into studentClasses values ( 'jsantiago@mailinator.com', '8', '4');