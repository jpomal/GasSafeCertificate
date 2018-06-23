CREATE TABLE IF NOT EXISTS Users (
  UserId integer PRIMARY KEY AUTOINCREMENT NOT NULL DEFAULT(-1),
  Name varchar(128) NOT NULL DEFAULT(''),
  Surname varchar(128) NOT NULL DEFAULT(''),
  GasID integer(128) NOT NULL,
  CompanyAddress varchar(1000) NOT NULL,
  CompanyPostcode varchar(10) NOT NULL,
  CompanyGasID integer(128) NOT NULL,
  GasEngineerSignature nvarchar NOT NULL
);