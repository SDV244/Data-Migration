CREATE OR REPLACE TABLE ICON_AVG_VENTAS_MENSUAL (
    FSCL_YR_NB INT,
    DLR_CD INT,
    DSTRBR STRING,
    GROUP STRING,
    APRIL INT,
    MAY INT,
    JUNE INT,
    JULY INT,
    AUGUST INT,
    SEPTEMBER INT,
    OCTOBER INT,
    NOVEMBER INT,
    DECEMBER INT,
    JANUARY INT,
    FEBRUARY INT,
    MARCH DOUBLE,
    HashKey STRING,              -- Added column for unique row identifier or hash
    audit_loaded_date TIMESTAMP  -- Added column for tracking when the row was loaded
);

GRANT SELECT, INSERT, UPDATE, REFERENCES ON SDDBMTS1.NMX_MTS1_STG.ICON_AVG_VENTAS_MENSUAL TO ROLE "ENTER ROLE"_$(ENV);