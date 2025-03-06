CREATE OR REPLACE TABLE ICON_REGLAS (
    NEW_POSITION STRING,
    POSITION_TYPE STRING,
    STORE_SIZE STRING,
    MINIMUM_REQUIRED_STAFF INT,
    HashKey STRING,              -- Added column for unique row identifier or hash
    audit_loaded_date TIMESTAMP  -- Added column for tracking when the row was loaded
);

GRANT SELECT, INSERT, UPDATE, REFERENCES ON SDDBMTS1.NMX_MTS1_STG.ICON_REGLAS TO ROLE "ENTER ROLE"_$(ENV);