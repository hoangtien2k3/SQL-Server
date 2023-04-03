-- Tạo database Quản lý bán hàng
CREATE DATABASE QUANLYBANHANG;
GO

-- Truy xuất tới database QUANLYBANHANG
USE QUANLYBANHANG;
GO

-- 1. Tạo table DMKhoa:
CREATE TABLE DMKhoa
(
MaKhoa CHAR(2) NOT NULL PRIMARY KEY,
TenKhoa NVARCHAR(30) NOT NULL
);
GO

-- 2. Tạo bảng DMMonHoc:
CREATE TABLE DMMonHoc
(
MaMH CHAR(2) NOT NULL PRIMARY KEY,
TenMH NVARCHAR(25) NOT NULL,
SoTiet TINYINT NULL
);
GO

-- 3. Tạo bảng DSSinhVien:
CREATE TABLE DSSinhVien
(
MaSV CHAR(3) NOT NULL PRIMARY KEY,
HoSV NVARCHAR(15) NOT NULL,
TenSV NVARCHAR(7) NOT NULL,
Phai NCHAR(3) NULL,
NgaySinh DATETIME NOT NULL,
NoiSinh NVARCHAR(20) NULL,
MaKhoa CHAR(2) NULL,
HocBong FLOAT NULL,
CONSTRAINT FK_DSSinhVien_DMKhoa FOREIGN KEY (MaKhoa) REFERENCES DMKhoa (MaKhoa)
);
GO

-- 4. Tạo table KetQua:
CREATE TABLE KetQua
(
MaSV CHAR(3) NOT NULL,
MaMH CHAR(2) NOT NULL,
LanThi TINYINT NOT NULL,
Diem DECIMAL(4, 2) NULL,
PRIMARY KEY (MaSV, MaMH, LanThi),
CONSTRAINT FK_KetQua_DSSinhVien FOREIGN KEY (MaSV) REFERENCES DSSinhVien (MaSV),
CONSTRAINT FK_KetQua_DMMonHoc FOREIGN KEY (MaMH) REFERENCES DMMonHoc (MaMH)
);
GO

-- 1. Thêm dữ liệu ngẫu nhiên vào bảng DMKhoa:
INSERT INTO DMKhoa (MaKhoa, TenKhoa)
VALUES
('KH', N'Khoa học'),
('KT', N'Kinh tế'),
('NN', N'Ngoại ngữ'),
('SP', N'Sư phạm');

-- 2. Thêm dữ liệu ngẫu nhiên vào bảng DMMonHoc:
INSERT INTO DMMonHoc (MaMH, TenMH, SoTiet)
VALUES
('M1', N'Toán cao cấp', 40),
('M2', N'Vật lý đại cương', 30),
('M3', N'Giải tích', 35),
('M4', N'Kinh tế học', 25);

-- 3. Thêm dữ liệu ngẫu nhiên vào bảng DSSinhVien:
INSERT INTO DSSinhVien (MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
VALUES
('001', N'Nguyễn', N'Thành', N'Nam', '2000-01-01', N'Hà Nội', 'KH', 8.5),
('002', N'Phạm', N'Hương', N'Nữ', '2001-02-02', N'Hải Phòng', 'KT', 7.5),
('003', N'Trần', N'Thịnh', N'Nam', '2002-03-03', N'Thái Bình', 'NN', 9.0),
('004', N'Lê', N'Thảo', N'Nữ', '2003-04-04', N'Đà Nẵng', 'SP', 8.0);


-- 4. Insert dữ liệu ngẫu nhiên vào bảng KetQua:
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('001', 'M1', 2, 7.0),
('002', 'M2', 1, 9.0),
('003', 'M3', 2, 8.0),
('004', 'M4', 1, 6.5);