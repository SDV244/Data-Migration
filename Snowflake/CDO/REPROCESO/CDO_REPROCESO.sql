CREATE OR REPLACE TABLE CDO_REPROCESO (
    FSCL_YR_NB INT,
    DSTRBR STRING,
    DLR_CD INT,
    JANUARY DOUBLE,
    FEBRUARY DOUBLE,
    MARCH DOUBLE,
    APRIL DOUBLE,
    MAY DOUBLE,
    JUNE DOUBLE,
    JULY DOUBLE,
    AUGUST DOUBLE,
    SEPTEMBER DOUBLE,
    OCTOBER DOUBLE,
    NOVEMBER DOUBLE,
    DECEMBER DOUBLE,
    HashKey STRING,              -- Added column for unique row identifier or hash
    audit_loaded_date TIMESTAMP  -- Added column for tracking when the row was loaded
);

GRANT SELECT, INSERT, UPDATE, REFERENCES ON SDDBMTS1.NMX_MTS1_STG.CDO_REPROCESO TO ROLE "ENTER ROLE"_$(ENV);