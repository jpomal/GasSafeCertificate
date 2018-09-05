 --JITEN.POMAL VERSION 01
USE TEMPDB

GO
--  CREATE TABLE #DimPerson
-- (
-- 	PersonKey 					INT NOT NULL IDENTITY(1,1)				,
-- 	PersonTypeKey 				INT NOT NULL						    ,
-- 	AddressKey 					INT NOT NULL		 					,
-- 	FirstName 					VARCHAR(100)							,
-- 	Surname 					VARCHAR(100)							,
-- 	CompanyName                 VARCHAR(100)							,
-- 	Phone 						VARCHAR(16)								,
-- 	Email 						VARCHAR(300)							,					
-- 	GasID 						INT NOT NULL							,
-- 	GasEngineerSigniture 		VARCHAR(MAX)							, -- THIS DATA TYPE WILL NEED TO BE REVIEWED 
-- 	PRIMARY KEY (PersonKey)
 
-- );

-- ALTER TABLE DimPerson
-- ADD CONSTRAINT FK_PersonTypeKey
-- FOREIGN KEY (PersonTypeKey) REFERENCES PersonType(PersonTypeKey);

-- ALTER TABLE DimPerson
-- ADD CONSTRAINT FK_AddressKey
-- FOREIGN KEY (AddressKey) REFERENCES Address(AddressKey);

-- TEST TO SEE IF YOU NEED TO SPECIFY THE NOT NULL AS WE HAVE ALREADY HAVE IN THE CREATE TABLE STATMENT
CREATE PROCEDURE #Sp_DimPerson

	@PersonKey 					INT NOT NULL 						    ,
	@PersonTypeKey 				INT NOT NULL						    ,
	@AddressKey 				INT NOT NULL		 					,
	@FirstName 					VARCHAR(100)							,
 	@Surname 					VARCHAR(100)							,
	@companyName                VARCHAR(100)							,
 	@Phone 						VARCHAR(16)								,
 	@Email 						VARCHAR(300)							,					
 	@GasID 						INT NOT NULL							,
 	@GasEngineerSigniture 		VARCHAR(MAX)							, -- THIS DATA TYPE WILL NEED TO BE REVIEWED 
 	

 AS
BEGIN
	
	SET NOCOUNT ON

	SET IDENTITY_INSERT #DimPerson ON;

INSERT INTO DimPerson

	(

	PersonKey 					,			
	PersonTypeKey 				,
	AddressKey 				    ,
	FirstName 					,
 	Surname 					,
	companyName            	    ,
 	Phone 						,				
 	Email 					    ,					
 	GasID 					    ,
 	GasEngineerSigniture 	    ,


	)

VALUES
	(

	@PersonKey 					,			
	@PersonTypeKey 				,
	@AddressKey 				,
	@FirstName 					,
 	@Surname 					,
	@companyName            	,
 	@Phone 						,				
 	@Email 					    ,					
 	@GasID 					    ,
 	@GasEngineerSigniture 	    ,


	)

END

EXEC Sp_DimPerson

	@PersonKey 	=				,			
	@PersonTypeKey =				,
	@AddressKey =				,
	@FirstName 	=				,
 	@Surname 	=				,
	@companyName  =          	,
 	@Phone 		=				,				
 	@Email 	=				    ,					
 	@GasID 	=				    ,
 	@GasEngineerSigniture =	    ,



