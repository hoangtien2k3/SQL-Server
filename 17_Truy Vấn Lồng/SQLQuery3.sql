
Use HoangTien2k3
go


-- Lý thuyết:
-- Truy vấn lồng (Nested query) là một truy vấn SQL được thực thi trong một truy vấn SQL khác. 
-- Có hai loại truy vấn lồng: truy vấn lồng không đồng bộ (asynchronous nested query) và truy vấn lồng đồng bộ (synchronous nested query).



-- kiểm tra xem giáo viên GV001 có phải là giáo viên chủ nhiệm hay không.
Select * From GIAOVIEN
WHERE MAGV = '001'
And MAGV IN
(
	Select GVQLCM From GIAOVIEN
)




-- Đề bài: lấy ra danh sách giáo viên tham gia nhiều hơn một đề tài.


-- lấy ra tất cả thông tin của giáo viên.
Select * From GIAOVIEN AS GV
Where 1 <	-- điều kiện 1 < có nghĩ là giáo viên tham gia nhiều hơn 1 đề tài nào đó.
(
	-- cái câu truy vẫn lồng sau, kiểm tra xem giáo viên ở THAMGIADETAI với GIAOVIEN có bằng nhau không.
	Select Count(*) From THAMGIADT
	Where MAGV = GV.MAGV
)



-- Đề bài: xuất ra thông tin giáo viên mà có 2 người thân.
Select * From GIAOVIEN AS GV
Where 2 = 
(
	Select Count(*) From NGUOITHAN
	Where MAGV = GV.MAGV -- MAGV của bảng NGUOITHAN phải bằng MAGV của bảng GIAOVIEN.
)


-- Đề bài: xuất ra thông tin của khoa mà có nhiều hơn 2 giáo viên.
Select * From KHOA AS K
Where 2 < 
(
	Select COUNT(*) From GIAOVIEN AS GV, BOMON AS BM
	Where GV.MABM = BM.MABM AND BM.MAKHOA = K.MAKHOA
)

/*
Bài tập:

	
*/































