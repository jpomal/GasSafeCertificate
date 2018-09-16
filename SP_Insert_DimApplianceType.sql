
--use tempdb

--GO


--CREATE TABLE  #DimApplianceType (
-- 	ApplianceTypeKey				INT NOT NULL IDENTITY(1,1) ,
-- 	App_Type						VARCHAR(200) NOT NULL		,
-- 	Make							VARCHAR(200) NOT NULL		,
-- 	Model							VARCHAR(200) NOT NULL		,
-- 	GCNumber						VARCHAR(20)	 NOT NULL				,
-- 	PRIMARY KEY (ApplianceTypeKey)
--);


CREATE PROCEDURE #Sp_DimApplianceType 

	
 	@App_Type						VARCHAR	(200)			,
 	@Make							VARCHAR	(200)			,
 	@Model							VARCHAR	(200)			,
 	@GCNumber						VARCHAR (200)

	AS
BEGIN
	
	SET NOCOUNT ON


SET IDENTITY_INSERT #DimApplianceType ON; 


INSERT INTO #DimApplianceType
(
	
 	App_Type						,
 	Make							,
 	Model							,
 	GCNumber						

)

VALUES

(

	
 	@App_Type						,
 	@Make							,
 	@Model							,
 	@GCNumber				

)

END

GO

EXEC #Sp_DimApplianceType

	
 	@App_Type = 'TEST'					,
 	@Make	= 'TEST',
 	@Model	= 'TEST'					,
 	@GCNumber = 'TEST'



	--select * from #DimApplianceType
	--DROP TABLE #DimApplianceType
	--DROP PROCEDURE #Sp_DimApplianceType

	--select * from #DimApplianceType
	--WHERE Make	= 'TESTMAKE02'

	-- TRUNCATE TABLE #DimApplianceType