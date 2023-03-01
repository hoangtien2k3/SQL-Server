CREATE DATABASE Primary_Foreign
Go

use Primary_Foreign
GO

CREATE TABLE BoMon
(
	MaBM char(10) primary key,
	Name nvarchar(100) default N'Tên Bộ Môn'
)
GO

CREATE TABLE Lop
(
	Malop char(10) not null,
	Name nvarchar(100) default N'Tên lớp',

	primary key(Malop)
)
Go

CREATE TABLE GiaoVien
(
	MaGV char(10) not null,
	Name nvarchar(100) default N'Tên giáo viên',
	DiaChi nvarchar(100) default N'Địa chỉ giáo viên',

	NgaySinh date,

	Sex bit
)
Go


CREATE TABLE Hocsinh
(
	Mahs char(10) primary key,
	Name nvarchar(100)
)
Go


