-- This is the main script that will hold all the tables for GASCERT database In order 
			CREATE TABLE dimappliancetype 
             ( 
                          appliancetypekey INT NOT NULL IDENTITY(1, 1) , 
                          app_type         VARCHAR(200) NOT NULL , 
                          make             VARCHAR(200) NOT NULL , 
                          model            VARCHAR(200) NOT NULL , 
                          gcnumber         VARCHAR(20) NOT NULL , 
                          PRIMARY KEY (appliancetypekey) 
             );

             CREATE TABLE dimfluetype 
             ( 
                          fluetypekey INT NOT NULL IDENTITY(1, 1) , 
                          fluetype    VARCHAR(200) , 
                          PRIMARY KEY (fluetypekey) 
             );

             CREATE TABLE dimappliance 
             ( 
                          appliancekey        INT NOT NULL IDENTITY(1, 1) , 
                          appliancetypekey    INT , 
                          fluetypekey         INT , 
                          location            VARCHAR(200) , 
                          companypostcode     BIT , 
                          applianceinspected  BIT , 
                          operatingpressure   DECIMAL , 
                          capreadinghigh      DECIMAL , 
                          capreadinglow       DECIMAL , 
                          safetydeviceworking BIT , 
                          ventilaton          BIT , 
                          visualofflue        BIT , 
                          fluetermination     BIT , 
                          applianceserviced   BIT , 
                          appliancesafetouse  BIT , 
                          spillagetest        BIT , 
                          flueflowtest        BIT , 
                 )         PRIMARY KEY (appliancekey) 
             );

              CREATE TABLE persontype 
             ( 
                          persontypekey INT NOT NULL IDENTITY(1, 1) , 
                          type          VARCHAR(200) , 
                          PRIMARY KEY(persontypekey) 
             );CREATE TABLE address 
             ( 
                          addresskey        INT NOT NULL IDENTITY(1, 1) , 
                          companyname       VARCHAR(200) , 
                          firstlineaddress  VARCHAR(200) , 
                          secondlineaddress VARCHAR(500) , 
                          postcode          VARCHAR(8) , 
                          PRIMARY KEY(addresskey) 
             );
             CREATE TABLE dimperson 
             ( 
                          personkey            INT NOT NULL IDENTITY(1, 1) , 
                          persontypekey        INT NOT NULL , 
                          addresskey           INT NOT NULL , 
                          firstname            VARCHAR(100) , 
                          surname              VARCHAR(100) , 
                          companyname          VARCHAR(100) , 
                          phone                VARCHAR(16) , 
                          email                VARCHAR(300) , 
                          gasid                INT NOT NULL , 
                          gasengineersigniture VARCHAR(max) , -- THIS DATA TYPE WILL NEED TO BE REVIEWED 
                          PRIMARY KEY (personkey) 
             );

             CREATE TABLE defecttype 
             ( 
                          defecttypekey INT NOT NULL IDENTITY(1, 1), 
                          type          VARCHAR(200), 
                          PRIMARY KEY (defecttypekey) 
             );

             CREATE TABLE defect 
             ( 
                          defectkey     INT NOT NULL IDENTITY(1, 1), 
                          defecttypekey INT NOT NULL, 
                          severity      INT, 
                          comment       VARCHAR(4000), 
                          PRIMARY KEY(defectkey) 
             );
             CREATE TABLE inspectiondefect 
             ( 
                          inspectiondefectkey IINT NOT NULL IDENTITY(1, 1), 
                          certificationkey INT NOT NULL, 
                          defectkey        INT NOT NULL, 
                          PRIMARY KEY(inspectiondefectkey) 
             );
             CREATE TABLE factinspection 
             ( 
                          factinspectionkey      INT NOT NULL IDENTITY(1, 1) , 
                          personkey              INT NOT NULL , 
                          addresskey             INT NOT NULL , 
                          nextinspectiondatetime DATETIME NOT NULL , 
                          certificationissued    BIT NOT NULL , 
                          certificationkey       INT , 
                          PRIMARY KEY (factinspectionkey) 
             );