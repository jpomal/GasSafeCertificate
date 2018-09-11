use tempdb
GO



--CREATE TABLE  #DimFlueType(
--	FlueTypeKey					INT NOT NULL IDENTITY(1,1)		,
--	FlueType					VARCHAR(200)					,
--	PRIMARY KEY (FlueTypeKey)
--);


CREATE PROCEDURE #Sp_DimFlueType
	
	@FlueType						VARCHAR(200)		

	

	AS
BEGIN
	
	SET NOCOUNT ON

		SET IDENTITY_INSERT #DimFlueType ON; 


INSERT INTO #DimFlueType

	(
		
		FlueType				
	)

	VALUES

	(
		
		@FlueType
							
	)

END

GO

EXEC #Sp_DimFlueType

		
		@FlueType = 'TESTFLUE'




		

	--select * from #DimFlueType
	--DROP TABLE #DimFlueType
	--DROP PROCEDURE ##Sp_DimFlueType

	--select * from #DimFlueType
	--WHERE Make	= 'TESTMAKE02'
