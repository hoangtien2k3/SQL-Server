

-- xuất ra thông tin giáo viên và giáo viên quản lý chủ nhiệm của người đó.
-- tự tra lại bảng GIAO VIEN để hiểu vì sao lại làm thế này oke.
Select gv1.HOTEN, gv2.HOTEN 
From dbo.GIAOVIEN as gv1, dbo.GIAOVIEN as gv2
Where gv1.GVQLCM = gv2.MAGV



-- xuất ra số lượng giáo viên của khoa CNTT.
Select COUNT(*) From dbo.GIAOVIEN as gv, dbo.KHOA as k, dbo.BOMON as bm
where gv.MABM = bm.MABM AND bm.MAKHOA = k.MAKHOA AND k.MAKHOA = 'CNTT'



-- xuất ra thông tin giáo viên và đề tài người đó tham gia khi mà kết quả là đạt.
Select gv.* From dbo.GIAOVIEN as gv , dbo.THAMGIADT as tg
Where gv.MAGV = tg.MAGV AND TG.KETQUA = N'Đạt'
