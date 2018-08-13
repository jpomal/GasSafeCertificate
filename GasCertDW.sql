
CREATE DATABASE IF NOT EXISTS GasCert_DW;

USE GasCert_DW;

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

CREATE TABLE IF NOT EXISTS DimAppliance (
	ApplianceKey INT NOT NULL AUTO_INCREMENT,
	ApplianceTypeKey INT ,
	FlueTypeKey INT ,
	Location  VARCHAR(200),
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
	FOREIGN KEY FK_FlueTypeKey(FlueTypeKey) REFERENCES DimFlueType(FlueTypeKey),
	FOREIGN KEY FK_ApplianceTypeKey(ApplianceTypeKey) REFERENCES DimApplianceType(ApplianceTypeKey)
);


CREATE TABLE IF NOT EXISTS PersonType(
PersonTypeKey INT NOT NULL AUTO_INCREMENT,
Type VARCHAR(200),
PRIMARY KEY(PersonTypeKey)
);

CREATE TABLE IF NOT EXISTS Address(
	AddressKey INT NOT NULL AUTO_INCREMENT,
	CompanyName VARCHAR(200),
	FirstLineAddress VARCHAR(200),
	SecondLineAddress VARCHAR(500),
	Postcode VARCHAR(8),
	PRIMARY KEY(AddressKey)
);

CREATE TABLE IF NOT EXISTS DimPerson
(
	PersonKey INT NOT NULL AUTO_INCREMENT,
	PersonTypeKey INT NOT NULL,
	AddressKey INT NOT NULL,
	FirstName VARCHAR(100),
	Surname VARCHAR(100),
	CompanyName VARCHAR(100),
	Phone VARCHAR(16),
	Email VARCHAR(300),
	GasID INT NOT NULL,
	GasEngineerSigniture BLOB,
	PRIMARY KEY (PersonKey),
	FOREIGN KEY FK_PersonTypeKey(PersonTypeKey) REFERENCES PersonType(PersonTypeKey),
	FOREIGN KEY FK_AddressKey(AddressKey) REFERENCES Address(AddressKey)  
);

CREATE TABLE IF NOT EXISTS DimCertification (
	CertificationKey INT NOT NULL AUTO_INCREMENT,
	COAlarm  BIT,
	COFitted BIT,
	COTested BIT,
	SmokeAlarm BIT,
	SmokeFitted BIT,
	SmokeTested BIT,
	NumberOfDefects INT,
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


CREATE TABLE IF NOT EXISTS DefectType(
	DefectTypeKey INT NOT NULL AUTO_INCREMENT,
	Type VARCHAR(200),
	PRIMARY KEY(DefectTypeKey)
);


CREATE TABLE IF NOT EXISTS Defect(
	DefectKey INT NOT NULL AUTO_INCREMENT,
	DefectTypeKey INT NOT NULL,
	Severity INT,
	Comment VARCHAR(4000),
	PRIMARY KEY(DefectKey),
	FOREIGN KEY FK_DefectTypeKey(DefectTypeKey) REFERENCES DefectType(DefectTypeKey)
);


CREATE TABLE IF NOT EXISTS InspectionDefect(
	InspectionDefectKey INT NOT NULL AUTO_INCREMENT,
	CertificationKey INT NOT NULL,
	DefectKey INT NOT NULL,
	PRIMARY KEY(InspectionDefectKey),
	FOREIGN KEY FK_InspectionDefectKey(DefectKey) REFERENCES Defect(DefectKey),
	FOREIGN KEY FK_InspectionCertificationKey(CertificationKey) REFERENCES DimCertification(CertificationKey)
);


CREATE TABLE IF NOT EXISTS FactInspection(
	FactInspectionKey INT NOT NULL AUTO_INCREMENT,
	PersonKey INT NOT NULL,
	AddressKey INT NOT NULL,
	NextInspectionDateTime DATETIME NOT NULL,
	CertificationIssued BIT NOT NULL,
	CertificationKey INT,
	PRIMARY KEY (FactInspectionKey),
	FOREIGN KEY FK_FactPersonKey(PersonKey) REFERENCES DimPerson(PersonKey),
	FOREIGN KEY FK_FactAddressKey(AddressKey) REFERENCES Address(AddressKey)
);



CREATE TABLE IF NOT EXISTS FactInspectionAppliance(
	FactInspectionApplianceKey INT NOT NULL AUTO_INCREMENT,
	FactInspectionKey INT NOT NULL,
	ApplianceKey INT NOT NULL,
	LandlordAppliance BIT NOT NULL,
	PRIMARY KEY(FactInspectionApplianceKey),
	FOREIGN KEY FK_FactInspectionKey(FactInspectionKey) REFERENCES FactInspection(FactInspectionKey),
	FOREIGN KEY FK_FactApplianceKey(ApplianceKey) REFERENCES DimAppliance(ApplianceKey)

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
 


