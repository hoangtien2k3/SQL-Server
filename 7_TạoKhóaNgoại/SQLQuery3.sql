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


-- điều kiện cần đê tạo khóa ngoại, 
-- tham chiếu tới khóa chính
-- cùng kiểu dữ liệu
-- unique not null

-- lợi ích: đảm bảo toàn bộ dữ liệu và không có tham chiếu tới dữ liệu không tồn tại
-- tạo khóa ngoại trong table
CREATE TABLE Giaovien
(
	MaGV char(10) not null,
	Name nvarchar(100) default N'Tên giáo viên',
	DiaChi nvarchar(100) default N'Địa chỉ giáo viên',
	NgaySinh date,
	Sex bit, 

	-- cách tạo khóa ngoại ngay khi tạo bảng
	MaBM char(10) FOREIGN KEY(MaBM) REFERENCES dbo.BoMon(MaBM)
)
Go


-- tạo khóa ngoại ngoại sau khi  tạo table
alter table dbo.Hocsinh add constraint FK_Hocsinh foreign key(Malop) references dbo.Lop(Malop)


alter table dbo.Hocsinh Drop constraint FK_Hocsinh

