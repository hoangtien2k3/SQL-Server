
-- PHẦN 2:

/*
	1. Thêm vào bảng PHONG thuộc tính NamTL (năm thành lập) có kiểu dữ liệu INT
	2. Thay đổi kiểu dữ liệu cho cột NamTL từ INT thành SMALLINT
	3. Đổi tên thuộc tính NamTL thành NamThanhLap
	4. Tạo ràng buộc cho thuộc tính NamThanhLap, kiểm tra >= 1990
	5. Xoá ràng buộc CHECK cho thuộc tính NamThanhLap
	6. Xoá thuộc tính NamThanhLap
	7. Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, gồm các
	thông Họ tên sinh viên, Ngày sinh, Giới tình.
	8. Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm các
	thông Mã khoa, Tên khoa.
	9. Cho biết những sinh viên có ngày sinh từ ngày 01/01/2002 đến ngày
	05/06/2003 gồm các thông tin: Mã sinh viên, Họ sinh viên, Tên sinh viên Ngày sinh,
	Que quan.
	10. Cho biết danh sách những sinh viên mà tên có chứa ký tự nằm trong khoảng từ
	A đến M, gồm các thông tin: Họ tên sinh viên, Ngày sinh, Nơi sinh. Danh sách được
	sắp xếp tăng dần theo tên sinh viên.
	11. Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02, gồm các thông
	tin: Họ sinh viên, Tên sinh viên, Ngày sinh.
	12. Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh viên,
	Tuổi, Mã Khoa.
	Hướng dẫn: Tuoi = YEAR(GETDATE()) – YEAR(NgaySinh)
	13. Cho biết tổng số sinh viên của từng khoa.
	14. Cho biết môn học nào có 15 sinh viên đăng ký.
	15. Cho biết sinh viên khoa CNTT có tuổi lớn nhất.
	16. Cho biết sinh viên có nơi sinh cùng với sinh viên có tên A.
	17. Với mỗi sinh viên cho biết điểm thi cao nhất của môn tương ứng. 
	18. Với mỗi môn học cho biết bao nhiêu sinh viên đã học môn đó
	19. Cho biết sinh viên chưa thi môn Hệ quản trị cơ sở dữ liệu.
	20. Cho biết những môn được tất cả các sinh viên theo học.
	21. Cho biết những sinh viên học những môn giống sinh viên có mã số AB012345
	học.
	22. Cho biết những sinh viên học số môn bằng đúng những môn mà sinh viên
	AB123456 học.
	23. Xoá tất cả những sinh viên chưa dự thi môn nào.
	24. Tạo view danh sách sinh viên học môn Phân tích TKHT và môn Cơ sở dữ liệu
	25. Tạo view danh sách sinh viên có điểm thi lớn hơn 5
*/


USE QLNV
GO

-- 1. Thêm vào bảng PHONG thuộc tính NamTL (năm thành lập) có kiểu dữ liệu INT
	ALTER TABLE PHONG ADD NamTL INT;
	GO



-- 2. Câu lệnh thay đổi kiểu dữ liệu của cột NamTL từ INT thành SMALLINT:
	ALTER TABLE PHONG ALTER COLUMN NamTL TYPE SMALLINT;
	GO



-- 3. Câu lệnh đổi tên thuộc tính NamTL thành NamThanhLap:
	ALTER TABLE PHONG RENAME COLUMN NamTL TO NamThanhLap;
	GO



-- 4. Câu lệnh tạo ràng buộc cho thuộc tính NamThanhLap, kiểm tra giá trị lớn hơn hoặc bằng 1990:
	ALTER TABLE PHONG ADD CONSTRAINT NamThanhLap_check CHECK (NamThanhLap >= 1990);
	GO



-- 5. Xoá ràng buộc CHECK cho thuộc tính NamThanhLap:
	ALTER TABLE PHONG DROP CONSTRAINT NamThanhLap_check;
	GO


-- 6. Xoá thuộc tính NamThanhLap:
	ALTER TABLE PHONG DROP COLUMN NamThanhLap;
	GO



USE QLSV
GO

-- 7. Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, gồm các
-- thông Họ tên sinh viên, Ngày sinh, Giới tình.

	SELECT SV.HO, SV.TEN, SV.NGAYSINH, SV.GIOITINH
	FROM SINHVIEN AS SV
	WHERE RIGHT(SV.TEN, 1) = 'I'; -- nghĩa là right sẽ lấy ra 1 ký tự bên phải của trường tên.
	GO



-- 8. Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm các
-- thông Mã khoa, Tên khoa.

	SELECT K.MAKHOA, K.TENKHOA
	FROM KHOA AS K
	WHERE SUBSTRING(K.TENKHOA, 2, 1) = 'N';
	GO
	


-- 9. Cho biết những sinh viên có ngày sinh từ ngày 01/01/2002 đến ngày
-- 05/06/2003 gồm các thông tin: Mã sinh viên, Họ sinh viên, Tên sinh viên Ngày sinh,
-- Que quan.

	SELECT SV.MASV, SV.HO, SV.TEN, SV.NGAYSINH, SV.QUEQUAN
	FROM SINHVIEN AS SV
	WHERE SV.NGAYSINH BETWEEN '2002-01-01' AND '2003-06-05';
	GO




/*
	10. Cho biết danh sách những sinh viên mà tên có chứa ký tự nằm trong khoảng từ
	A đến M, gồm các thông tin: Họ tên sinh viên, Ngày sinh, Nơi sinh. Danh sách được
	sắp xếp tăng dần theo tên sinh viên. 
*/

	SELECT SINHVIEN.HO, SINHVIEN.TEN, SINHVIEN.NGAYSINH, SINHVIEN.QUEQUAN
	FROM SINHVIEN
	WHERE SINHVIEN.TEN LIKE '%[A-M]%'
	ORDER BY SINHVIEN.TEN ASC;
	GO



/*
	11. Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02, gồm các thông
	tin: Họ sinh viên, Tên sinh viên, Ngày sinh.
*/

	SELECT SV.HO, SV.TEN, SV.NGAYSINH 
	FROM SINHVIEN AS SV
	WHERE SV.QUEQUAN LIKE '%Hà Nội%' AND MONTH(SV.NGAYSINH) = 2;
	GO



/*
	12. Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh viên,
	Tuổi, Mã Khoa.
	Hướng dẫn: Tuoi = YEAR(GETDATE()) – YEAR(NgaySinh)
*/

	SELECT SV.HO + ' ' + SV.TEN AS [Ho ten], YEAR(GETDATE()) - YEAR(SV.NGAYSINH) AS Tuoi, MaKhoa
	FROM SINHVIEN AS SV
	WHERE YEAR(GETDATE()) - YEAR(SV.NGAYSINH) > 20;
	GO



-- 13. Cho biết tổng số sinh viên của từng khoa.

	SELECT SINHVIEN.MAKHOA, COUNT(*) AS TongSV
	FROM SINHVIEN
	GROUP BY SINHVIEN.MAKHOA;
	GO



-- 14. Cho biết môn học nào có 15 sinh viên đăng ký.

	SELECT MONHOC.MAMH, MONHOC.TENMH
	FROM MONHOC
	WHERE MONHOC.MAMH 
	IN (
		SELECT DANGKYHOC.MAMH
		FROM DANGKYHOC
		GROUP BY DANGKYHOC.MAMH
		HAVING COUNT(*) = 15
	);
	GO



-- 15. Cho biết sinh viên khoa CNTT có tuổi lớn nhất.
	SELECT TOP 1 SV.HO + ' ' + SV.TEN AS [Ho ten], YEAR(GETDATE()) - YEAR(SV.NGAYSINH) AS Tuoi
	FROM SINHVIEN AS SV
	WHERE SV.MAKHOA = 'CNTT'
	ORDER BY Tuoi DESC;
	GO



-- 16. Cho biết sinh viên có nơi sinh cùng với sinh viên có tên A.

	SELECT SV.HO, SV.TEN, SV.NGAYSINH, SV.QUEQUAN
	FROM SINHVIEN AS SV
	WHERE SV.QUEQUAN = (SELECT sv.QUEQUAN FROM SINHVIEN AS sv WHERE sv.TEN = 'A');
	GO



-- 18. Với mỗi môn học cho biết bao nhiêu sinh viên đã học môn đó

	SELECT MH.TENMH, MH.MAMH, COUNT(*) as SoLuongSinhVien
	FROM MONHOC AS MH, KETQUA AS KQ
	GROUP BY MH.MAMH, MH.TENMH;
	GO


-- 19. Cho biết sinh viên chưa thi môn Hệ quản trị cơ sở dữ liệu.

	SELECT SINHVIEN.MASV, SINHVIEN.HO, SINHVIEN.TEN
	FROM SINHVIEN
	WHERE SINHVIEN.MASV 
	NOT IN (
	  SELECT KQ.MASV
	  FROM KETQUA AS KQ
	  WHERE KQ.MAMH = 'HQTCSDL'
	);
	GO



-- 20. Cho biết những môn được tất cả các sinh viên theo học.

	SELECT KETQUA.MAMH
	FROM KETQUA
	GROUP BY KETQUA.MAMH
	HAVING COUNT(DISTINCT MASV) = 
	(
	  SELECT COUNT(*) FROM SINHVIEN
	);



-- 21. Cho biết những sinh viên học những môn giống sinh viên có mã số AB012345 học.

	SELECT DISTINCT SINHVIEN.MASV, HO, TEN
	FROM KETQUA, SINHVIEN
	WHERE MAMH 
	IN (
	  SELECT MAMH
	  FROM KETQUA
	  WHERE MASV = 'AB012345'
	);
	GO



-- 22. Cho biết những sinh viên học số môn bằng đúng những môn mà sinh viên AB123456 học.

	SELECT SV.MASV, SV.HO, SV.TEN, COUNT(DISTINCT D.MAMH) AS SoMonHoc
	FROM SINHVIEN SV JOIN KETQUA D ON SV.MASV = D.MASV
	GROUP BY SV.MASV, SV.HO, SV.TEN
	HAVING COUNT(DISTINCT D.MaMH) = 
	(
		SELECT COUNT(*) AS SoMonHoc
		FROM KETQUA
		WHERE KETQUA.MASV = 'AB123456'
	) 
	AND NOT EXISTS 
	(
		SELECT * FROM KETQUA D2
		WHERE D2.MaSV = SV.MaSV AND D2.MaMH NOT IN (
			SELECT MaMH
			FROM KETQUA
			WHERE MASV = 'AB123456'
		)
	)
	GO



-- 23. Xoá tất cả những sinh viên chưa dự thi môn nào.

	DELETE FROM KETQUA WHERE KETQUA.MASV NOT IN (SELECT KETQUA.MASV FROM KETQUA)
	GO



-- 24. Tạo view danh sách sinh viên học môn Phân tích TKHT và môn Cơ sở dữ liệu

	CREATE VIEW SINHVIEN_PHANTICHTKHT_VS_CSDL AS
	SELECT SV.MASV, SV.DIENTHOAI, SV.NGAYSINH, SV.QUEQUAN
	FROM SINHVIEN SV
	JOIN KETQUA BD ON SV.MASV = BD.MASV
	JOIN MONHOC MH ON BD.MAMH = MH.MAMH
	WHERE MH.TENMH IN ('Phân tích TKHT', 'Cơ sở dữ liệu')
	GO



-- 25. Tạo view danh sách sinh viên có điểm thi lớn hơn 5

	CREATE VIEW SinhVienDiemLonHon5 AS
	SELECT SINHVIEN.MASV, SINHVIEN.HO, SINHVIEN.TEN, SINHVIEN.NGAYSINH, SINHVIEN.QUEQUAN, KETQUA.MAMH, KETQUA.DIEM
	FROM KETQUA, SINHVIEN
	WHERE KETQUA.DIEM > 5
	GO

