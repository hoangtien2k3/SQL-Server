
Use HospitalManagementSysteam
go

Create table DoctorTbl
(
	DoctorId int not null primary key,
	DoctorName nvarchar(50) not null,
	DoctorExperience int not null,
	DoctorPassword nvarchar(50) not null
)
go


Create table PatientTbl
(
	PatId int not null primary key,
	PatName nvarchar(50) not null,
	PatAddress varchar(50) not null,
	PatPhone varchar(50) not null,
	PatAge int not null,
	PatGender varchar(50) not null,
	PatBlood varchar(10) not null,
	PatDisease varchar(80) not null,

)
go


Create table DiagnosisTbl
(
	DiagId int not null primary key,
	PatId int not null,
	PatName nvarchar(50) not null,
	Symptoms varchar(80) not null,
	Diagnosis varchar(50) not null,
	Medicines varchar(50) not null,

)
go











