--VERSION 1
--COMMENTS : NEED TO ALTER TABLES TO ADD THE FOREIGN KEY CONTSTAINTS
--			 NEED TO CREATE FACT TABLE/TRANSACTION TABEL
--			 NEED TO ALSO INSERT DATA ON REMAINING TABLES
CREATE DATABASE IF NOT EXISTS dbo.GasCert_DW
GO

USE GasCert_DW

CREATE TABLE IF NOT EXISTS dbo.DimCustomer
(
CustomerKey INT NOT NULL,
FirstName VARCHAR(100),
Surname VARCHAR(100),
FirstLinAddress VARCHAR(100),
SecondLineAddress VARCHAR(100),
Postcode VARCHAR(10),
CompanyName VARCHAR(100),
Phone VARCHAR(16),
Email VARCHAR(300),
PRIMARY KEY (CustomerKey),
FOREIGN KEY FK_CustomerKey(CustomerKey) REFERENCES FactCertificate(CustomerKey)
)

CREATE TABLE IF NOT EXISTS dbo.DimUser
(
UserKey INT NOT NULL,
FirstName VARCHAR(100) NOT NULL,
LastName VARCHAR(100) NOT NULL,
GasID INT NOT NULL,
CompanyAddress VARCHAR(100) NOT NULL,
CompanyPostcode VARCHAR(10)NOT NULL,
CompanyGasID INT NOT NULL,
GasEngineerSigniture NVARCHAR(100)NOT NULL,
PRIMARY KEY (UserKey),
FOREIGN KEY FK_UserKey(UserKey) REFERENCES FactCertificate(UserKey)
)
GO

CREATE TABLE IF NOT EXISTS dbo.DimAppliance (
ApplianceKey INT NOT NULL,
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
PRIMARY KEY (ApplianceKey),
FOREIGN KEY FK_ApplianceKey(ApplianceKey) REFERENCES FactCertificate(ApplianceKey)
)
GO
 
CREATE TABLE IF NOT EXISTS dbo.DimApplianceType (
 ApplianceTypeKey INT NOT NULL,
 App_Type VARCHAR(200) NOT NULL,
 Make VARCHAR(200) NOT NULL,
 Model VARCHAR(200) NOT NULL,
 GCNumber VARCHAR(20),
 PRIMARY KEY (ApplianceTypeKey),
 FOREIGN KEY FK_ApplianceTypeKey(ApplianceTypeKey) REFERENCES DimAppliance(ApplianceTypeKey)   
)

 
CREATE TABLE IF NOT EXISTS dbo.DimFlueType(
 FlueTypeKey  INT NOT NULL,
 FlueType VARCHAR(200) NOT NULL,
 PRIMARY KEY (FlueTypeKey),
 FOREIGN KEY FK_FlueTypeKey(FlueTypeKey) REFERENCES DimAppliance(FlueTypeKey)  
)
GO


CREATE TABLE IF NOT EXISTS dbo.DimCertification (
 CertificationKey INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
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
 PRIMARY KEY (CertificationKey),
 FOREIGN KEY FK_CertificationKey(CertificationKey) REFERENCES FactCertificate(CertificationKey) 
)
GO

CREATE TABLE IF NOT EXISTS dbo.DimJob (
JobKey INT NOT NULL,
FirstName VARCHAR(128),
Surname VARCHAR(128),
FirstLineAddress VARCHAR(128),
SecondLineAddress VARCHAR(128),
PostCode VARCHAR(10),
Phone VARCHAR(16)
PRIMARY KEY (JobKey),
FOREIGN KEY FK_JobKey(JobKey) REFERENCES FactCertificate(JobKey) 
)
GO

CREATE TABLE IF NOT EXISTS dbo.DimDate
	(	[DateKey] INT PRIMARY KEY, 
		[Date] DATETIME,
		[FullDateUK] CHAR(10), -- Date in dd-MM-yyyy format
		[DayOfMonth] VARCHAR(2), -- Field will hold day number of Month
		[DaySuffix] VARCHAR(4), -- Apply suffix as 1st, 2nd ,3rd etc
		[DayName] VARCHAR(9), -- Contains name of the day, Sunday, Monday 
		[DayOfWeekUK] CHAR(1),-- First Day Monday=1 and Sunday=7
		[DayOfWeekInMonth] VARCHAR(2), --1st Monday or 2nd Monday in Month
		[DayOfWeekInYear] VARCHAR(2),
		[DayOfQuarter] VARCHAR(3),
		[DayOfYear] VARCHAR(3),
		[WeekOfMonth] VARCHAR(1),-- Week Number of Month 
		[WeekOfQuarter] VARCHAR(2), --Week Number of the Quarter
		[WeekOfYear] VARCHAR(2),--Week Number of the Year
		[Month] VARCHAR(2), --Number of the Month 1 to 12
		[MonthName] VARCHAR(9),--January, February etc
		[MonthOfQuarter] VARCHAR(2),-- Month Number belongs to Quarter
		[Quarter] CHAR(1),
		[QuarterName] VARCHAR(9),--First,Second..
		[Year] CHAR(4),-- Year value of Date stored in Row
		[YearName] CHAR(7), --CY 2012,CY 2013
		[MonthYear] CHAR(10), --Jan-2013,Feb-2013
		[MMYYYY] CHAR(6),
		[FirstDayOfMonth] DATE,
		[LastDayOfMonth] DATE,
		[FirstDayOfQuarter] DATE,
		[LastDayOfQuarter] DATE,
		[FirstDayOfYear] DATE,
		[LastDayOfYear] DATE,
		[IsWeekday] BIT,-- 0=Week End ,1=Week Day
		[IsHolidayUK] BIT Null,-- Flag 1=National Holiday, 0-No National Holiday
		[HolidayUK] VARCHAR(50) Null --Name of Holiday in UK
		PRIMARY KEY (DateKey),
		FOREIGN KEY FK_DateKey(DateKey) REFERENCES FactCertificate(DateKey) 
	)
GO
 
CREATE TABLE IF NOT EXISTS dbo.DimTime( 
[TimeKey] [int] NOT NULL, 
[TimeAltKey] [int] NOT NULL, 
[Time30] [varchar](8) NOT NULL, 
[Hour30] [tinyint] NOT NULL, 
[MinuteNumber] [tinyint] NOT NULL, 
[SecondNumber] [tinyint] NOT NULL, 
[TimeInSecond] [int] NOT NULL, 
[HourlyBucket] varchar(15)not null, 
[DayTimeBucketGroupKey] int not null, 
[DayTimeBucket] varchar(100) not null 
PRIMARY KEY (TimeKey),
FOREIGN KEY FK_TimeKey(TimeKey) REFERENCES FactCertificate(TimeKey)
)
GO 


CREATE TABLE IF NOT EXISTS dbo.FactCertificate(
	FactCertificateKey INT NOT NULL,
	UserKey INT NOT NULL,
	CustomerKey INT NOT NULL,
	ApplianceKey INT NOT NULL,
	CertificationKey INT NOT NULL,
	DimJob INT NOT NULL,
	DateKey INT NOT NULL,
	TimeKey INT NOT NULL,
	PRIMARY KEY (FactCertificateKey)
)
GO


/*-------------------------------------
TEST DATA
*/-------------------------------------


Insert into DimApplianceType(ApplianceTypeId,App_Type,Make,Model,GCNumber) values
('001','Fast','British Gas','G21002','GV12');
 Go

Insert into DimFlueType(FlueTypeId,F_Type)values
('121','QuickFlue');
GO

 SET IDENTITY_INSERT DimUser ON
Insert into DimUser(UserID,FirstName,LastName,GasID,CompanyAddress,CompanyPostcode,CompanyGasID,GasEngineerSigniture)values
('001','Ben','Davis',101,'123 London Road','UB2 2DU','0071','BD_APPROVED');
 GO


Insert into DimCustomer(CustomerID,FirstName,Surname,FirstLinAddress,SecondLineAddress,Postcode,CompanyName,
Phone,Email)values
('001','Jiten','Pomal','25 Fake Street','Hayes Middx','UB2 2DU','GasComp01','02085651234','Jiten@gmail.com'),
('002','Julian','Dragoi','2 James St','Neasden London','NW2 1AB','GasComp0','02082222234','julian@gmail.com'),
('003','Jade','Smith','113 Bishops Street','Hatfield Herts','AL10 9AB','GasComp03','07711112345','Jade@gmail.com');
 Go


