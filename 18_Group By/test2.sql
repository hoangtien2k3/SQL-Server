

Use HoangTien2k3
Go


/*
	tại sao lại sinh ra Having, tại vì cái lỗi aggregate function không có trong điều kiện của Where nền
	dùng Having để thay thế
*/
-- Xuất ra số lượng giáo viên trong từng bộ môn
-- Having như Where của Select nhưng dành cho Group by.
-- hay Having như Where của Group by
Select BOMON.MABM, Count(*) From GIAOVIEN, BOMON
Where BOMON.MABM = GIAOVIEN.MABM 
GROUP BY BOMON.MABM 
Having COUNT(*) > 1



-- xuất ra mức lương và tổng tuổi của giáo viên nhận mức lương đó và có người thân, VÀ tuổi phải lớn hơn tuổi trung bình.
Select LUONG, SUM(YEAR(GETDATE()) - YEAR(GIAOVIEN.NGSINH)) From GIAOVIEN, NGUOITHAN
Where GIAOVIEN.MAGV = NGUOITHAN.MAGV AND GIAOVIEN.MAGV 
IN 
(
	SELECT * FROM NGUOITHAN
)
Group By LUONG, GIAOVIEN.NGSINH
Having YEAR(GETDATE()) - YEAR(GIAOVIEN.NGSINH) >
(
	(SELECT YEAR(GETDATE()) - YEAR(GIAOVIEN.NGSINH) FROM GIAOVIEN) / (SELECT COUNT(*) FROM GIAOVIEN)
)













