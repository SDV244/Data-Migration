-- Tabla: SLS_CMPLNC_OF_OBJCTV_SG
CREATE OR REPLACE TABLE NMX_MTS1_STG.SLS_CMPLNC_OF_OBJCTV_SG (
    FSCL_YR_NB NUMBER COMMENT 'Fiscal Year Number',
    FSCL_MNTH_NB NUMBER COMMENT 'Month Number',
    DLR_GRP_NM VARCHAR(55) COMMENT 'The name that identifies each group',
    DLR_CD VARCHAR(4) COMMENT 'Natural code that identifies dealer',
    DLR_NM VARCHAR(150) COMMENT 'Dealers Name',
    DLR_OWNR_NM VARCHAR(150) COMMENT 'The name of the group owner',
    CMPLNC_OF_OBJCTV_PC NUMBER(12,6) COMMENT 'Achievement of sales target',
    HASHKEY STRING COMMENT 'Corresponds to the unique identifier of the table.',
    AUDIT_LOADED_DATE TIMESTAMP COMMENT 'Corresponds to the date when the data was loaded into the system for auditing purposes.'
) COMMENT='Contains information on sales objective compliance, comparing actual sales with established targets.';

-- Tabla: SLS_CMPLNC_OF_OBJCTV_2_SG
CREATE OR REPLACE TABLE NMX_NMTS1.SLS_CMPLNC_OF_OBJCTV_2_SG (
    SLS_CMPLNC_OF_OBJCTV_KY STRING COMMENT 'Corresponds to the unique identifier of the table.',
    CLNDR_DT NUMBER COMMENT 'Date in format yyyymmdd that corresponds to the month of the objective',
    DLR_KY NUMBER COMMENT 'A unique system generated numeric value that identifies a specific dealer dimension row.',
    DLR_CD VARCHAR(4) COMMENT 'Natural code that identifies dealer',
    CMPLNC_OF_OBJCTV_PC NUMBER(12,6) COMMENT 'The percentage of achievement of the set objective',
    ADT_LOD_DT TIMESTAMP COMMENT 'Corresponds to the date when the data was loaded into the system for auditing purposes.',   
    CRTE_USR_ID VARCHAR(50) COMMENT 'Unique value of person, program module or service that initially created this row.',
    UPDT_USR_ID VARCHAR(50) COMMENT 'Unique value of person, program module or service that modified this row.',
    CRTE_TS TIMESTAMP COMMENT 'Date and time when this row was inserted into this table.',
    UPDT_TS TIMESTAMP COMMENT 'Date and time when this row was last updated or modified in this table.'
) COMMENT='Contains information on sales objective compliance, comparing actual sales with established targets.';

-- Tabla: SLS_OF_EFCNCY_SG
CREATE OR REPLACE TABLE NMX_MTS1_STG.SLS_OF_EFCNCY_SG (
    FSCL_YR_NB NUMBER COMMENT 'Fiscal Year Number',
    DLR_NM VARCHAR(150) COMMENT 'Dealers Name',
    DLR_CD VARCHAR(4) COMMENT 'Natural code that identifies dealer',
    VLU_1_NB NUMBER(12,6) COMMENT 'The month of target achievement for the 1st fiscal month of April.',
    VLU_2_NB NUMBER(12,6) COMMENT 'The month of target achievement for the 2nd fiscal month of May.',
    VLU_3_NB NUMBER(12,6) COMMENT 'The month of target achievement for the 3rd fiscal month of June.',
    VLU_4_NB NUMBER(12,6) COMMENT 'The month of target achievement for the 4th fiscal month of July.',
    VLU_5_NB NUMBER(12,6) COMMENT 'The month of target achievement for the 5th fiscal month of August.',
    VLU_6_NB NUMBER(12,6) COMMENT 'The month of target achievement for the 6th fiscal month of September.',
    VLU_7_NB NUMBER(12,6) COMMENT 'The month of target achievement for the 7th fiscal month of October.',
    VLU_8_NB NUMBER(12,6) COMMENT 'The month of target achievement for the 8th fiscal month of November.',
    VLU_9_NB NUMBER(12,6) COMMENT 'The month of target achievement for the 9th fiscal month of December.',
    VLU_10_NB NUMBER(12,6) COMMENT 'The month of target achievement for the 10th fiscal month of January.',
    VLU_11_NB NUMBER(12,6) COMMENT 'The month of target achievement for the 11th fiscal month of February.',
    VLU_12_NB NUMBER(12,6) COMMENT 'The month of target achievement for the 12th fiscal month of March.',
    HASHKEY STRING COMMENT 'Corresponds to the unique identifier of the table.',
    AUDIT_LOADED_DATE TIMESTAMP COMMENT 'Corresponds to the date when the data was loaded into the system for auditing purposes.'
) COMMENT='Contains data that measures sales efficiency by evaluating actual sales performance against expected or optimal sales targets.';

-- Tabla: SLS_OF_EFCNCY_2_SG
CREATE OR REPLACE TABLE NMX_NMTS1.SLS_OF_EFCNCY_2_SG (
    SLS_OF_EFCNCY_KY STRING COMMENT 'Corresponds to the unique identifier of the table.',
    CLNDR_DT NUMBER COMMENT 'Date in format yyyymmdd that corresponds to the month of the objective',
    DLR_KY NUMBER COMMENT 'A unique system generated numeric value that identifies a specific dealer dimension row.',
    DLR_CD VARCHAR(4) COMMENT 'Natural code that identifies dealer',
    SLS_OF_OBJCTV_PC NUMBER(12,2) COMMENT 'The percentage that measures the efficiency of sales',
    ADT_LOD_DT TIMESTAMP COMMENT 'Corresponds to the date when the data was loaded into the system for auditing purposes.',   
    CRTE_USR_ID VARCHAR(50) COMMENT 'Unique value of person, program module or service that initially created this row.',
    UPDT_USR_ID VARCHAR(50) COMMENT 'Unique value of person, program module or service that modified this row.',
    CRTE_TS TIMESTAMP COMMENT 'Date and time when this row was inserted into this table.',
    UPDT_TS TIMESTAMP COMMENT 'Date and time when this row was last updated or modified in this table.'
) COMMENT='Contains data that measures sales efficiency by evaluating actual sales performance against expected or optimal sales targets.';
