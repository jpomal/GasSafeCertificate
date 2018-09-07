-- JITEN.POMAL VERSION 001

USE TEMPDB

GO

-- CREATE TABLE InspectionDefect(
-- 	InspectionDefectKey 				INT NOT NULL AUTO_INCREMENT,
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

	@InspectionDefect 	INT 		,
	@CertificationKey 	INT 		,
	@DefectKey 			INT 		


	AS
BEGIN
	
	SET NOCOUNT ON


SET IDENTITY_INSERT InspectionDefect ON;

INSERT INTO InspectionDefect

	(
		InspectionDefect 			,
		CertificationKey 			,
		DefectKey

	)

VALUES

	(
		@InspectionDefect 			,
		@CertificationKey 			,
		@DefectKey

	)

	EXEC PROCEDURE SP_InspectionDefect

		@InspectionDefect  =			,
		@CertificationKey 	=		,
		@DefectKey =

