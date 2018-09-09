

use tempdb

go

	CREATE TABLE DefectType(
	DefectTypeKey 		INT NOT NULL IDENTITY(1,1),
	Type 				VARCHAR(200),
	PRIMARY KEY (DefectTypeKey)
);

CREATE PROCEDURE SP_DefectType

	@DefectType INT,
	@Type INT,

INSERT INTO DefectType
	 (
	 	DefectType,
	 	Type
	 )
VALUES	

	(
		@DefectType ,
		@Type
	)


EXEC SP_DefectType

	@DefectType  =,
	@Type =

