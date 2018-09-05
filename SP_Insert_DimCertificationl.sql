-- JITEN.POMAL VERSION 01
--need to format code

USE TEMPDB

GO

CREATE TABLE DimCertification (
	CertificationKey 					INT NOT NULL IDENTITY(1,1),		
	COAlarm  BIT NOT NULL,
	COFitted BIT,NOT NULL
	COTested BITNOT NULL,
	SmokeAlarm BIT NOT NULL,
	SmokeFitted BIT NOT NULL,
	SmokeTested BIT NOT NULL,
	NumberOfDefects INT NOT NULL,
	ECV BIT NOT NULL,
	TightnessTest BIT NOT NULL,
	PipeVisual BIT NOT NULL,
	Bonding BIT NOT NULL,
	NumberOfAppliances INT NOT NULL,
	NextInspectionDate DATETIME NOT NULL,
	Comments VARCHAR(4000)NOT NULL,
	CertificationDate DATETIME NOT NULL,
	PRIMARY KEY (CertificationKey)
);


CREATE PROCEDURE SP_Certification

	@CertificationKey 					INT NOT NULL ,		
	@COAlarm  						BIT NOT NULL,
	@COFitted BIT,NOT NULL
	@COTested BITNOT NULL,
	@SmokeAlarm BIT NOT NULL,
	@SmokeFitted BIT NOT NULL,
	@SmokeTested BIT NOT NULL,
	@NumberOfDefects INT NOT NULL,
	@ECV BIT NOT NULL,
	@TightnessTest BIT NOT NULL,
	@PipeVisual BIT NOT NULL,
	@Bonding BIT NOT NULL,
	@NumberOfAppliances INT NOT NULL,
	@NextInspectionDate DATETIME NOT NULL,
	@Comments VARCHAR(4000)NOT NULL,
	@CertificationDate DATETIME NOT NULL

INSERT INTO DimCertification
	(

	CertificationKey 	,	
	COAlarm  			,
	COFitted 
	COTested ,
	SmokeAlarm ,
	SmokeFitted ,
	SmokeTested ,
	NumberOfDefects ,
	ECV ,
	TightnessTest ,
	PipeVisual ,
	Bonding ,
	NumberOfAppliances ,
	NextInspectionDate ,
	Comments ,
	CertificationDate

	)

VALUES

(
	@CertificationKey 	,	
	@COAlarm  			,
	@COFitted 
	@COTested ,
	@SmokeAlarm ,
	@SmokeFitted ,
	@SmokeTested ,
	@NumberOfDefects ,
	@ECV ,
	@TightnessTest ,
	@PipeVisual ,
	@Bonding ,
	@NumberOfAppliances ,
	@NextInspectionDate ,
	@Comments ,
	@CertificationDate

)
 END

 GO

EXEC SP_Certification

	@CertificationKey =	,	
	@COAlarm =	 			,
	@COFitted =	
	@COTested  =	,
	@SmokeAlarm =	,
	@SmokeFitted =	,
	@SmokeTested =	,
	@NumberOfDefects =	,
	@ECV =	,
	@TightnessTest =	 ,
	@PipeVisual  =	,
	@Bonding =	,
	@NumberOfAppliances =	,
	@NextInspectionDate =	,
	@Comments =	 ,
	@CertificationDate =	


