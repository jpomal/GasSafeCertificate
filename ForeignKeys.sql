/*-------------------------------------
FOREIGN KEYS
*/-------------------------------------

	FOREIGN KEY FK_TimeKey(TimeKey) REFERENCES FactCertificate(TimeKey)
		FOREIGN KEY FK_DateKey(DateKey) REFERENCES FactCertificate(DateKey) 
			FOREIGN KEY FK_JobKey(JobKey) REFERENCES FactCertificate(JobKey) 
				FOREIGN KEY FK_CertificationKey(CertificationKey) REFERENCES FactCertificate(CertificationKey) 
					FOREIGN KEY FK_FlueTypeKey(FlueTypeKey) REFERENCES DimAppliance(FlueTypeKey) 
						FOREIGN KEY FK_FlueTypeKey(FlueTypeKey) REFERENCES DimAppliance(FlueTypeKey)  
						 	FOREIGN KEY FK_ApplianceTypeKey(ApplianceTypeKey) REFERENCES DimAppliance(ApplianceTypeKey)   
						 		FOREIGN KEY FK_ApplianceKey(ApplianceKey) REFERENCES FactCertificate(ApplianceKey)
						 			FOREIGN KEY FK_UserKey(UserKey) REFERENCES FactCertificate(UserKey)
						 				FOREIGN KEY FK_CustomerKey(CustomerKey) REFERENCES FactCertificate(CustomerKey)