-- JITEN.POMAL VERSION 001

USE TEMPDB

CREATE TABLE  Defect (
	DefectKey INT NOT NULL IDENTITY(1,1),
	DefectTypeKey INT NOT NULL,
	Severity INT,
	Comment VARCHAR(4000),
	PRIMARY KEY(DefectKey),
	


);

-- ALTER TABLE Defect
-- ADD CONSTRAINT FK_DefectTypeKey
-- FOREIGN KEY (DefectTypeKey) REFERENCES DefectType(DefectTypeKey);




CREATE PROCEDURE SP_Defect

	@DefectKey INT NOT NULL ,
	@DefectTypeKey INT NOT NULL,
	@Severity INT,
	@Comment VARCHAR(4000)

INSERT INTO Defect
	(
		Defect,
		DefectTypeKey,
		Severity,
		Comment

	)

VALUES
	 (
	 	@Defect ,
	 	@DefectKey ,
	 	@Severity ,
	 	@Comment 

	 )

EXEC SP_Defect

		@Defect = ,
	 	@DefectKey = ,
	 	@Severity  =,
	 	@Comment =




 