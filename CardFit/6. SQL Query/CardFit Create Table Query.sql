create database cardFit;
use cardFit;

create table cardInfo(
img text,
name varchar(50) primary key,
startAge int,
company varchar(20),
fee varchar(7),
record varchar(8),
reword text,
outfee varchar(7),
registerDay datetime default current_timestamp,
issuanceNum int,
endAge int,
cardDivision varchar(6));

create table companyInfo(
name varchar(10),
tel varchar(15));

create table counsellerinfo(
id varchar(20) primary key,
pw varchar(20),
name varchar(10),
company varchar(10),
tel varchar(15),
email varchar(30),
corporate varchar(15) default 0,
division varchar(1) default "c",
registerDay datetime default current_timestamp);

create table directanswer(
num int primary key,
answer text,
answertime datetime default current_timestamp);

create table directinqiry(
num int primary key,
title text ,
category varchar(20) ,
contents text ,
wtime datetime default current_timestamp,
writer varchar(30) ,
answercheck int default 0,
division varchar(1)
);

desc issuance;
create table issuance(
num int auto_increment primary key,
cardName varchar(50) ,
userId varchar(30) ,
issCondition int default 0 ,
contactableDate varchar(40), 
startTime varchar(10) ,
endTime varchar(10) ,
address text ,
phone varchar(15), 
email varchar(30) ,
requestDate datetime default current_timestamp,
issuanceDate datetime ,
userName varchar(10) ,
counseller varchar(10) ,
cardCompany varchar(10));

create table largeCategory(
B_Category int auto_increment primary key,
B_name varchar(20));


create table memberInfo(
id varchar(30) ,
pw varchar(30) ,
name varchar(10) ,
regNum varchar(14), 
phone varchar(15) ,
address text ,
email varchar(30), 
RegisterDay datetime default current_timestamp, 
division varchar(1),
primary key (id, regNum));

create table notice(
num int auto_increment primary key,
title text ,
contents text ,
wtime datetime default current_timestamp,
emphasis int default 0);


create table smallCategory(
S_Category int auto_increment primary key,
S_name varchar(20),
B_Category int)