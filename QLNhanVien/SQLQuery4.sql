
Use QLCongTy
go

create table ThongTinNhanVien
(
	MaNV nvarchar(20) not null primary key,
	TenNV nvarchar(50) not null,
	NgaySinh date not null,
	GioiTinh nvarchar(10) not null,
	ChucVu nvarchar(50) not null,
	TienLuong int not null

)
go



