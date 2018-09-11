-- JITEN.POMAL VERSION 01
-- use tempdb

-- GO


-- CREATE TABLE #DimAppliance (
-- 	ApplianceKey					INT NOT NULL IDENTITY(1,1)			,
-- 	ApplianceTypeKey				INT						,
-- 	FlueTypeKey						INT						,
-- 	Location						VARCHAR(200)			,
-- 	CompanyPostcode					BIT						,
-- 	ApplianceInspected				BIT						,
-- 	OperatingPressure				DECIMAL					,
-- 	CAPReadingHigh					DECIMAL					,
-- 	CAPReadingLow				    DECIMAL					,
-- 	SafetyDeviceWorking				BIT						,
-- 	Ventilaton						BIT						,
-- 	VisualOfFlue					BIT						,
-- 	FlueTermination					BIT						,
-- 	ApplianceServiced				BIT						,
-- 	ApplianceSafeToUse				BIT						,
-- 	SpillageTest					BIT						,
-- 	FlueFlowTest					BIT						,
-- 	PRIMARY KEY (ApplianceKey)
-- );

-- -- THIS IS TO CREATE THE FOREIGN KEY USING THE ALTER WE CAN ADD IT AFTER THE CODE SHOULD LOOK LIKE THIS:

-- ALTER TABLE DimAppliance
-- ADD CONSTRAINT FK_FlueTypeKey
-- FOREIGN KEY (FlueTypeKey) REFERENCES DimFlueType(FlueTypeKey);

-- ALTER TABLE DimAppliance
-- ADD CONSTRAINT FK_ApplianceTypeKey
-- FOREIGN KEY (ApplianceTypeKey) REFERENCES DimApplianceType(ApplianceTypeKey);



SET IDENTITY_INSERT #DimAppliance ON;

CREATE PROCEDURE #Sp_DimAppliance

	
	
	@FlueTypeKey				INT ,
	@Location					VARCHAR(200),
	@CompanyPostcode			BIT,
	@ApplianceInspected			BIT,
	@OperatingPressure			DECIMAL,
	@CAPReadingHigh				DECIMAL,
	@CAPReadingLow				DECIMAL,
	@SafetyDeviceWorking		BIT,
	@Ventilaton					BIT,
	@VisualOfFlue				BIT,
	@FlueTermination			BIT,
	@ApplianceServiced			BIT,
	@ApplianceSafeToUse			BIT,
	@SpillageTest				BIT,
	@FlueFlowTest				BIT
AS
BEGIN
	
	SET NOCOUNT ON

	SET IDENTITY_INSERT #DimFlueType ON;

INSERT INTO #DimAppliance

		(
			
			
			FlueTypeKey			,
			Location			,
			CompanyPostcode		,
			ApplianceInspected	,
			OperatingPressure   ,
			CAPReadingHigh		,
			CAPReadingLow		,
			SafetyDeviceWorking ,
			Ventilaton          ,
			VisualOfFlue        ,
			FlueTermination     ,
			ApplianceServiced   ,
			ApplianceSafeToUse  ,
			SpillageTest        ,
			FlueFlowTest		
		)
VALUES 
		(
			
			
			@FlueTypeKey			,
			@Location				,
			@CompanyPostcode		,
			@ApplianceInspected		,
			@OperatingPressure		,
			@CAPReadingHigh			,
			@CAPReadingLow			,
			@SafetyDeviceWorking	,
			@Ventilaton				,
			@VisualOfFlue			,
			@FlueTermination		,
			@ApplianceServiced		,
			@ApplianceSafeToUse		,
			@SpillageTest			,
			@FlueFlowTest		
		)

END

GO

EXEC #Sp_DimAppliance

	
	
	@FlueTypeKey =	25				,
	@Location = 'WEST LONDON'		,
	@CompanyPostcode = 1			,
	@ApplianceInspected	= 1			,
	@OperatingPressure	= 0.1		,
	@CAPReadingHigh =	0.2			,
	@CAPReadingLow = 	000.2		,
	@SafetyDeviceWorking = 1		,
	@Ventilaton	=	1				,
	@VisualOfFlue = 1				,
	@FlueTermination = 	0			,
	@ApplianceServiced = 0			,
	@ApplianceSafeToUse	= 0			,
	@SpillageTest =	0				,
	@FlueFlowTest = 0




	--drop procedure #Sp_DimAppliance

	--select * from #DimApplianceType
	--drop table #DimAppliance

	