
USE HoangTien2k3
Go


-- ĐÂY được gọi là : inner join
-- mọi join đều cần điều kiện
Select * From dbo.GIAOVIEN, dbo.BOMON
Where BOMON.MABM = GIAOVIEN.MABM


-- cái trên và cái dưới giống nhau, Nhưng nên dùng kiểu Inner Join thì hay hơn.
Select * From dbo.GIAOVIEN INNER JOIN dbo.BOMON 
ON BOMON.MABM = GIAOVIEN.MABM


-- có thể viết tắt thành như sau: viết tắt INNER JOIN LÀ JOIN
-- và hiệu xuất nó giống nhau.
-- JOIN thì bắt buộc phải có điều kiện
Select * From dbo.GIAOVIEN JOIN dbo.BOMON 
ON BOMON.MABM = GIAOVIEN.MABM


