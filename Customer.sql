CREATE TABLE IF NOT EXISTS Customer (
    CustomerId          INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL DEFAULT(-1),
    FirstName           VARCHAR(100),
    Surname             VARCHAR(100),
    FirstLinAddress     VARCHAR(100),
    SecondLineAddress   VARCHAR(100),
    Postcode            VARCHAR(10),
    CompanyName         VARCHAR(100),
    Phone               VARCHAR(16),
    Email               VARCHAR(300)
)
