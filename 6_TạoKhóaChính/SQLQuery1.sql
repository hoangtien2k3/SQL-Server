
-- unique : một ràng buộc (constraint) trên cột. Trường nào có từ khóa UNIQUE thì không	 thể có 2 giá trị trùng nhau.
-- "NOT NULL": yêu cầu cột không được phép có giá trị null (rỗng).
-- default: giá trị mặc định của trường đó nếu không gán giá trị insert

CREATE TABLE TestPrimaryKey1
(
	ID int UNIQUE NOT NULL default 1,
	Name nvarchar(100) default N'HOANGTIEN2K3'

)
GO

insert dbo.TestPrimaryKey1
	(
		ID
		--Name
	)
values
	(
		1234
	)
GO

insert dbo.TestPrimaryKey1
	(
		ID
		--Name
	)
values
	(
		456
	)
GO
insert dbo.TestPrimaryKey1
	(
		ID
		--Name
	)
values
	(
		3123
	)
GO
insert dbo.TestPrimaryKey1
	(
		ID
		--Name
	)
values
	(
		5235123
	)
GO


-- tạo 2 khóa chính.
CREATE TABLE TestPrimaryKey3
(
	ID1 int not null,
	ID2 int not null,
	Name nvarchar(100) default N'hoangtien2k3'

	primary key (ID1, ID2)
)
GO