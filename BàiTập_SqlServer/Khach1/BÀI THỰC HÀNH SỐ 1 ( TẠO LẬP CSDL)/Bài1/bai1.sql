
/*
	Bài 1
*/

-- Bài 1:
	-- 1. Tạo CSDL có tên QLNV bao gồm các bảng có cấu trúc như sau:
	-- Tạo CSDL có tên QLNV
	CREATE DATABASE QLNV
	GO
	USE QLNV
	GO

-- Bảng PHONG lưu trữ thông tin về các phòng ban trong cơ quan.
	CREATE TABLE PHONG 
	(
		MAPHONG CHAR(3),
		TENPHONG NVARCHAR(40),
		DIACHI NVARCHAR(50),
		TEL CHAR(10),
		PRIMARY KEY (MAPHONG)
	);
	GO


-- Bảng DMNN lưu trữ danh mục các ngoại ngữ
	CREATE TABLE DMNN
	(
		MANN CHAR(2),
		TENNN NVARCHAR(20),
		PRIMARY KEY (MANN)
	);
	GO


-- Bảng NHANVIEN lưu trữ thông tin chung về nhân viên
	CREATE TABLE NHANVIEN
	(
		MANV CHAR(5),
		HOTEN NVARCHAR(40),
		GIOITINH NCHAR(3),
		NGAYSINH DATETIME,
		LUONG INT,
		MAPHONG CHAR(3),
		SDT CHAR(10),
		NGAYBC DATETIME,
		PRIMARY KEY (MANV)
	);
	GO


-- Bảng TDNN lưu trữ thông tin về trình độ ngoại ngữ của các nhân viên trong cơ quan.
	CREATE TABLE TDNN
	(
		MANV CHAR(5), 
		MANN CHAR(2),
		TDO CHAR(1),
		PRIMARY KEY (MANV, MANN)
	);
	GO


-- Bài 1.2:
-- 2. Nhập dữ liệu cho các bảng trong cơ sở dữ liệu QLNV theo mẫu sau:

-- Nhập dữ liệu cho bảng PHONG gồm các bản ghi:
	INSERT INTO PHONG (MAPHONG, TENPHONG, DIACHI, TEL)
	VALUES ('HCA', N'Hành chính tổ hợp', N'123, Láng Hạ, Đống Đa, Hà Nội', '04 8585793');
	GO
	INSERT INTO PHONG (MAPHONG, TENPHONG, DIACHI, TEL)
	VALUES ('KDA', N'Kinh Doanh', N'123, Láng Hạ, Đống Đa, Hà Nội', '04 8574943');
	GO
	INSERT INTO PHONG (MAPHONG, TENPHONG, DIACHI, TEL)
	VALUES ('KTA', N'Kỹ thuật', N'123, Láng Hạ, Đống Đa, Hà Nội', '04 9480485');
	GO
	INSERT INTO PHONG (MAPHONG, TENPHONG, DIACHI, TEL)
	VALUES ('QTA', N'Quản trị', N'123, Láng Hạ, Đống Đa, Hà Nội', '04 8508585');
	GO


-- Nhập dữ liệu cho bảng DMNN gồm các bản ghi:
	INSERT INTO DMNN (MANN, TENNN)
	VALUES ('01', N'Anh');
	GO
	INSERT INTO DMNN (MANN, TENNN)
	VALUES ('02', N'Nga');
	GO
	INSERT INTO DMNN (MANN, TENNN)
	VALUES ('03', N'Pháp');
	GO
	INSERT INTO DMNN (MANN, TENNN)
	VALUES ('04', N'Nhật');
	GO
	INSERT INTO DMNN (MANN, TENNN)
	VALUES ('05', N'Trung Quốc');
	GO
	INSERT INTO DMNN (MANN, TENNN)
	VALUES ('06', N'Hàn Quốc');
	GO


-- Nhập dữ liệu cho bảng nhân viên gồm các bản ghi:
	INSERT INTO NHANVIEN (MANV, HOTEN, GIOITINH, NGAYSINH, LUONG, MAPHONG, SDT, NGAYBC)
	VALUES ('HC001', N'Nguyễn Thị Hà', N'Nữ', '1950-08-27', 2500000, 'HCA', NULL, '1975-02-08');
	INSERT INTO NHANVIEN (MANV, HOTEN, GIOITINH, NGAYSINH, LUONG, MAPHONG, SDT, NGAYBC)
	VALUES ('HC002', N'Trần Văn Nam', N'Nam','1975-06-12',3000000,'HCA',NULL,'1997-06-08');
	INSERT INTO NHANVIEN (MANV, HOTEN, GIOITINH, NGAYSINH, LUONG, MAPHONG, SDT, NGAYBC)
	VALUES ('HC003', N'Nguyễn Thanh Huyền', N'Nữ', '1978-07-03', 1500000, 'HCA', NULL, '1999-09-24');
	INSERT INTO NHANVIEN (MANV, HOTEN, GIOITINH, NGAYSINH, LUONG, MAPHONG, SDT, NGAYBC)
	VALUES ('KD001', N'Lê Tuyết Anh', N'Nữ', '1977-02-03', 2500000, 'KDA', NULL, '2001-10-02');
	INSERT INTO NHANVIEN (MANV, HOTEN, GIOITINH, NGAYSINH, LUONG, MAPHONG, SDT, NGAYBC)
	VALUES ('KD002', N'Nguyễn Anh Tú', N'Nam', '1942-07-04', 2600000, 'KDA', NULL, '1999-09-24');
	INSERT INTO NHANVIEN (MANV, HOTEN, GIOITINH, NGAYSINH, LUONG, MAPHONG, SDT, NGAYBC)
	VALUES ('KD003', N'Phạm An Thái', N'Nam', '1977-05-09', 1600000, 'KDA', NULL, '1999-09-24');
	INSERT INTO NHANVIEN (MANV, HOTEN, GIOITINH, NGAYSINH, LUONG, MAPHONG, SDT, NGAYBC)
	VALUES ('KD004', N'Lê Văn Hải', N'Nam', '1976-01-02', 2700000, 'KDA', NULL, '1997-06-08');
	INSERT INTO NHANVIEN (MANV, HOTEN, GIOITINH, NGAYSINH, LUONG, MAPHONG, SDT, NGAYBC)
	VALUES ('KD005', N'Nguyễn Phương Minh', N'Nam', '1980-01-02', 2000000, 'KDA', NULL, '2001-10-02');
	INSERT INTO NHANVIEN (MANV, HOTEN, GIOITINH, NGAYSINH, LUONG, MAPHONG, SDT, NGAYBC)
	VALUES ('KT001', N'Trần Đình Khâm', 'Nam', '1981-12-02', 2700000, 'KTA', NULL, '2005-01-01');
	INSERT INTO NHANVIEN (MANV, HOTEN, GIOITINH, NGAYSINH, LUONG, MAPHONG, SDT, NGAYBC)
	VALUES ('KT002', N'Nguyễn Mạnh Hùng', N'Nam', '1980-08-16', 2300000, 'KTA', NULL, '2005-01-01');
	INSERT INTO NHANVIEN (MANV, HOTEN, GIOITINH, NGAYSINH, LUONG, MAPHONG, SDT, NGAYBC)
	VALUES ('KT003', N'Phạm Thanh Sơn', 'Nam', '1984-08-20', 2000000, 'KTA', NULL, '2005-01-01');
	INSERT INTO NHANVIEN (MANV, HOTEN, GIOITINH, NGAYSINH, LUONG, MAPHONG, SDT, NGAYBC)
	VALUES ('KT004', N'Vũ Thị Hoài', N'Nữ', '1980-12-05', 2500000, 'KTA', NULL, '2001-10-02');
	INSERT INTO NHANVIEN (MANV, HOTEN, GIOITINH, NGAYSINH, LUONG, MAPHONG, SDT, NGAYBC)
	VALUES ('KT005', N'Nguyễn Thu Lan', N'Nữ', '1977-10-05', 3000000, 'KTA', NULL, '2001-10-02');
	INSERT INTO NHANVIEN (MANV, HOTEN, GIOITINH, NGAYSINH, LUONG, MAPHONG, SDT, NGAYBC)
	VALUES ('KT006', N'Trần Hoài Nam', N'Nam', '1978-07-02', 2800000, 'KTA', NULL, '1977-06-08');
	INSERT INTO NHANVIEN (MANV, HOTEN, GIOITINH, NGAYSINH, LUONG, MAPHONG, SDT, NGAYBC)
	VALUES ('KT007', N'Hoàng Nam Sơn', N'Nam', '1940-12-03', 3000000, 'KTA', NULL, '1965-07-02');
	INSERT INTO NHANVIEN (MANV, HOTEN, GIOITINH, NGAYSINH, LUONG, MAPHONG, SDT, NGAYBC)
	VALUES ('KT008', N'Lê Thu Trang', N'Nữ', '1950-07-06', 2500000, 'KTA', NULL, '1968-08-02');
	INSERT INTO NHANVIEN (MANV, HOTEN, GIOITINH, NGAYSINH, LUONG, MAPHONG, SDT, NGAYBC)
	VALUES ('KT009', N'Khúc Nam Hải', N'Nam', '1980-07-22', 2000000, 'KTA', NULL, '2005-01-01');
	INSERT INTO NHANVIEN (MANV, HOTEN, GIOITINH, NGAYSINH, LUONG, MAPHONG, SDT, NGAYBC)
	VALUES ('KT010', N'Phùng Trung Dũng', N'Nam', '1978-08-28', 2200000, 'KTA', NULL, '1999-09-24');
	GO


-- Nhập dữ liệu cho bảng TDNN gồm các bản ghi:
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('HC001', '01', 'A');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('HC001', '02', 'B');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('HC002', '01', 'C');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('HC002', '03', 'C');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('HC003', '01', 'D');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('KD001', '01', 'C');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('KD001', '02', 'B');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('KD002', '01', 'D');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('KD002', '02', 'A');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('KD003', '01', 'B');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('KD003', '02', 'C');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('KD004', '01', 'C');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('KD004', '04', 'A');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('KD004', '05', 'A');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('KD005', '01', 'B');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('KD005', '02', 'D');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('KD005', '03', 'B');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('KD005', '04', 'B');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('KT001', '01', 'D');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('KT001', '04', 'E');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('KT002', '01', 'C');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('KT002', '02', 'B');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('KT003', '01', 'D');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('KT003', '03', 'C');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('KT004', '01', 'D');
	INSERT INTO TDNN (MANV, MANN, TDO)
	VALUES ('KT005', '01', 'C');
	GO

	


/*
-- Bai1.3:  3. Thiết lập ràng buộc

Trên CSDL QLNV của bài thực hành quản lý nhân viên thêm các ràng buộc sau:
	1. Tên phòng trong bảng PHONG là duy nhất.
	2. Tên ngoại ngữ trong bảng DM ngoại ngữ là duy nhất
	3. Trường lương trong bảng nhân viên luôn>=0 và nhận giá trị mặc định là 0.
	4. Trường MAPHONG trong bảng NHAN_VIEN tham chiếu đến MAPHONG
	trong bảng PHONG và cho phép cập nhật và xoá tham chiếu.
	5. Trường MANV, MANN trong bảng TDNN lần lượt tham chiếu đến các trường
	MANV trong bảng NHAN_VIEN và MANN trong bảng DMNN. Các tham
	chiếu này cho phép cập nhật và xoá tự động.
	6. Trường TDO trong bảng TDNN chỉ nhận một trong các giá trị A, B, C, D, E, F
	và mặc định nhận giá trị A.
	7. Dùng câu lệnh T- SQL nhập dữ liệu cho các bảng trên, mỗi bảng ít nhất 3 bản
	ghi, còn lại có thể nhập trực tiếp bằng Object Explorer ( có thể tham khảo dữ liệu
	hình dưới)

*/

-- 1. Tên phòng trong bảng PHONG là duy nhất.
	ALTER TABLE PHONG
		ADD CONSTRAINT UK_TENPHONG UNIQUE (TENPHONG);
		GO


-- 2. Tên ngoại ngữ trong bảng DM ngoại ngữ là duy nhất.
	ALTER TABLE DMNN
		ADD CONSTRAINT UK_TENNN UNIQUE (TENNN);
		GO


-- 3. Trường lương trong bảng nhân viên luôn >= 0 và nhận giá trị mặc định là 0.
	-- Thêm trường LUONG với giá trị mặc định là 0 và ràng buộc CHECK
	ALTER TABLE NHANVIEN
		ADD LUONG INT DEFAULT 0
		CONSTRAINT CK_LUONG CHECK (LUONG >= 0);
		GO

	

-- 4. Trường MAPHONG trong bảng NHAN_VIEN tham chiếu đến MAPHONG trong bảng PHONG và cho phép cập nhật và xoá tham chiếu.
	ALTER TABLE NHANVIEN
		ADD CONSTRAINT FK_MAPHONG FOREIGN KEY (MAPHONG)
		REFERENCES PHONG (MAPHONG)
		ON UPDATE CASCADE
		ON DELETE CASCADE;
		GO


-- 5. Trường MANV, MANN trong bảng TDNN lần lượt tham chiếu đến các trường MANV trong bảng NHAN_VIEN và MANN trong bảng DMNN. 
-- Các tham chiếu này cho phép cập nhật và xoá tự động.
	ALTER TABLE TDNN
		ADD CONSTRAINT FK_MANV FOREIGN KEY (MANV)
		REFERENCES NHANVIEN (MANV)
		ON UPDATE CASCADE
		ON DELETE CASCADE;
		GO

	ALTER TABLE TDNN
		ADD CONSTRAINT FK_MANN FOREIGN KEY (MANN)
		REFERENCES DMNN (MANN)
		ON UPDATE CASCADE
		ON DELETE CASCADE;
		GO


-- 6. Trường TDO trong bảng TDNN chỉ nhận một trong các giá trị A, B, C, D, E, F và mặc định nhận giá trị A.
	-- Thêm trường TDO với giá trị mặc định là 'A' và ràng buộc CHECK
	ALTER TABLE TDNN
		ADD TDO CHAR(1) DEFAULT 'A'
		CONSTRAINT CK_TDO CHECK (TDO IN ('A', 'B', 'C', 'D', 'E', 'F'));
		GO


