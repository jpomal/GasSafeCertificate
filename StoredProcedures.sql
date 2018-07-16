/*
------- STORED PROCEDURES
*/

/*
--- EXAMPLE USAGE
CALL InsertUser
   (
	'JULIAN',
	'DRAGOI',
	123456,
	'9, PIPPIN',
	78910,
	'NVARCHAR'
   )
;
*/

CREATE PROCEDURE InsertUser (
	IN FirstName VARCHAR(100),
	IN LastName VARCHAR(100),
	IN GasID INT,
	IN CompanyAddress VARCHAR(100),
	IN CompanyPostcode VARCHAR(10),
	IN CompanyGasID INT,
	IN GasEngineerSigniture NVARCHAR(100));
BEGIN
	INSERT INTO DimUser (
		FirstName,
		LastName,
		GasID,
		CompanyAddress,
		CompanyPostcode,
		CompanyGasID,
		GasEngineerSigniture) 
	VALUES (
		FirstName,
		LastName,
		GasID,
		CompanyAddress,
		CompanyPostcode,
		CompanyGasID,
		GasEngineerSigniture);
END;


CREATE PROCEDURE InsertCustomer (
	IN FirstName VARCHAR(100),
	IN Surname VARCHAR(100),
	IN FirstLinAddress VARCHAR(100),
	IN SecondLineAddress VARCHAR(100),
	IN Postcode VARCHAR(10),
	IN CompanyName VARCHAR(100),
	IN Phone VARCHAR(16),
	IN Email VARCHAR(300)
	);
BEGIN
	INSERT INTO DimUser (
		FirstName,
		Surname,
		FirstLinAddress,
		SecondLineAddress,
		Postcode,
		CompanyName,
		Phone,
		Email 
	VALUES (
		FirstName,
		Surname,
		FirstLinAddress,
		SecondLineAddress,
		Postcode,
		CompanyName,
		Phone,
		Email);
END;

