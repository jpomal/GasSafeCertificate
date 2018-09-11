-- JITEN.POMAL VERSION 001

USE TEMPDB 

GO

--  CREATE TABLE FactInspectionAppliance(
-- 	FactInspectionApplianceKey 					INT NOT NULL IDENTITY(1,1,
-- 	FactInspectionKey 							INT NOT NULL,
-- 	ApplianceKey 								INT NOT NULL,
-- 	LandlordAppliance 							BIT NOT NULL,
-- 	PRIMARY KEY (FactInspectionApplianceKey)
-- );

-- ALTER TABLE FactInspection
-- ADD CONSTRAINT FK_FactInspectionKey
-- FOREIGN KEY (CertificationKey) REFERENCES DimCertification(CertificationKey),

-- ALTER TABLE FactInspection
-- ADD CONSTRAINT FK_FactApplianceKey
-- FOREIGN KEY (ApplianceKey) REFERENCES DimCertification(CertificationKey);



CREATE PROCEDURE SP_FactInspectionAppliance

	@FactInspectionKey 							INT ,
	@ApplianceKey 								INT ,
	@LandlordAppliance 							BIT 


AS
BEGIN
	
	SET NOCOUNT ON


SET IDENTITY_INSERT FactInspectionAppliance ON;

INSERT INTO FactInspectionAppliance

	(

	FactInspectionKey 							,
	ApplianceKey 								,
	LandlordAppliance 	

	)

VALUES
	(

	@FactInspectionKey 							,
	@ApplianceKey 								,
	@LandlordAppliance 		

	)
END
GO

EXEC SP_FactInspectionAppliance

	@FactInspectionKey =						,
	@ApplianceKey 	=							,
	@LandlordAppliance = 		
 