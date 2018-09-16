-- JITEN.POMAL VERSION 001

USE TEMPDB
GO

-- CREATE TABLE  Defect (
-- 	DefectKey INT NOT NULL IDENTITY(1,1),
-- 	DefectTypeKey INT NOT NULL,
-- 	Severity INT,
-- 	Comment VARCHAR(4000),
-- 	PRIMARY KEY(DefectKey),
	


);

-- ALTER TABLE Defect
-- ADD CONSTRAINT FK_DefectTypeKey
-- FOREIGN KEY (DefectTypeKey) REFERENCES DefectType(DefectTypeKey);




CREATE PROCEDURE SP_Defect

	@DefectTypeKey INT NOT NULL,
	@Severity INT,
	@Comment VARCHAR(4000)


AS
BEGIN
	
	SET NOCOUNT ON


SET IDENTITY_INSERT Defect ON;


INSERT INTO Defect
	(
		
		DefectTypeKey,
		Severity,
		Comment

	)

VALUES


	 (
	 	
	 	@DefectKey ,
	 	@Severity ,
	 	@Comment 

	 )

END

GO

EXEC SP_Defect

		
	 	@DefectKey = ,
	 	@Severity  =,
	 	@Comment =




 