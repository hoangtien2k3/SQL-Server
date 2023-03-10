
Use HoangTien2k3
go


-- sự khác nhau giữa Insert Into và Select Into trong Sql Server là:
-- Insert Into thì copy dữ liệu vào bảng đã tồn tại.
-- Select Into là tạo ra và bảng và Copy dữ liệu đẩy vào bảng đó.


-- Tạo ra một bảng giống y chang bảng GIAOVIEN mà không có dữ liệu trong đó.
Select * Into CloneGIAOVIEN
From GIAOVIEN
WHERE 1=0 -- điều kiện này sẽ, thì nó sẽ không insert dữ liệu từ bảng giáo viên vào .


-- Insert Into , để copy dữ liệu từ một bảng, vào một bảng đã tồn tại.
Insert Into CloneGIAOVIEN
Select * From GIAOVIEN



Select * From CloneGIAOVIEN


