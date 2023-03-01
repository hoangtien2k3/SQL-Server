-- cấu trúc truy vấn trong SQL Server
-- trong SQL Server thì viết hoa hay viết thường đều được.

-- để đảm bảo việc lấy ra đúng bảng mong muốn.
Use HoangTien2k3
Go

-- lấy hết toàn bộ dữ liệu cảu bảng bộ môn
SELECT * FROM dbo.BOMON


-- lấy Mã đề tài + tên đề tài trong bảng bộ môn.
Select MABM, TENBM From dbo.BOMON


-- Đổi tên cột hiển thị
-- đổi tên hiển bị bằng AS ( AS 'Tên cần đổi' )
Select MABM AS 'HOANGTIEN', TENBM AS N'GIÁO DỤC' From dbo.BOMON



-- XUẤT ra mã giáo viên + tên + tên bộ môn giáo viên đó dạy
-- dùng AS để tạo bí dánh (VD: dbo.GIAOVIEN AS GV )
Select GV.MAGV, GV.HOTEN, BM.TENBM From dbo.GIAOVIEN AS GV, dbo.BOMON AS BM





