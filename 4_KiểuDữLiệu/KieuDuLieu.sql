 -- các kiểu ký tự hay dùng

 -- int : kiểu số nguyên
 -- float : kiểu số thực
 -- char : kiểu ký tưj, bộ nhớ cấp phát cứng
 -- varchar : kiểu ký tự, bộ nhớ cấp phát động
 -- nchar : kiểu  ký tự. có thể lưu tiếng việt
 -- nvarchar: kiểu ký tự cấp phá động có thể lưu tiếng việt.
 -- date : lưu ngày tháng năm ...
 -- time : lưu giờ, phút, giây ...
 -- byte : lưu giá trị 0 - 1
 -- text : lưu văn bản lớn
 -- ntext : lưu văn bản lớn có tiếng việt.


 CREATE TABLE TEST
 (
	VanBan NVARCHAR(50), -- KHAI BAO NVARCHAR CAP PHAT DONG 50 O NHO.
	MaSV CHAR(10), -- KHAO BAO TRUONG MA SV KIEU CHAR CAP PHAT CUNG 10 O NHO.
	Birthday DATE,
	Sex BIT, -- luu gia tri 0 or 1
 )
 GO