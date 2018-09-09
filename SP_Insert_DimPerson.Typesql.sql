-- JITEN.POMAL VERSION 01
USE TEMPDB

GO

-- CREATE TABLE  PersonType(
-- PersonTypeKey 						INT NOT NULL IDENTITY(1,1)		,
-- Type 								VARCHAR(200)					,
-- PRIMARY KEY(PersonTypeKey)
-- );



CREATE PROCEDURE SP_PersonType

@PersonTypeKey 						INT NOT NULL 		,
@Type 								VARCHAR(200)	

 AS
BEGIN
	
	SET NOCOUNT ON

	SET IDENTITY_INSERT PersonType ON;

INSERT INTO PersonType

	(
		PersonTypeKey				,
		Type  						,
	)

VALUES
	 (
	 	@PersonType 				,
	 	@Type  						,
	 )

END

EXEC SP_PersonType

	@PersonType = 					,
	@Type   =						,





