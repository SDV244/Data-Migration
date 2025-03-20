-- Tabla: IN_CMPLNC_NRFM_SG
CREATE OR REPLACE TABLE NMX_MTS1_STG.IN_CMPLNC_NRFM_SG (
    FSCL_YR_NB NUMBER COMMENT 'Fiscal Year Number',
    FSCL_MNTH_NB NUMBER COMMENT 'Fiscal Month Number',
    DLR_CD VARCHAR(4) COMMENT 'Natural code that identifies dealer',
    DLR_NM VARCHAR(55) COMMENT 'Dealers Name',
    RGNL_ZN_NM VARCHAR(55) COMMENT 'Sales area by region',
    DLR_ACNT_MGR_NM VARCHAR(55) COMMENT 'Name of DAM (Dealer Account Manager) of the finance company.',
    DLR_GRP_NM VARCHAR(55) COMMENT 'The name that identifies each group',
    CNTRCT_TRGT_NB NUMBER(12,2) COMMENT 'Monthly contract targets',
    RTL_CNTRCT_NB NUMBER(12,2) COMMENT 'Monthly retail contracts achieved by distributor',
    RTL_SL_NMEX_NB NUMBER(12,2) COMMENT 'Retail sales per distributor',
    SELECTIVITY_LEASING_NB NUMBER(12,2) COMMENT 'Monthly compliance of the selectivity and leasing financing plan indicator',
    EXTND_WRNTY_PC NUMBER(12,6) COMMENT 'Compliance with monthly target for the extended warranty indicator',
    HASHKEY STRING COMMENT 'Corresponds to the unique identifier of the table.',
    AUDIT_LOADED_DATE TIMESTAMP COMMENT 'Corresponds to the date when the data was loaded into the system for auditing purposes.'
) COMMENT='Contains staging data for NRFM compliance indicators.';

-- Tabla: IN_CMPLNC_NRFM_2_SG
CREATE OR REPLACE TABLE NMX_NMTS1.IN_CMPLNC_NRFM_2_SG (
    IN_CMPLNC_NRFM_KY STRING COMMENT 'Corresponds to the unique identifier of the table.',
    CLNDR_DT NUMBER COMMENT 'Date in format yyyymmdd that corresponds to the month of the objective',
    DLR_KY NUMBER COMMENT 'A unique system generated numeric value that identifies a specific dealer dimension row.',
    DLR_CD VARCHAR(4) COMMENT 'Natural code that identifies dealer',
    DLR_ACNT_MGR_NM VARCHAR(55) COMMENT 'Name of DAM (Dealer Account Manager) of the finance company.',
    CNTRCT_TRGT_NB NUMBER(12,2) COMMENT 'Monthly contract targets',
    RTL_CNTRCT_NB NUMBER(12,2) COMMENT 'Monthly retail contracts achieved by distributor',
    RTL_SL_NMEX_NB NUMBER(12,2) COMMENT 'Retail sales per distributor',
    SELECTIVITY_LEASING_NB NUMBER(12,2) COMMENT 'Monthly compliance of the selectivity and leasing financing plan indicator',
    EXTND_WRNTY_PC NUMBER(12,6) COMMENT 'Compliance with monthly target for the extended warranty indicator',
    ADT_LOD_DT TIMESTAMP COMMENT 'Corresponds to the date when the data was loaded into the system for auditing purposes.',   
    CRTE_USR_ID VARCHAR(50) COMMENT 'Unique value of person, program module or service that initially created this row.',
    UPDT_USR_ID VARCHAR(50) COMMENT 'Unique value of person, program module or service that modified this row.',
    CRTE_TS TIMESTAMP COMMENT 'Date and time when this row was inserted into this table.',
    UPDT_TS TIMESTAMP COMMENT 'Date and time when this row was last updated or modified in this table.'
) COMMENT='Contains staging data for NRFM compliance indicators.';
