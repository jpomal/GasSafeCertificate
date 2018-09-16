-- HERE ARE ALL IS THE ALTER TABLE TO ADD THE FORIEGN KEY CONTRAINTS

ALTER TABLE DimAppliance
ADD CONSTRAINT FK_FlueTypeKey
FOREIGN KEY (FlueTypeKey) REFERENCES DimFlueType(FlueTypeKey);

ALTER TABLE DimAppliance
ADD CONSTRAINT FK_ApplianceTypeKey
FOREIGN KEY (ApplianceTypeKey) REFERENCES DimApplianceType(ApplianceTypeKey);

ALTER TABLE Defect
ADD CONSTRAINT FK_DefectTypeKey
FOREIGN KEY (DefectTypeKey) REFERENCES DefectType(DefectTypeKey);

ALTER TABLE FactInspection
ADD CONSTRAINT FK_FactPersonKey
FOREIGN KEY (PersonKey) REFERENCES DimPerson(PersonKey);

ALTER TABLE FactInspection
ADD CONSTRAINT FK_FactAddressKey
FOREIGN KEY (AddressKey) REFERENCES Address(AddressKey);

ALTER TABLE FactInspection
ADD CONSTRAINT FK_InspectionCertificationKey
FOREIGN KEY (CertificationKey) REFERENCES DimCertification(CertificationKey);



