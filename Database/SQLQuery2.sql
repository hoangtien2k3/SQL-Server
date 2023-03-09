Create Database Collegedb
go


Create Table Usertbl
(
	UserId int not null primary key,
	UserName nvarchar(50) not null,
	password nvarchar(50) not null
)
go


create table DepartmentTbl
(
	DepName nvarchar(50) not null primary key,
	DepDesc nvarchar(50) not null,
	DepDuration int not null
)
go


create table TeacherTbl
(
	TeacherdId int not null primary key,
	TeacherName nvarchar(50) not null,
	TeacherGender nvarchar(10) not null,
	TeacherDOB nvarchar(50) not null,
	TeacherPhone nvarchar(20) not null,
	TeacherDep nvarchar(50) not null,
	TeacherAdd nvarchar(50)

)
go


create table FeesTbl
(
	FeesNum int not null primary key,
	StdId int not null,
	StdName nvarchar(50) not null, 
	Period nvarchar(50) not null,
	Amount int not null
)
go

create table StudentTbl
(
	StdId int not null primary key,
	StdName nvarchar(50) not null,
	StdGender nvarchar(50) not null,
	StdDOB nvarchar(50) not null,
	StdPhone varchar(50) not null,
	StdFees nvarchar(50) not null
)
go

