
Use HospitalManagementSysteam
Go



Create table MabenhanTbl
(
	DoiTuong int not null primary key,
	CCCD int not null,
	NoiDKKCB nvarchar(50) not null,
	HoTen nvarchar(50) not null,
	Tinh nvarchar(50) not null,
	NgheNghiep nvarchar(60) not null,
	BHYT int not null,
	TenBV nvarchar(100) not null,
	NgaySinh int not null,
	Huyen nvarchar(50) not null,
	DanToc nvarchar(50) not null,
	Tuyen nvarchar(50) not null,
	GioiTinh nvarchar(50) not null,
	Xa nvarchar(20) not null,
	QuocTich nvarchar(50) not null,
	SoDienThoai int not null,
	Email nvarchar(50) not null,
	TenNguoiNha nvarchar(50) not null
)
Go

