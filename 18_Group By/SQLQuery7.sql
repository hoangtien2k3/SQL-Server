
Use HoangTien2k3
Go

/* (aggregate function) như SUM, AVG, COUNT, MAX, MIN trong câu lệnh SELECT, 
	thường kèm theo câu lệnh GROUP BY để nhóm các bản ghi dựa trên các giá trị trong một hoặc nhiều cột.

	aggregate function:
		SUM: Tính tổng các giá trị trong một cột.
		AVG: Tính giá trị trung bình của các giá trị trong một cột.
		COUNT: Đếm số lượng bản ghi trong một cột hoặc trong một nhóm bản ghi.
		MAX: Tìm giá trị lớn nhất trong một cột hoặc trong một nhóm bản ghi.
		MIN: Tìm giá trị nhỏ nhất trong một cột hoặc trong một nhóm bản ghi.
*/


-- Đề bài: xuất ra Danh sách tên bộ môn và số lượng giáo viên của bộ môn đó.
Select BM.TENBM, COUNT(*) From BOMON AS BM, GIAOVIEN AS GV
Where BM.MABM = GV.MABM
Group By BM.TENBM

-- LƯU Ý: cột hiển thị phải là thuộc tính nằm trong khối group by hoặc aggregate function(hàm tổng hợp)



-- Đề bài: lấy ra danh sách giáo viên có lương > lương trung bình của giáo viên.
Select * From GIAOVIEN AS GV
Where GV.LUONG > (Select SUM(LUONG) From GIAOVIEN) / (Select Count(*) From GIAOVIEN)



-- Đề bài: xuất ra tên giáo viên và số lượng công việc giáo viên đó đã làm.
Select GV.HOTEN, COUNT(*) From GIAOVIEN AS GV, THAMGIADT AS TGDT
Where GV.MAGV = TGDT.MAGV 
Group By GV.MAGV, GV.HOTEN 
/*
	Tại sao đây là Group By cả MAGV và HOTEN thay vì chỉ HOTEN, vì nếu nhỡ may trùng tên thì sao, vì thế nên thêm MAGV 
	vào để tránh tình trạng trùng tên giáo viên xảy ra.
*/






/*
Bài Tập:
	1. xuất ra tên giáo viên và số lượng người thân của giáo viên đó.
	2. xuất ra tên giáo viên và số lượng để tài đã hoàn thành mà giáo viến đó tham gia.


*/








-- Example
Select BM.TENBM, PHONG, COUNT(*) From BOMON AS BM, GIAOVIEN AS GV
Where BM.MABM = GV.MABM
Group By BM.TENBM, PHONG
































