
-- Bài 2: Tạo CSDL QLSV (quản lý điểm sinh viên) có cấu trúc và các ràng buộc như sau:

/*
	1. Thực hiện các câu lệnh INSERT, UPDATE, DELETE kiểm tra sự thực hiện các ràng
	buộc (not null, default, primary key, . . . ) đã thiết đặt ở các bảng trên. 

*/


-- Tạo CSDL QLSV (quản lý điểm sinh viên)

	CREATE DATABASE QLSV
	GO
	USE QLSV
	GO


-- Bảng KHOA lưu thông tin về các khoa có cấu trúc như sau:
CREATE TABLE KHOA
(
	MAKHOA CHAR(4) NOT NULL PRIMARY KEY,
	TENKHOA NVARCHAR(20) NOT NULL UNIQUE,
	DIENTHOAI NVARCHAR(12),
	DIACHI NVARCHAR(200)
);
GO


-- Bảng SINHVIEN lưu thông tin về các sinh viên có cấu trúc như sau:
CREATE TABLE SINHVIEN
(
	MASV CHAR(6) NOT NULL PRIMARY KEY,
	HO NVARCHAR(25) NOT NULL,
	TEN NVARCHAR(15) NOT NULL,
	NGAYSINH DATETIME,
	GIOITINH NVARCHAR(3) DEFAULT 'Nữ',
	MAKHOA CHAR(4) REFERENCES KHOA(MAKHOA),
	DIENTHOAI VARCHAR(12),
	QUEQUAN NVARCHAR(20),
	DOITUONG NVARCHAR(50) DEFAULT 'KHAC' CHECK (DOITUONG IN ('TBLS', 'DTVC', 'GDKK', 'KHAC'))
);
GO


-- Bảng MONHOC lưu thông tin về các môn học có cấu trúc như sau:
CREATE TABLE MONHOC
(
	MAMH CHAR(6) NOT NULL PRIMARY KEY,
	TENMH NVARCHAR(40) NOT NULL,
	DVHT CHAR(1) DEFAULT '3',
	HOCKY CHAR(2)
);
GO	


-- Bảng DANGKYHOC lưu thông tin về các môn học có cấu trúc như sau:
CREATE TABLE DANGKYHOC
(
	MASV CHAR(6) NOT NULL,
	MAMH CHAR(6) NOT NULL,
	HOCKY CHAR(2),
	PRIMARY KEY (MASV, MAMH),
	FOREIGN KEY (MASV) REFERENCES SINHVIEN(MASV),
	FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
);
GO


-- Bảng KETQUA lưu thông tin về điểm kết quả học tập của sinh viên có cấu trúc như sau:
CREATE TABLE KETQUA
(
    MASV CHAR(6) NOT NULL, 
    MAMH CHAR(6) NOT NULL,
    DIEM FLOAT CHECK (DIEM >= 0 AND DIEM <= 10),
    KQHOC CHAR(1) CHECK (KQHOC IN ('H', 'Q', 'C', 'L')),
    PRIMARY KEY (MASV, MAMH),
	FOREIGN KEY (MASV) REFERENCES SINHVIEN(MASV),
	FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
);
GO





/*
	2. Dùng câu lệnh T- SQL nhập dữ liệu cho các bảng trên, mỗi bảng ít nhất 3 bản
	ghi, còn lại có thể nhập trực tiếp bằng Object Explorer ( có thể tham khảo dữ liệu
	hình dưới)


*/

-- Nhập dữ liệu vào bảng KHOA những thông tin sau:
	INSERT INTO KHOA (MAKHOA, TENKHOA, DIACHI, DIENTHOAI)
	VALUES ('CNTT', N'Công Nghệ Thông Tin', N'Nhà C', '37547100');
	INSERT INTO KHOA (MAKHOA, TENKHOA, DIACHI, DIENTHOAI)
	VALUES ('DIAL', N'Địa Lý', N'Nhà A1', NULL);
	INSERT INTO KHOA (MAKHOA, TENKHOA, DIACHI, DIENTHOAI)
	VALUES ('HOAH', N'Hóa Học', N'Nhà A2', NULL);
	INSERT INTO KHOA (MAKHOA, TENKHOA, DIACHI, DIENTHOAI)
	VALUES ('TOAN', N'Toán-Tin', N'Nhà C', '37547325');
	INSERT INTO KHOA (MAKHOA, TENKHOA, DIACHI, DIENTHOAI)
	VALUES ('VATL', N'Vật Lý', N'Nhà B', '0828007853');
	GO


-- Nhập dữ liệu vào bảng SINHVIEN những thông tin sau:
	INSERT INTO SINHVIEN (MASV, HO, TEN, NGAYSINH, GIOITINH, MAKHOA, DIENTHOAI, QUEQUAN, DOITUONG) 
	VALUES
		('K61001', N'Nguyễn', N'Thị Hồng', '2003-05-10', N'Nữ', 'TOAN', '0987654321', N'Hà Nội', 'DTVC'),
		('K61002', N'Phạm', N'Trung', '2002-01-15', N'Nam', 'CNTT', '0123456789', N'Hà Nội', 'GDKK'),
		('K61003', N'Nguyễn', N'Thị Lan', '1997-12-20', N'Nữ', 'DIAL', '0987654321', N'Thái Bình', 'TBLS'),
		('K61004', N'Trần', N'Thị Mai', '1999-03-01', N'Nữ', 'CNTT', '0123456789', N'Hà Nội', 'KHAC'),
		('K61005', N'Lê', N'Thiện', '2002-04-04', N'Nam', 'DIAL', '0987654321', N'Hà Nội', 'DTVC'),
		('K61006', N'Nguyễn', N'Thiên', '2001-09-20', N'Nam', 'HOAH', '0123456789', N'Bắc Ninh', 'GDKK'),
		('K61007', N'Hoàng', N'Thị Kim', '2003-08-11', N'Nữ', 'DIAL', '0987654321', N'Thái Bình', 'DTVC'),
		('K61008', N'Trần', N'Thị Hương', '2000-04-25', N'Nữ', 'CNTT', '0123456789', N'Hà Nội', 'KHAC');
		GO


-- Nhập dữ liệu vào bảng MONHOC các giá trị sau:
	INSERT INTO MONHOC (MAMH, TENMH, DVHT, HOCKY)
	VALUES
		('DSTT', N'Tin học đại cương', '4', '01'),
		('GT1', N'Thống kê ứng dụng', '3', '02'),
		('HH', N'Toán cao cấp', '4', '03'),
		('XSTK', N'Đại số tuyến tính', '3', '04');
		GO


-- Nhập dữ liệu vào bảng DANGKYHOC gồm những thông tin sau:
	INSERT INTO DANGKYHOC (MASV, MAMH, HOCKY)
	VALUES ('K61001', 'GT1', '1');
	INSERT INTO DANGKYHOC (MASV, MAMH, HOCKY)
	VALUES ('K61001', 'DSTT', '2');
	INSERT INTO DANGKYHOC (MASV, MAMH, HOCKY)
	VALUES ('K61001', 'HH', '1');
	INSERT INTO DANGKYHOC (MASV, MAMH, HOCKY)
	VALUES ('K61002', 'DSTT', '1');
	INSERT INTO DANGKYHOC (MASV, MAMH, HOCKY)
	VALUES ('K61002', 'XSTK', '2');
	INSERT INTO DANGKYHOC (MASV, MAMH, HOCKY)
	VALUES ('K61002', 'GT1', '1');
	INSERT INTO DANGKYHOC (MASV, MAMH, HOCKY)
	VALUES ('K61003', 'HH', '1');
	INSERT INTO DANGKYHOC (MASV, MAMH, HOCKY)
	VALUES ('K61003', 'GT1', '1');
	INSERT INTO DANGKYHOC (MASV, MAMH, HOCKY)
	VALUES ('K61003', 'XSTK', '2');
	INSERT INTO DANGKYHOC (MASV, MAMH, HOCKY)
	VALUES ('K61004', 'XSTK', '3');
	INSERT INTO DANGKYHOC (MASV, MAMH, HOCKY)
	VALUES ('K61004', 'DSTT', '3');
	INSERT INTO DANGKYHOC (MASV, MAMH, HOCKY)
	VALUES ('K61004', 'GT1', '1');
	GO



-- Nhập dữ liệu vào bảng KETQUA gồm những thông tin sau:
	INSERT INTO KETQUA (MASV, MAMH, DIEM, KQHOC)
	VALUES 
		('K61001', 'DSTT', 7.5, 'H'),
		('K61002', 'GT1', 8.0, 'H'),
		('K61003', 'HH', 6.5, 'Q'),
		('K61004', 'XSTK', 6.0, 'Q'),
		('K61005', 'DSTT', 7.5, 'H'),
		('K61006', 'GT1', 8.0, 'H'),
		('K61007', 'XSTK', 9.0, 'H'),
		('K61008', 'GT1', 8.5, 'H');
		GO


