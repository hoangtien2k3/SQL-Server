
Use HoangTien2k3
go


-- LẤY hết dữ liệu của bảng giáo viên đưa và bảng mới tên là TableA.
Select * Into TableA
From GIAOVIEN


-- tạo ra một bảng TableB và insert cột HoTen từ bảng GIAOVIEN sang.
Select HoTen Into TableB
From GIAOVIEN




Select * From TableB
