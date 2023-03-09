
USE HoangTien2k3
Go


-- INTO nó sẽ tạo ra một bảng mới và Insert tất cả dữ liệu vả bảng cần insert và bảng mới đó.
-- lấy hết dữ liệu của bảng GV và đưa vào bảng TableA
Select * INTO TableA
From dbo.GIAOVIEN




-- tạo ra một bảng TableB mới. có một cột dữ liệu là HoTen tương ứng với bảng GV
-- và nó lấy tất cả dữ liệu của bảng GV.
Select HoTen INTO TableB
From dbo.GIAOVIEN




-- tạo ra một bảng TableB mới. có một cột dữ liệu là HoTen tương ứng với bảng GV
-- với điều kiện lương > 2000
-- và nó lấy tất cả dữ liệu của bảng GV.
Select HoTen INTO TableB
From dbo.GIAOVIEN
Where LUONG > 2000


-- Tạo ra một bảng backup bảng GV đưa ra 