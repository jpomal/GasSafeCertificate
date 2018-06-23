CREATE TABLE IF NOT EXISTS Appliance (
    ApplianceId         INT PRIMARY KEY AUTOINCREMENT NOT NULL DEFAULT(-1),
    ApplianceTypeId     INT,
    FlueTypeId          INT,
    Location            VARCHAR(200),
    LandlordAppliance   BIT,
    ApplianceInspected  BIT,
    OperatingPressure   DECIMAL,
    CPAReadingHigh      DECIMAL,
    CAPReadingLow       DECIMAL,
    SafetyDeviceWorking BIT,
    Ventilaton          BIT,
    VisualOfFlue        BIT,
    FlueTermination     BIT,
    ApplianceServiced   BIT,
    ApplianceSafeToUse  BIT,
    SpillageTest        BIT,
    FlueFlowTest        BIT
)