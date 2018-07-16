
CREATE DATABASE IF NOT EXISTS GasCert_DW


USE GasCert_DW

CREATE TABLE IF NOT EXISTS DimCustomer
(
	CustomerKey INT NOT NULL AUTO_INCREMENT,
	FirstName VARCHAR(100),
	Surname VARCHAR(100),
	FirstLinAddress VARCHAR(100),
	SecondLineAddress VARCHAR(100),
	Postcode VARCHAR(10),
	CompanyName VARCHAR(100),
	Phone VARCHAR(16),
	Email VARCHAR(300),
	PRIMARY KEY (CustomerKey)
);

CREATE TABLE IF NOT EXISTS DimUser
(
	UserKey INT NOT NULL AUTO_INCREMENT,
	FirstName VARCHAR(100) NOT NULL,
	LastName VARCHAR(100) NOT NULL,
	GasID INT NOT NULL,
	CompanyAddress VARCHAR(100) NOT NULL,
	CompanyPostcode VARCHAR(10)NOT NULL,
	CompanyGasID INT NOT NULL,
	GasEngineerSigniture NVARCHAR(100)NOT NULL,
	PRIMARY KEY (UserKey)
);


CREATE TABLE IF NOT EXISTS DimAppliance (
	ApplianceKey INT NOT NULL AUTO_INCREMENT,
	ApplianceTypeKey INT ,
	FlueTypeKey INT ,
	Location  VARCHAR(200),
	LandlordAppliance VARCHAR(100),
	CompanyPostcode BIT,
	ApplianceInspected BIT,
	OperatingPressure   DECIMAL,
	CAPReadingHigh      DECIMAL,
	CAPReadingLow       DECIMAL,
	SafetyDeviceWorking BIT,
	Ventilaton          BIT,
	VisualOfFlue        BIT,
	FlueTermination     BIT,
	ApplianceServiced   BIT,
	ApplianceSafeToUse  BIT,
	SpillageTest        BIT,
	FlueFlowTest        BIT,
	PRIMARY KEY (ApplianceKey)
);

 
CREATE TABLE IF NOT EXISTS DimApplianceType (
 	ApplianceTypeKey INT NOT NULL AUTO_INCREMENT,
 	App_Type VARCHAR(200) NOT NULL,
 	Make VARCHAR(200) NOT NULL,
 	Model VARCHAR(200) NOT NULL,
 	GCNumber VARCHAR(20),
 	PRIMARY KEY (ApplianceTypeKey)
);

 
CREATE TABLE IF NOT EXISTS DimFlueType(
	FlueTypeKey  INT NOT NULL AUTO_INCREMENT,
	FlueType VARCHAR(200) NOT NULL,
	PRIMARY KEY (FlueTypeKey)
);



CREATE TABLE IF NOT EXISTS DimCertification (
	CertificationKey INT NOT NULL AUTO_INCREMENT,
	COAlarm  BIT,
	COFitted BIT,
	COTested BIT,
	SmokeAlarm BIT,
	SmokeFitted BIT,
	SmokeTested BIT,
	Defects VARCHAR(4000),
	ECV BIT,
	TightnessTest BIT,
	PipeVisual BIT,
	Bonding BIT,
	NumberOfAppliances INT,
	NextInspectionDate DATETIME,
	Comments VARCHAR(4000),
	CertificationDate DATETIME,
	PRIMARY KEY (CertificationKey)
);


CREATE TABLE IF NOT EXISTS DimJob (
	JobKey INT NOT NULL AUTO_INCREMENT,
	FirstName VARCHAR(128),
	Surname VARCHAR(128),
	FirstLineAddress VARCHAR(128),
	SecondLineAddress VARCHAR(128),
	PostCode VARCHAR(10),
	Phone VARCHAR(16),
	PRIMARY KEY (JobKey)
);


CREATE TABLE IF NOT EXISTS DimDate(
	DateKey INT AUTO_INCREMENT, 
	Date DATETIME,
	FullDateUK CHAR(10),
	DayOfMonth VARCHAR(2),
	DaySuffix VARCHAR(4),
	DayName VARCHAR(9),
	DayOfWeekUK CHAR(1),
	DayOfWeekInMonth VARCHAR(2),
	DayOfWeekInYear VARCHAR(2),
	DayOfQuarter VARCHAR(3),
	DayOfYear VARCHAR(3),
	WeekOfMonth VARCHAR(1),
	WeekOfQuarter VARCHAR(2),
	WeekOfYear VARCHAR(2),
	Month VARCHAR(2), 
	MonthName VARCHAR(9),
	MonthOfQuarter VARCHAR(2),
	Quarter CHAR(1),
	QuarterName VARCHAR(9),
	Year CHAR(4),
	YearName CHAR(7), 
	MonthYear CHAR(10),
	MMYYYY CHAR(6),
	FirstDayOfMonth DATE,
	LastDayOfMonth DATE,
	FirstDayOfQuarter DATE,
	LastDayOfQuarter DATE,
	FirstDayOfYear DATE,
	LastDayOfYear DATE,
	IsWeekday BIT,
	IsHolidayUK BIT Null,
	HolidayUK VARCHAR(50) Null,
	PRIMARY KEY (DateKey)
);

 
CREATE TABLE IF NOT EXISTS DimTime( 
	TimeKey int NOT NULL AUTO_INCREMENT, 
	TimeAltKey int NOT NULL, 
	Time30 varchar(8) NOT NULL, 
	Hour30 tinyint NOT NULL, 
	MinuteNumber tinyint NOT NULL, 
	SecondNumber tinyint NOT NULL, 
	TimeInSecond int NOT NULL, 
	HourlyBucket varchar(15)not null, 
	DayTimeBucketGroupKey int not null, 
	DayTimeBucket varchar(100) not null,
	PRIMARY KEY (TimeKey)
);
 


CREATE TABLE IF NOT EXISTS FactCertificate(
	FactCertificateKey INT NOT NULL AUTO_INCREMENT,
	UserKey INT NOT NULL,
	CustomerKey INT NOT NULL,
	ApplianceKey INT NOT NULL,
	CertificationKey INT NOT NULL,
	JobKey INT NOT NULL,
	DateKey INT NOT NULL,
	TimeKey INT NOT NULL,
	PRIMARY KEY (FactCertificateKey)
);


/*-------------------------------------
TEST DATA
*/-------------------------------------


Insert into DimApplianceType(ApplianceTypeId,App_Type,Make,Model,GCNumber) values
('001','Fast','British Gas','G21002','GV12');
 

Insert into DimFlueType(FlueTypeId,F_Type)values
('121','QuickFlue');


 SET IDENTITY_INSERT DimUser ON
Insert into DimUser(UserID,FirstName,LastName,GasID,CompanyAddress,CompanyPostcode,CompanyGasID,GasEngineerSigniture)values
('001','Ben','Davis',101,'123 London Road','UB2 2DU','0071','BD_APPROVED');
 


Insert into DimCustomer(CustomerID,FirstName,Surname,FirstLinAddress,SecondLineAddress,Postcode,CompanyName,
Phone,Email)values
('001','Jiten','Pomal','25 Fake Street','Hayes Middx','UB2 2DU','GasComp01','02085651234','Jiten@gmail.com'),
('002','Julian','Drai','2 James St','Neasden London','NW2 1AB','GasComp0','02082222234','julian@gmail.com'),
('003','Jade','Smith','113 Bishops Street','Hatfield Herts','AL10 9AB','GasComp03','07711112345','Jade@gmail.com');
 


