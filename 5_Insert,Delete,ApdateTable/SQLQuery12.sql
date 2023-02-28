-- thêm dữ liệu

CREATE TABLE Test
(
	MaSo int,
	Ten nvarchar(10),
	NgaySinh date,
	Nam bit,
	DiaChi nvarchar(20),
	TienLuong float
)
go


-- insert dữ liệu vào table
insert dbo.Test 
	(
		MaSo, 
		Ten,
		NgaySinh,
		Nam,
		DiaChi,
		TienLuong
	)
values
	(
		10, 
		N'Tiến', 
		'20030412', 
		1, 
		N'Địa chỉ nè',
		10000
	)


-- delete dữ liệu
delete dbo.Test where TienLuong > 5000 and MaSo < 15


-- update dữ liệu toàn bộ table với 1 trường update
update dbo.Test set TienLuong = 1


-- update dữ liệu toàn bộ table nhiều trường update
update dbo.Test set TienLuong = 1, DiaChi = 'dia chi'


-- update dữ liệu toàn bộ table nhiều trường update
update dbo.Test set TienLuong = 10000 where Nam = 0



