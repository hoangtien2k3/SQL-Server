
USE QUANLYBANHANG
GO

/* 1. Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh viên, Tên sinh viên, Học bổng.
Danh sách sẽ được sắp xếp theo thứ tự Mã sinh viên tăng dần
*/
	SELECT MaSV, HoSV, TenSV, HocBong
	FROM DSSinhVien
	ORDER BY MaSV ASC;




/*
2.	Danh sách các sinh viên gồm thông tin sau: Mã sinh viên, họ tên sinh viên, Phái, Ngày sinh. Danh sách sẽ 
được sắp xếp theo thứ tự Nam/Nữ.
*/
	SELECT DSSinhVien.MaSV, DSSinhVien.HoSV + ' ' + DSSinhVien.TenSV AS HoTen, DSSinhVien.Phai, DSSinhVien.NgaySinh
	FROM DSSinhVien
	ORDER BY DSSinhVien.Phai DESC




/*
3.	Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. Thông tin sẽ được sắp xếp theo thứ 
tự Ngày sinh tăng dần và Học bổng giảm dần.
*/
	SELECT DSSinhVien.HoSV + ' ' + DSSinhVien.TenSV AS HoTen,
		   DSSinhVien.NgaySinh,
		   DSSinhVien.HocBong
	FROM DSSinhVien
	INNER JOIN KetQua
	ON DSSinhVien.MaSV = KetQua.MaSV
	ORDER BY DSSinhVien.NgaySinh ASC, KetQua.Diem DESC;




/*
4.	Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm các thông tin: Họ tên sinh viên, 
Mã khoa, Nơi sinh, Học bổng.	
*/
	SELECT HoSV + ' ' + TenSV AS [Họ tên], DSSinhVien.MaKhoa, NoiSinh, HocBong
	FROM DSSinhVien
	JOIN DMKhoa ON DSSinhVien.MaKhoa = DMKhoa.MaKhoa
	WHERE HocBong >= 150000 AND NoiSinh = N'Hà Nội'



/*
5.	Danh sách những sinh viên có học bổng từ 80.000 đến 150.000, gồm các thông tin: Mã sinh viên, Ngày sinh, Phái, Mã khoa.
*/
	SELECT DSSinhVien.MaSV, DSSinhVien.NgaySinh, DSSinhVien.Phai, DSSinhVien.MaKhoa
	FROM DSSinhVien
	INNER JOIN DMKhoa ON DSSinhVien.MaKhoa = DMKhoa.MaKhoa
	WHERE DSSinhVien.HocBong BETWEEN 80000 AND 150000;




/*
6.	Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn 45, gồm các thông tin: Mã môn học, Tên môn học, Số tiết.
*/
	SELECT MaMH, TenMH, SoTiet
	FROM DMMonHoc
	WHERE SoTiet > 30 AND SoTiet < 45;




/*
7.	Danh sách những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh viên, Tuổi, Tên khoa.
*/

SELECT HoSV + ' ' + TenSV AS [Ho ten], 
    DATEDIFF(YEAR, NgaySinh, GETDATE()) AS [Tuoi], 
    TenKhoa AS [Ten khoa]
FROM DSSinhVien 
JOIN DMKhoa ON DSSinhVien.MaKhoa = DMKhoa.MaKhoa
WHERE DATEDIFF(YEAR, NgaySinh, GETDATE()) BETWEEN 20 AND 25;





/*
8.	Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên, Phái, Mã khoa, Mức học bổng. 
Trong đó, mức học bổng sẽ hiển thị là “Học bổng cao” nếu giá trị của field học bổng lớn hơn 500,000 và ngược 
lại hiển thị là “Mức trung bình”
*/
	SELECT MaSV, Phai, DSSinhVien.MaKhoa, 
		CASE WHEN HocBong >= 500000 THEN N'Học bổng cao' ELSE N'Mức trung bình' END AS MucHocBong
	FROM DSSinhVien
	WHERE HocBong IS NOT NULL;



/*
9.	Cho biết tổng số sinh viên của toàn trường
*/
	SELECT COUNT(*) AS TongSoSV
	FROM DSSinhVien;



/*
10.	Cho biết tổng sinh viên và tổng sinh viên nữ.
*/
	-- Tổng sinh viên:
	SELECT COUNT(*) AS TongSinhVien
	FROM DSSinhVien;

	-- Tống sinh viên nữa:
	SELECT COUNT(*) AS TongNuSinhVien
	FROM DSSinhVien
	WHERE Phai = N'Nữ';




/*
11.	Cho biết tổng số sinh viên của từng khoa.
*/
	SELECT MaKhoa, COUNT(*) AS TongSV
	FROM DSSinhVien
	GROUP BY MaKhoa



/*
12.	Cho biết số lượng sinh viên học từng môn.
*/
	SELECT MaMH, COUNT(*) AS 'SoLuongSV'
	FROM KetQua
	GROUP BY MaMH;




/*
13.	Cho biết số lượng môn học mà sinh viên đã học(tức tổng số môn học có trong bảng kq)
*/
	SELECT COUNT(DISTINCT MaMH) AS TongSoMonHoc
	FROM KetQua
	WHERE MaSV = 'MSSV';


/*
14.	Cho biết tổng số học bổng của mỗi khoa.
*/
	SELECT DMKhoa.MaKhoa, SUM(DSSinhVien.HocBong) AS TongHocBong
	FROM DSSinhVien
	JOIN DMKhoa ON DSSinhVien.MaKhoa = DMKhoa.MaKhoa
	GROUP BY DMKhoa.MaKhoa



/*
15.	Cho biết học bổng cao nhất của mỗi khoa.
*/
	SELECT DMKhoa.MaKhoa, MAX(DSSinhVien.HocBong) AS HocBongCaoNhat
	FROM DSSinhVien
	JOIN DMKhoa ON DSSinhVien.MaKhoa = DMKhoa.MaKhoa
	GROUP BY DMKhoa.MaKhoa



/*
16.	Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa.
*/
	SELECT 
		MaKhoa, 
		SUM(CASE WHEN Phai = N'Nam' THEN 1 ELSE 0 END) AS TongNam,
		SUM(CASE WHEN Phai = N'Nữ' THEN 1 ELSE 0 END) AS TongNu
	FROM 
		DSSinhVien
	GROUP BY 
		MaKhoa


/*
17.	Cho biết những năm sinh nào có 2 sinh viên đang theo học tại trường.
*/
	SELECT YEAR(ds1.NgaySinh) AS NamSinh, COUNT(*) AS SoSinhVien
	FROM DSSinhVien ds1
	INNER JOIN DSSinhVien ds2 ON ds1.NgaySinh = ds2.NgaySinh AND ds1.MaSV <> ds2.MaSV
	GROUP BY YEAR(ds1.NgaySinh)
	HAVING COUNT(*) >= 2;



/*
18.	Cho biết những sinh viên thi lại trên 2 lần.
*/
	SELECT DSSinhVien.MaSV, DSSinhVien.HoSV, DSSinhVien.TenSV, COUNT(*) AS SoLanThiLai
	FROM DSSinhVien
	INNER JOIN KetQua ON DSSinhVien.MaSV = KetQua.MaSV
	GROUP BY DSSinhVien.MaSV, DSSinhVien.HoSV, DSSinhVien.TenSV
	HAVING COUNT(*) > 2;



/*
19.	Đưa ra điểm trung bình của sinh viên có mã ‘A06’
*/
	SELECT AVG(Diem) AS DiemTrungBinh
	FROM KetQua
	WHERE MaSV = 'A06'




/*
20.	Thống kê số học sinh học cho mỗi môn học
*/
	SELECT DMMonHoc.MaMH, DMMonHoc.TenMH, COUNT(DSSinhVien.MaSV) AS SoLuongHocSinh
	FROM DMMonHoc
	LEFT JOIN KetQua ON DMMonHoc.MaMH = KetQua.MaMH
	LEFT JOIN DSSinhVien ON KetQua.MaSV = DSSinhVien.MaSV
	GROUP BY DMMonHoc.MaMH, DMMonHoc.TenMH;



/*
21.	Đưa ra danh sách sinh viên gồm mã sinh viên, họ và tên, ngày sinh, tên khoa học, điểm trung bình
*/
	SELECT DSSinhVien.MaSV, DSSinhVien.HoSV, DSSinhVien.TenSV, DSSinhVien.NgaySinh, DMKhoa.TenKhoa,
		AVG(KetQua.Diem) AS DiemTrungBinh
	FROM DSSinhVien
	JOIN DMKhoa ON DSSinhVien.MaKhoa = DMKhoa.MaKhoa
	JOIN KetQua ON DSSinhVien.MaSV = KetQua.MaSV
	GROUP BY DSSinhVien.MaSV, DSSinhVien.HoSV, DSSinhVien.TenSV, DSSinhVien.NgaySinh, DMKhoa.TenKhoa;




/*
22.	Đưa ra danh sách sinh viên xuất sắc gồm mã sinh viên, họ và tên, ngày sinh, tên khoa học, 
điểm trung bình với điểm trunh bình >=9.0
*/
	SELECT DSSinhVien.MaSV, DSSinhVien.HoSV, DSSinhVien.TenSV, DSSinhVien.NgaySinh, DMKhoa.TenKhoa, 
		   AVG(KetQua.Diem) AS DiemTrungBinh
	FROM DSSinhVien
	INNER JOIN DMKhoa ON DSSinhVien.MaKhoa = DMKhoa.MaKhoa
	INNER JOIN KetQua ON DSSinhVien.MaSV = KetQua.MaSV
	GROUP BY DSSinhVien.MaSV, DSSinhVien.HoSV, DSSinhVien.TenSV, DSSinhVien.NgaySinh, DMKhoa.TenKhoa
	HAVING AVG(KetQua.Diem) >= 9.0;




/*
23.	Cho biết thông tin của các sinh viên, gồm: Mã sinh viên,tên sinh viên, Phái, Mã khoa, Điểm lần 1 môn có mã 01 (nếu có).
*/
	SELECT 
		DSSinhVien.MaSV,
		DSSinhVien.HoSV + ' ' + DSSinhVien.TenSV AS [TenSV],
		DSSinhVien.Phai,
		DSSinhVien.MaKhoa,
		KetQua.Diem AS [Diem01]
	FROM 
		DSSinhVien
		LEFT JOIN KetQua ON DSSinhVien.MaSV = KetQua.MaSV AND KetQua.MaMH = '01' AND KetQua.LanThi = 1;




/*
24.	Thêm trường TinhTrang (tình trạng) vào bảng kết quả. Cập nhật dữ liệu cho trường này biết rằng nếu điểm trung bình 
(điểm trung bình được tính như câu 2.3) <4 ghi 0, từ 4 đến dưới
*/
	ALTER TABLE KetQua
	ADD TinhTrang NVARCHAR(10) NULL;

	UPDATE KetQua
	SET TinhTrang = CASE 
						WHEN Diem IS NULL THEN NULL
						WHEN Diem < 4 THEN '0'
						WHEN Diem >= 4 AND Diem < 5 THEN 'D'
						WHEN Diem >= 5 AND Diem < 6.5 THEN 'C'
						WHEN Diem >= 6.5 AND Diem < 8 THEN 'B'
						ELSE 'A'
					END;



/*
25.	Xoá tất cả những sinh viên chưa dự thi môn nào.	
*/
	DELETE FROM DSSinhVien
	WHERE NOT EXISTS (
		SELECT 1
		FROM KetQua
		WHERE KetQua.MaSV = DSSinhVien.MaSV
	);




/*
26.	Xóa những môn mà không có sinh viên học.
*/
	DELETE FROM DMMonHoc
	WHERE MaMH NOT IN (SELECT DISTINCT MaMH FROM KetQua)




/*
27.	Thêm vào bảng khoa cột Siso, cập nhật sỉ số vào khoa từ dữ liệu sinh viên.
*/
	-- Thêm cột Siso vào bảng khoa
	ALTER TABLE DMKhoa ADD Siso INT NULL;

	-- Cập nhật sỉ số của các khoa
	UPDATE DMKhoa
	SET Siso = DSSinhVienCount.Count
	FROM DMKhoa
	INNER JOIN
	  (SELECT MaKhoa, COUNT(*) AS Count
	   FROM DSSinhVien
	   GROUP BY MaKhoa) AS DSSinhVienCount
	ON DMKhoa.MaKhoa = DSSinhVienCount.MaKhoa;





/*
28.	Tăng thêm 1 điểm cho các sinh viên vớt lần 2. Nhưng chỉ tăng tối đa là 5 điểm
*/
	UPDATE KetQua
	SET Diem = CASE
		WHEN LanThi = 2 AND Diem < 9.0 THEN Diem + 1.0
		WHEN LanThi = 2 AND Diem >= 9.0 THEN Diem + 0.5
		ELSE Diem
	END
	WHERE LanThi = 2;




/*
29.	Tăng học bổng lên 100000 cho những sinh viên có điểm trung bình là 6.5 trở lên
*/
	UPDATE DSSinhVien
	SET HocBong = 100000
	WHERE MaSV IN (
	  SELECT MaSV
	  FROM KetQua
	  GROUP BY MaSV
	  HAVING AVG(Diem) >= 6.5
	);



/*
30.	Thiết lập học bổng bằng 0 cho những sinh viên thi hai môn rớt ở lần 1
*/
	UPDATE DSSinhVien
	SET HocBong = 0
	WHERE MaSV IN (
		SELECT KQ.MaSV
		FROM KetQua KQ
		INNER JOIN DMMonHoc MH ON KQ.MaMH = MH.MaMH
		WHERE KQ.LanThi = 1 AND KQ.Diem < 5.0 AND MH.MaMH IN ('M1', 'M2')
	);

