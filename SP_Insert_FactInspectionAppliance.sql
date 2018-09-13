-- JITEN.POMAL VERSION 001

USE TEMPDB 

GO

 	CREATE TABLE FactInspectionAppliance(
	FactInspectionApplianceKey 					INT NOT NULL IDENTITY(1,1,
	FactInspectionKey 							INT NOT NULL,
	ApplianceKey 								INT NOT NULL,
	LandlordAppliance 							BIT NOT NULL,
	PRIMARY KEY(FactInspectionApplianceKey),
	FOREIGN KEY FK_FactInspectionKey(FactInspectionKey) REFERENCES FactInspection(FactInspectionKey),
	FOREIGN KEY FK_FactApplianceKey(ApplianceKey) REFERENCES DimAppliance(ApplianceKey)

);

ALTER TABLE FactInspection
ADD CONSTRAINT FK_FactInspectionKey
FOREIGN KEY (CertificationKey) REFERENCES DimCertification(CertificationKey),



