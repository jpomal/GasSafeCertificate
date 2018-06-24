CREATE TABLE IF NOT EXISTS Job (
    JobId                   INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL DEFAULT(-1),
    FirstName               VARCHAR(128),
    Surname                 VARCHAR(128),
    FirstLineAddress        VARCHAR(128),
    SecondLineAddress       VARCHAR(128),
    Postcode                VARCHAR(10),
    Phone                   VARCHAR(16)
)
