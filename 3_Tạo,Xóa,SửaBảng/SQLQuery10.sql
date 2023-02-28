CREATE DATABASE SQLServer
GO

-- SU DUNG SQLServer
USE SQLServer
GO

CREATE TABLE HocSinh
(
	MaSV NVARCHAR(10),
	Name NVARCHAR(50)
)
GO

CREATE TABLE GiaoVien
(
	MaGV NVARCHAR(10),
	Name NVARCHAR(50)
)
GO

-- alter dùng để sử thông tin, còn add là dùng để thêm thông tin vào table database hocsinh
ALTER TABLE HocSinh ADD NgaySinh Date


-- xóa toàn bộ dữ liệu của bảng.
TRUNCATE TABLE HocSinh


-- xoa toan bo table hocsinh
DROP TABLE HocSinh
GO