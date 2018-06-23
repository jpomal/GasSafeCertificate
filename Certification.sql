CREATE TABLE IF NOT EXISTS Certification (
    CertificationId         INT PRIMARY KEY AUTOINCREMENT NOT NULL DEFAULT(-1),
    COAlarm                 BIT,
    COFitted                BIT,
    COTested                BIT,
    SmokeAlarm              BIT,
    SmokeFitted             BIT,
    SmokeTested             BIT,
    Defects                 VARCHAR(4000),
    ECV                     BIT,
    TightnessTest           BIT,
    PipeVisual              BIT,
    Bonding                 BIT,
    NumberOfAppliances      INT,
    NextInspectionDate      DATETIME,
    Comments                VARCHAR(4000),
    CertificationDate       DATETIME
)