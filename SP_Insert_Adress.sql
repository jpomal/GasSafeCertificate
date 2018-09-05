-- JITEN.POMAL VERSION 01

USE TEMPTB

GO

-- CREATE TABLE Address (
-- 	AddressKey 				INT NOT NULL IDENTITY(1,1)			,
-- 	CompanyName 			VARCHAR(200)						,
-- 	FirstLineAddress 		VARCHAR(200)						,
-- 	SecondLineAddress 	 	VARCHAR(500)						,
-- 	Postcode 				VARCHAR(8)							,
-- 	PRIMARY KEY(AddressKey)
-- );


CREATE PROCEDURE SP_Address

	@AddressKey 			INT NOT NULL 						,
	@CompanyName 			VARCHAR(200)						,
	@FirstLineAddress 		VARCHAR(200)						,
	@SecondLineAddress 	 	VARCHAR(500)						,
	@Postcode 				VARCHAR(8)							,

 AS
BEGIN
	
	SET NOCOUNT ON

	SET IDENTITY_INSERT Address ON;

INSERT INTO Address

	(
		AddressKey						,
		CompanyName						,
		FirstLineAddress				,
		SecondLineAddress				,
		Postcode						,
	)
VALUES

	(
		@AddressKey						,
		@CompanyName					,
		@FirstLineAddress				,
		@SecondLineAddress				,
		@Postcode						,

	)
END


EXEC SP_Address

		@AddressKey	 =					,
		@CompanyName =					,
		@FirstLineAddress =				,
		@SecondLineAddress =			,
		@Postcode	=					,

		