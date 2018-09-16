

use tempdb

go

	CREATE TABLE DefectType(
	DefectTypeKey 		INT NOT NULL IDENTITY(1,1),
	Type 				VARCHAR(200),
	PRIMARY KEY (DefectTypeKey)
);

CREATE PROCEDURE SP_DefectType

	@Type INT,

INSERT INTO DefectType
	 (
	 
	 	Type
	 )
VALUES	

	(
		
		@Type
	)


EXEC SP_DefectType

	
	@Type =

