
/*
	Về nhà các em thực hiện  tạo bảng + tạo quan hệ cho các bảng:
	1. NGANHHOC
	2. LOPHOC
	3. SINHVIEN
	4. PHIEUMUON
	5. THELOAI
	6. SACH
	7. TACGIA
	8. CTPMUON
	9 SACH_TG
	Tks All!
*/

-- Tạo database QLSACH (Quản Lý Sách)
CREATE DATABASE QUANLYSACH
GO


USE QUANLYSACH
GO


-- 1. tạo Bảng NGANHHOC: lưu thông tin về các ngành học.

	CREATE TABLE NGANHHOC (
		MaNganhHoc INT PRIMARY KEY,
		TenNganhHoc NVARCHAR(50) NOT NULL
	);
	GO



-- 2. tạo Bảng LOPHOC: lưu thông tin về các lớp học.
	CREATE TABLE LOPHOC (
		MaLopHoc INT PRIMARY KEY,
		TenLopHoc VARCHAR(50) NOT NULL,
		MaNganhHoc INT,
		FOREIGN KEY (MaNganhHoc) REFERENCES NGANHHOC(MaNganhHoc)
	);
	GO



-- 3. Tạo Bảng SINHVIEN: lưu thông tin về các sinh viên.
	CREATE TABLE SINHVIEN (
		MaSinhVien INT PRIMARY KEY,
		TenSinhVien NVARCHAR(50) NOT NULL,
		GioiTinh NVARCHAR(10) NOT NULL,
		MaLopHoc INT,
		FOREIGN KEY (MaLopHoc) REFERENCES LOPHOC(MaLopHoc)
	);
	GO



-- 4. tạo Bảng PHIEUMUON: lưu thông tin về các phiếu mượn sách.
	CREATE TABLE PHIEUMUON (
		MaPhieuMuon INT PRIMARY KEY,
		MaSinhVien INT,
		NgayMuon DATE NOT NULL,
		NgayTra DATE,
		FOREIGN KEY (MaSinhVien) REFERENCES SINHVIEN(MaSinhVien)
	);
	GO



-- 5. tạo Bảng THELOAI: lưu thông tin về các thể loại sách.
	CREATE TABLE THELOAI (
		MaTheLoai INT PRIMARY KEY,
		TenTheLoai NVARCHAR(50) NOT NULL
	);
	GO



-- 6. tạo Bảng SACH: lưu thông tin về các cuốn sách.

	CREATE TABLE SACH (
		MaSach INT PRIMARY KEY,
		TenSach NVARCHAR(50) NOT NULL,
		TacGia NVARCHAR(50) NOT NULL,
		MaTheLoai INT,
		SoLuong INT,
		FOREIGN KEY (MaTheLoai) REFERENCES THELOAI(MaTheLoai)
	);
	GO



-- 7. Tạp Bảng TACGIA: lưu thông tin về các tác giả.
	CREATE TABLE TACGIA (
		MaTacGia INT PRIMARY KEY,
		TenTacGia NVARCHAR(50) NOT NULL
	);
	GO



-- 8. tạo Bảng CTPMUON: lưu thông tin về chi tiết mượn sách.
	CREATE TABLE CTPMUON (
		MaPhieuMuon INT,
		MaSach INT,
		SoLuongMuon INT NOT NULL,
		PRIMARY KEY (MaPhieuMuon, MaSach),
		FOREIGN KEY (MaPhieuMuon) REFERENCES PHIEUMUON(MaPhieuMuon),
		FOREIGN KEY (MaSach) REFERENCES SACH(MaSach)
	);
	GO



-- 9. tạo Bảng SACH_TG: lưu thông tin về các tác giả của từng cuốn sách.
	CREATE TABLE SACH_TG (
		MaSach INT,
		MaTacGia INT,
		PRIMARY KEY (MaSach, MaTacGia),
		FOREIGN KEY (MaSach) REFERENCES SACH(MaSach),
		FOREIGN KEY (MaTacGia) REFERENCES TACGIA(MaTacGia)
	);
	GO




-- Phần insert giá trị cho bảng


-- 1. Insert giá trị Bảng NGANHHOC:

	INSERT INTO NGANHHOC (MaNganhHoc, TenNganhHoc)
	VALUES 
		(1, N'Công nghệ thông tin'),
		(2, N'Kinh tế'),
		(3, N'Ngôn ngữ Anh');
		GO


-- 2. Insert giá trị cho Bảng LOPHOC:
	INSERT INTO LOPHOC (MaLopHoc, TenLopHoc, MaNganhHoc)
	VALUES 
		(1, 'CNTT1', 1),
		(2, 'KT1', 2),
		(3, 'NNAT1', 3);
		GO



-- 3. iNSERT giá trị Bảng SINHVIEN:
	INSERT INTO SINHVIEN (MaSinhVien, TenSinhVien, GioiTinh, MaLopHoc)
	VALUES 
		(1, N'Nguyễn Văn A', N'Nam', 1),
		(2, N'Trần Thị B', N'Nữ', 1),
		(3, N'Lê Hoàng C', N'Nam', 2),
		(4, N'Phạm Thu D', N'Nữ', 2),
		(5, N'Ngô Đức E', N'Nam', 3),
		(6, N'Lý Thanh F', N'Nữ', 3);
		GO


-- 4. Insert giá trị Bảng PHIEUMUON:
	INSERT INTO PHIEUMUON (MaPhieuMuon, MaSinhVien, NgayMuon, NgayTra)
	VALUES (1, 1, '2023-03-18', NULL),
		   (2, 3, '2023-03-19', '2023-03-25'),
		   (3, 5, '2023-03-20', NULL);
		   GO



-- 5. insert giá trị Bảng THELOAI:
	INSERT INTO THELOAI (MaTheLoai, TenTheLoai)
	VALUES (1, N'Truyện tranh'),
		   (2, N'Tiểu thuyết'),
		   (3, N'Khoa học');
		   GO

-- 6. insert giá trị Bảng SACH:
	INSERT INTO SACH (MaSach, TenSach, TacGia, MaTheLoai, SoLuong)
	VALUES (1, 'One Piece', 'Oda Eiichiro', 1, 20),
		   (2, 'Doraemon', 'Fujiko F. Fujio', 1, 15),
		   (3, 'Harry Potter', 'J.K. Rowling', 2, 10),
		   (4, 'Sherlock Holmes', 'Arthur Conan Doyle', 2, 5),
		   (5, 'A Brief History of Time', 'Stephen Hawking', 3, 7),
		   (6, 'The Origin of Species', 'Charles Darwin', 3, 3);
		   GO


-- 7. GIÁ TRỊ Bảng TACGIA:
	INSERT INTO TACGIA (MaTacGia, TenTacGia)
	VALUES (1, 'Oda Eiichiro'),
		   (2, 'Fujiko F. Fujio'),
		   (3, 'J.K. Rowling'),
		   (4, 'Arthur Conan Doyle'),
		   (5, 'Stephen Hawking'),
		   (6, 'Charles Darwin');
			GO


-- 8. insert giá trị Bảng CTPMUON:
	INSERT INTO CTPMUON (MaPhieuMuon, MaSach, SoLuongMuon)
	VALUES (1, 1, 2),
		   (1, 2, 1),
		   (2, 3, 2),
		   (2, 4, 1),
		   (3, 5, 3);
		   GO
			

-- 9. GIÁ TRỊ Bảng SACH_TG:
	INSERT INTO SACH_TG (MaSach, MaTacGia)
	VALUES (1, 1),
		   (2, 2),
		   (3, 3),
		   (4, 4),
		   (5, 5),
		   (6, 6);
		   GO

