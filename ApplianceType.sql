CREATE TABLE IF NOT EXISTS ApplianceType (
    ApplianceTypeId     INT PRIMARY KEY AUTOINCREMENT NOT NULL DEFAULT(-1),
    Type                VARCHAR(200) NOT NULL,
    Make                VARCHAR(200) NOT NULL,
    Model               VARCHAR(200) NOT NULL,
    GCNumber            VARCHAR(20)   
)