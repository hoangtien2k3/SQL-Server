

USE HoangTien2k3
Go


Select MAGV From dbo.GIAOVIEN
Select MAGV From dbo.NGUOITHAN


-- Trong SQL Server, UNION là một toán tử kết hợp dữ liệu từ các bảng hoặc câu truy vấn khác nhau 
-- để tạo ra một bảng mới chứa tất cả các dòng của các bảng hoặc câu truy vấn đó.
Select MAGV From dbo.GIAOVIEN
Where LUONG < 2000
UNION
Select MAGV From dbo.NGUOITHAN
Where PHAI = N'Nữ'






