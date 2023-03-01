
Use HoangTien2k3
Go

Select GV.MAGV, GV.HOTEN, NT.TEN from dbo.GIAOVIEN AS GV, dbo.NGUOITHAN AS NT
Where GV.MAGV = NT.MAGV

-- lấy ra lương > 2000
SELECT *FROM dbo.GIAOVIEN
Where LUONG > 2000


-- lấy ra giáo viên là nữ và lương > 2000
Select * from dbo.GIAOVIEN
Where LUONG > 2000 and PHAI = N'Nữ'


-- lấy ra giáo viên nhỏ hơn 30 tuổi.
Select * from dbo.GIAOVIEN
Where YEAR(GETDATE()) - YEAR(NGSINH) > 40 


-- lấy ra giáo viên, năm sinh và tuổi của giáo viên nhỏ hơn 40 tuổi
Select HOTEN, NGSINH, YEAR(GETDATE()) - YEAR(NGSINH) from dbo.GIAOVIEN 
Where YEAR(GETDATE()) - YEAR(NGSINH) >= 40 


-- lấy ra giáo viên là trưởng hộ môn
Select gv. * From dbo.GIAOVIEN as gv, dbo.BOMON as bm
Where gv.MAGV = bm.TRUONGBM 



-- đếm số lượng giáo viên
-- COUNT(*) -> Đếm số lượng của tên trường đó.
-- COUNT(tên trường nào đó) -> đếm số lượng của tên trường đó
Select COUNT(*) AS N'Số lượng giáo viên' from dbo.GIAOVIEN



-- đếm số lượng người thân của giáo viên có mã GV là 007
Select * 
From dbo.GIAOVIEN, dbo.NGUOITHAN
Where GIAOVIEN.MAGV = '007' AND GIAOVIEN.MAGV = NGUOITHAN.MAGV


-- lấy ra tên giáo viên và tên đề tài người đó tham gia
Select HOTEN, TENDT 
From dbo.GIAOVIEN, dbo.THAMGIADT, dbo.DETAI
Where GIAOVIEN.MAGV = THAMGIADT.MAGV AND DETAI.MADT = THAMGIADT.MADT
