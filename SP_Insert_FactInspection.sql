-- JITEN.POMAL VERSION 001

USE TESTDB 
GO 

-- 	CREATE TABLE FactInspection(
-- 	FactInspectionKey 					INT NOT NULL IDENTITY(1,1)				,
-- 	PersonKey 							INT NOT NULL							,
-- 	AddressKey 							INT NOT NULL							,
-- 	NextInspectionDateTime 				DATETIME NOT NULL						,
-- 	CertificationIssued 				BIT NOT NULL							,
-- 	CertificationKey 					INT  									,	
-- 	PRIMARY KEY (FactInspectionKey),

-- );

-- ALTER TABLE FactInspection
-- ADD CONSTRAINT FK_FactPersonKey
-- FOREIGN KEY (PersonKey) REFERENCES DimPerson(PersonKey);

-- ALTER TABLE FactInspection
-- ADD CONSTRAINT FK_FactAddressKey
-- FOREIGN KEY (AddressKey) REFERENCES Address(AddressKey),

-- ALTER TABLE FactInspection
-- ADD CONSTRAINT FK_InspectionCertificationKey
-- FOREIGN KEY (CertificationKey) REFERENCES DimCertification(CertificationKey),



CREATE PROCEDURE SP_FactInspection

	@FactInspectionKey 					INT 		,	
	@PersonKey 							INT 	    , 
	@AddressKey 						INT 		,
	@NextInspectionDateTime			    DATETIME    ,
	@CertificationIssued				BIT			,
	@CertificationKey 					INT

AS
BEGIN
	
	SET NOCOUNT ON


SET IDENTITY_INSERT FactInspection ON;


 INSERT INTO FactInspection

 
	 (
		FactInspectionKey ,
		PersonKey,
		AddressKey,
		NextInspectionDateTime,
		CertificationIssued,
		CertificationKey

	 )

VALUES 

(
		@FactInspectionKey ,
		@PersonKey,
		@AddressKey,
		@NextInspectionDateTime,
		@CertificationIssued,
		@CertificationKey
)

END
GO

EXEC SP_FactInspection

		@FactInspectionKey = ,
		@PersonKey = ,
		@AddressKey = ,
		@NextInspectionDateTime = ,
		@CertificationIssued = ,
		@CertificationKey =




