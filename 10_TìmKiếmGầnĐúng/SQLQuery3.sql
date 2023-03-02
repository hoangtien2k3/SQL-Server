
USE HoangTien2k3
Go

-- xuất ra thông tin giáo viên mà tên Bắt đầu bằng chữ l
-- nếu điều kiện so sánh với dấu bằng (=) nghĩa là thông tin phải đúng hoàn toàn.
-- nếu muốn so sánh gần đúng thì dùng like (so sánh gần đúng)
-- % có nghĩa là bất kỳ  cái gì đằng sau cái % nó không quan tâm.
Select * From dbo.GIAOVIEN
Where HOTEN like 'l%'


-- xuất ra thông tin giáo viên kết thúc bằng chữ n
Select * From dbo.GIAOVIEN
Where HOTEN like '%n'



-- xuất ra thông tin giáo viên có tồn tại chữ n
Select * From dbo.GIAOVIEN
Where HOTEN like '%n%'



-- xuất ra thông tin giáo viên có tồn tại chữ ế
Select * From dbo.GIAOVIEN
Where HOTEN like N'%ế%'











