CREATE OR REPLACE TABLE ICON_AVG_VENTAS_MENSUAL (
    FSCL_YR_NB NUMBER AS FSCL_YR_NB,
    DLR_CD VARCHAR(4) AS DLR_CD,
    DSTRBR VARCHAR(150) AS DLR_NM,
    "GROUP" VARCHAR(55) AS DLR_GRP_NM,
    APRIL NUMBER(12,2) AS VLU_1_NB,
    MAY NUMBER(12,2) AS VLU_2_NB,
    JUNE NUMBER(12,2) AS VLU_3_NB,
    JULY NUMBER(12,2) AS VLU_4_NB,
    AUGUST NUMBER(12,2) AS VLU_5_NB,
    SEPTEMBER NUMBER(12,2) AS VLU_6_NB,
    OCTOBER NUMBER(12,2) AS VLU_7_NB,
    NOVEMBER NUMBER(12,2) AS VLU_8_NB,
    DECEMBER NUMBER(12,2) AS VLU_9_NB,
    JANUARY NUMBER(12,2) AS VLU_10_NB,
    FEBRUARY NUMBER(12,2) AS VLU_11_NB,
    MARCH NUMBER(12,2) AS VLU_12_NB
    HashKey STRING,              -- Added column for unique row identifier or hash
    audit_loaded_date TIMESTAMP  -- Added column for tracking when the row was loaded
);

GRANT SELECT, INSERT, UPDATE, REFERENCES ON SDDBMTS1.NMX_MTS1_STG.ICON_AVG_VENTAS_MENSUAL TO ROLE "ENTER ROLE"_$(ENV);