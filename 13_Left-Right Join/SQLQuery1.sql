
USE HoangTien2k3
Go


Select * From dbo.GIAOVIEN JOIN dbo.BOMON
ON BOMON.MABM = GIAOVIEN.MABM


Select * From dbo.GIAOVIEN, dbo.BOMON
Where BOMON.MABM = GIAOVIEN.MABM


-- Left Join: bảng bên phải nhập vào bảng bên trái
-- record nào không phải thì để null
-- record nào bảng bên trái không có thì không điền vào.
Select * From dbo.GIAOVIEN LEFT JOIN dbo.BOMON
ON BOMON.MABM = GIAOVIEN.MABM



-- Right Join
Select * From dbo.GIAOVIEN RIGHT JOIN dbo.BOMON
ON BOMON.MABM = GIAOVIEN.MABM

