-- JITEN.POMAL VERSION 001

USE TEMPDB

GO

-- CREATE TABLE InspectionDefect(
-- 	InspectionDefectKey 				IINT NOT NULL IDENTITY(1,1),
-- 	CertificationKey 					INT NOT NULL,
-- 	DefectKey 							INT NOT NULL,
-- 	PRIMARY KEY(InspectionDefectKey),
-- 	FOREIGN KEY FK_InspectionDefectKey(DefectKey) REFERENCES Defect(DefectKey),
-- 	FOREIGN KEY FK_DefectCertificationKey(CertificationKey) REFERENCES CertificationKey(CertificationKey)
-- );

-- ALTER TABLE InspectionDefect
-- ADD CONSTRAINT FK_InspectionDefectKey
-- FOREIGN KEY (CertificationKey) REFERENCES  Defect(DefectKey);

-- ALTER TABLE InspectionDefect
-- ADD CONSTRAINT FK_DefectCertificationKey
-- FOREIGN KEY (CertificationKey) REFERENCES CertificationKey(CertificationKey)




CREATE PROCEDURE SP_InspectionDefect

	
	@CertificationKey 	INT 		,
	@DefectKey 			INT 		


	AS
BEGIN
	
	SET NOCOUNT ON


SET IDENTITY_INSERT InspectionDefect ON;

INSERT INTO InspectionDefect

	(
		
		CertificationKey 			,
		DefectKey

	)

VALUES

	(
		
		@CertificationKey 			,
		@DefectKey

	)

	EXEC PROCEDURE SP_InspectionDefect

		
		@CertificationKey 	=		,
		@DefectKey =

