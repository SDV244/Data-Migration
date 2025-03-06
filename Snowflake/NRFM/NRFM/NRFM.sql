CREATE OR REPLACE TABLE NRFM (
    FSCL_YR_NB INT,
    MNTH_NB INT,
    DLR_CD STRING,
    DEALER STRING,
    REGION STRING,
    ZONE_MANAGER STRING,
    GROUP STRING,
    CONTRACTS_TARGET INT,
    RETAIL_CONTRACTS INT,
    RETAIL_SALES_NMEX INT,
    SELECTIVITY_LEASING INT,
    EXTENDED_WARRANTY_PERCENTAGE DOUBLE,
    HashKey STRING,              -- Added column for unique row identifier or hash
    audit_loaded_date TIMESTAMP  -- Added column for tracking when the row was loaded
);

GRANT SELECT, INSERT, UPDATE, REFERENCES ON SDDBMTS1.NMX_MTS1_STG.NRFM TO ROLE "ENTER ROLE"_$(ENV);