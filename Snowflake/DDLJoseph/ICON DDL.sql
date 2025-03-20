-- Tabla: CMPLNC_STRCTR_ORGNZN_DLR_SG
CREATE OR REPLACE TABLE NMX_MTS1_STG.CMPLNC_STRCTR_ORGNZN_DLR_SG (
    DLR_CD VARCHAR(4) COMMENT 'Natural code that identifies dealer',
    DLR_NM VARCHAR(150) COMMENT 'Dealers Name',
    DLR_GRP_NM VARCHAR(55) COMMENT 'The name that identifies each group',
    DLR_ZN_NM VARCHAR(55) COMMENT 'Sales area by region',
    SLS_DS VARCHAR(50) COMMENT 'Business area sales',
    AFTR_SLS_DS VARCHAR(50) COMMENT 'Aftersales business area',
    POWN_DS VARCHAR(50) COMMENT 'Preowned business area',
    FLT_DS VARCHAR(50) COMMENT 'Fleet business area',
    MGMT_BSNS_ARA_DS VARCHAR(50) COMMENT 'Management business area',
    SHT_MTL_PAINTING_BSNS_DS VARCHAR(50) COMMENT 'Sheet metal and painting business area',
    WHLSL_DS VARCHAR(50) COMMENT 'Wholesale business area',
    FOM_NM VARCHAR(55) COMMENT 'Regional after-sales managers',
    DOM_NM VARCHAR(55) COMMENT 'Regional sales managers',
    HASHKEY STRING COMMENT 'Corresponds to the unique identifier of the table.',
    AUDIT_LOADED_DATE TIMESTAMP COMMENT 'Corresponds to the date when the data was loaded into the system for auditing purposes.'
) COMMENT='Contains compliance structure and dealer organization data';

-- Tabla: CMPLNC_STRCTR_ORGNZN_DLR_2_SG
CREATE OR REPLACE TABLE NMX_NMTS1.CMPLNC_STRCTR_ORGNZN_DLR_2_SG (
    CMPLNC_STRCTR_ORGNZN_DLR_KY STRING COMMENT 'Corresponds to the unique identifier of the table.',
    DLR_KY NUMBER COMMENT 'A unique system generated numeric value that identifies a specific dealer dimension row.',
    DLR_CD VARCHAR(4) COMMENT 'Natural code that identifies dealer',
    SLS_DS VARCHAR(50) COMMENT 'Business area sales',
    AFTR_SLS_DS VARCHAR(50) COMMENT 'Aftersales business area',
    POWN_DS VARCHAR(50) COMMENT 'Preowned business area',
    FLT_DS VARCHAR(50) COMMENT 'Fleet business area',
    MGMT_BSNS_ARA_DS VARCHAR(50) COMMENT 'Management business area',
    SHT_MTL_PAINTING_BSNS_DS VARCHAR(50) COMMENT 'Sheet metal and painting business area',
    WHLSL_DS VARCHAR(50) COMMENT 'Wholesale business area',
    ADT_LOD_DT TIMESTAMP COMMENT 'Corresponds to the date when the data was loaded into the system for auditing purposes.',   
    CRTE_USR_ID VARCHAR(50) COMMENT 'Unique value of person, program module or service that initially created this row or record',
    UPDT_USR_ID VARCHAR(50) COMMENT 'Unique value of person, program module or service that modified this row or record',
    CRTE_TS TIMESTAMP COMMENT 'Date and time when this row or record was inserted',
    UPDT_TS TIMESTAMP COMMENT 'Date and time when this row or record was last updated'
) COMMENT='Contains compliance structure and dealer organization data';

-- Tabla: SLS_MNTHLY_OBJCTV_SG
CREATE OR REPLACE TABLE NMX_MTS1_STG.SLS_MNTHLY_OBJCTV_SG (
    FSCL_YR_NB NUMBER COMMENT 'Fiscal Year Number',
    DLR_CD VARCHAR(4) COMMENT 'Natural code that identifies dealer',
    DLR_NM VARCHAR(150) COMMENT 'Dealers Name',
    DLR_GRP_NM VARCHAR(55) COMMENT 'The name that identifies each group',
    VLU_1_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly sales objectives for the 1st fiscal month of April.',
    VLU_2_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly sales objectives for the 2nd fiscal month of May.',
    VLU_3_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly sales objectives for the 3rd fiscal month of Jun.',
    VLU_4_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly sales objectives for the 4th fiscal month of July',
    VLU_5_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly sales objectives for the 5th fiscal month of August.',
    VLU_6_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly sales objectives for the 6th fiscal month of September.',
    VLU_7_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly sales objectives for the 7th fiscal month of October.',
    VLU_8_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly sales objectives for the 8th fiscal month of November.',
    VLU_9_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly sales objectives for the 9th fiscal month of December.',
    VLU_10_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly sales objectives for the 10th fiscal month of January.',
    VLU_11_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly sales objectives for the 11th fiscal month of February.',
    VLU_12_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly sales objectives for the 12th fiscal month of March.',
    HASHKEY STRING COMMENT 'Corresponds to the unique identifier of the table.',
    AUDIT_LOADED_DATE TIMESTAMP COMMENT 'Corresponds to the date when the data was loaded into the system for auditing purposes.'
) COMMENT = 'Contains monthly sales targets and performance metrics.';

-- Tabla: SLS_MNTHLY_OBJCTV_2_SG
CREATE OR REPLACE TABLE NMX_NMTS1.SLS_MNTHLY_OBJCTV_2_SG (
    SLS_MNTHLY_OBJCTV_KY STRING COMMENT 'Corresponds to the unique identifier of the table.',
    CLNDR_DT NUMBER COMMENT 'Date in format yyyymmdd that corresponds to the month of the objective',
    DLR_KY NUMBER COMMENT 'A unique system-generated numeric value that identifies a specific dealer dimension row.',
    DLR_CD VARCHAR(4) COMMENT 'Natural code that identifies dealer',
    SLS_OBJCTV_QT NUMBER(12,2) COMMENT 'The target number of units or sales a business aims to achieve within a specific period.',
    ADT_LOD_DT TIMESTAMP COMMENT 'Corresponds to the date when the data was loaded into the system for auditing purposes.',   
    CRTE_USR_ID VARCHAR(50) COMMENT 'Unique value of person, program module or service that initially created this row or record.',
    UPDT_USR_ID VARCHAR(50) COMMENT 'Unique value of person, program module or service that modified this row or record.',
    CRTE_TS TIMESTAMP COMMENT 'Date and time when this row or record was inserted.',
    UPDT_TS TIMESTAMP COMMENT 'Date and time when this row or record was last updated.'
) COMMENT = 'Contains monthly sales targets and performance metrics.';

-- Tabla: SVC_MNTHLY_ORDR_SG
CREATE OR REPLACE TABLE NMX_MTS1_STG.SVC_MNTHLY_ORDR_SG (
    FSCL_YR_NB NUMBER COMMENT 'Fiscal Year Number',
    DLR_CD VARCHAR(4) COMMENT 'Natural code that identifies dealer',
    DLR_NM VARCHAR(150) COMMENT 'Dealers Name',
    DLR_GRP_NM VARCHAR(55) COMMENT 'The name that identifies each group',
    VLU_1_ORDR_PBLC_WRNTY_INTRNL_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public, warranty and internal service orders for the 1st fiscal month of April.',
    VLU_2_ORDR_PBLC_WRNTY_INTRNL_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public, warranty and internal service orders for the 2nd fiscal month of May',
    VLU_3_ORDR_PBLC_WRNTY_INTRNL_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public, warranty and internal service orders for the 3rd fiscal month of June.',
    VLU_4_ORDR_PBLC_WRNTY_INTRNL_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public, warranty and internal service orders for the 4th fiscal month of July.',
    VLU_5_ORDR_PBLC_WRNTY_INTRNL_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public, warranty and internal service orders for the 5th fiscal month of August.',
    VLU_6_ORDR_PBLC_WRNTY_INTRNL_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public, warranty and internal service orders for the 6th fiscal month of September.',
    VLU_7_ORDR_PBLC_WRNTY_INTRNL_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public, warranty and internal service orders for the 7th fiscal month of October.',
    VLU_8_ORDR_PBLC_WRNTY_INTRNL_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public, warranty and internal service orders for the 8th fiscal month of November.',
    VLU_9_ORDR_PBLC_WRNTY_INTRNL_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public, warranty and internal service orders for the 9th fiscal month of December.',
    VLU_10_ORDR_PBLC_WRNTY_INTRNL_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public, warranty and internal service orders for the 10th fiscal month of January.',
    VLU_11_ORDR_PBLC_WRNTY_INTRNL_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public, warranty and internal service orders for the 11th fiscal month of February.',
    VLU_12_ORDR_PBLC_WRNTY_INTRNL_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public, warranty and internal service orders for the 12th fiscal month of March.',
    VLU_1_ORDR_PBLC_WRNTY_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public and warranty service orders for the 1st fiscal month of April.',
    VLU_2_ORDR_PBLC_WRNTY_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public and warranty service orders for the 2nd fiscal month of May',
    VLU_3_ORDR_PBLC_WRNTY_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public and warranty service orders for the 3rd fiscal month of Jun.',
    VLU_4_ORDR_PBLC_WRNTY_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public and warranty service orders for the 4th fiscal month of July.',
    VLU_5_ORDR_PBLC_WRNTY_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public and warranty service orders for the 5th fiscal month of August.',
    VLU_6_ORDR_PBLC_WRNTY_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public and warranty service orders for the 6th fiscal month of September.',
    VLU_7_ORDR_PBLC_WRNTY_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public and warranty service orders for the 7th fiscal month of October.',
    VLU_8_ORDR_PBLC_WRNTY_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public and warranty service orders for the 8th fiscal month of November.',
    VLU_9_ORDR_PBLC_WRNTY_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for publicand warranty service orders for the 9th fiscal month of December.',
    VLU_10_ORDR_PBLC_WRNTY_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public and warranty service orders for the 10th fiscal month of January.',
    VLU_11_ORDR_PBLC_WRNTY_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public and warranty service orders for the 11th fiscal month of February.',
    VLU_12_ORDR_PBLC_WRNTY_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly objective for public and warranty service orders for the 12th fiscal month of March.',    
    HASHKEY STRING COMMENT 'Corresponds to the unique identifier of the table.',
    AUDIT_LOADED_DATE TIMESTAMP COMMENT 'Corresponds to the date when the data was loaded into the system for auditing purposes.'
)
COMMENT='Contains monthly service orders and related activities.';

-- Tabla: SVC_MNTHLY_ORDR_2_SG
CREATE OR REPLACE TABLE NMX_NMTS1.SVC_MNTHLY_ORDR_2_SG (
    SVC_MNTHLY_ORDR_KY STRING COMMENT 'Corresponds to the unique identifier of the table.',
    CLNDR_DT NUMBER COMMENT 'Date in format yyyymmdd that corresponds to the month of the objective',
    DLR_KY NUMBER COMMENT 'A unique system-generated numeric value that identifies a specific dealer dimension row.',
    DLR_CD VARCHAR(4) COMMENT 'Natural code that identifies dealer',
    SVC_ORDR_PBLC_WRNTY_INTRNL_QT NUMBER(12,2) COMMENT 'Number of units covered internally under the public warranty in a service order.',
    SVC_ORDR_PBLC_WRNTY_QT NUMBER(12,2) COMMENT 'Total number of units covered by the public warranty in a service order.',
    ADT_LOD_DT TIMESTAMP COMMENT 'Corresponds to the date when the data was loaded into the system for auditing purposes.',   
    CRTE_USR_ID VARCHAR(50) COMMENT 'Unique value of person, program module, or service that initially created this row or record in this table.',
    UPDT_USR_ID VARCHAR(50) COMMENT 'Unique value of person, program module, or service that modified this row or record in this table.',
    CRTE_TS TIMESTAMP COMMENT 'Date and time when this row or record was inserted into this table.',
    UPDT_TS TIMESTAMP COMMENT 'Date and time when this row or record was last updated or modified in this table.'
)
COMMENT='Contains monthly service orders and related activities.';

-- Tabla: OPRTNY_BSNS_DVLPMT_CTR_MNTHLY_OBJCTV_SG
CREATE OR REPLACE TABLE NMX_MTS1_STG.OPRTNY_BSNS_DVLPMT_CTR_MNTHLY_OBJCTV_SG (
    FSCL_YR_NB NUMBER COMMENT 'Fiscal Year Number',
    DLR_CD VARCHAR(4) COMMENT 'Natural code that identifies dealer',
    DLR_NM VARCHAR(150) COMMENT 'Dealers Name',
    VLU_1_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly BDC (Business Development Center) opportunity Objective for the 1st fiscal month of April.',
    VLU_2_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly BDC (Business Development Center) opportunity Objective for the 2nd fiscal month of May.',
    VLU_3_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly BDC (Business Development Center) opportunity Objective for the 3rd fiscal month of June.',
    VLU_4_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly BDC (Business Development Center) opportunity Objective for the 4th fiscal month of July.',
    VLU_5_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly BDC (Business Development Center) opportunity Objective for the 5th fiscal month of August.',
    VLU_6_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly BDC (Business Development Center) opportunity Objective for the 6th fiscal month of September.',
    VLU_7_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly BDC (Business Development Center) opportunity Objective for the 7th fiscal month of October.',
    VLU_8_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly BDC (Business Development Center) opportunity Objective for the 8th fiscal month of November.',
    VLU_9_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly BDC (Business Development Center) opportunity Objective for the 9th fiscal month of December.',
    VLU_10_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly BDC (Business Development Center) opportunity Objective for the 10th fiscal month of January.',
    VLU_11_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly BDC (Business Development Center) opportunity Objective for the 11th fiscal month of February.',
    VLU_12_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly BDC (Business Development Center) opportunity Objective for the 12th fiscal month of March.',
    HASHKEY STRING COMMENT 'Corresponds to the unique identifier of the table.',
    AUDIT_LOADED_DATE TIMESTAMP COMMENT 'Corresponds to the date when the data was loaded into the system for auditing purposes.'
)
COMMENT='Contains monthly objectives for business development opportunities.';

-- Tabla: OPRTNY_BSNS_DVLPMT_CTR_MNTHLY_OBJCTV_2_SG
CREATE OR REPLACE TABLE NMX_NMTS1.OPRTNY_BSNS_DVLPMT_CTR_MNTHLY_OBJCTV_2_SG (
    OPRTNY_BSNS_DVLPMT_CTR_MNTHLY_OBJCTV_KY STRING COMMENT 'Corresponds to the unique identifier of the table.',
    CLNDR_DT NUMBER COMMENT 'Date in format yyyymmdd that corresponds to the month of the objective',
    DLR_KY NUMBER COMMENT 'A unique system-generated numeric value that identifies a specific dealer dimension row.',
    DLR_CD VARCHAR(4) COMMENT 'Natural code that identifies dealer',
    OPRTNY_BSNS_DVLPMT_CTR_OBJCTV_QT NUMBER(12,2) COMMENT 'The target number of opportunities to be generated or developed within the Business Development Center during a specified period.',
    ADT_LOD_DT TIMESTAMP COMMENT 'Corresponds to the date when the data was loaded into the system for auditing purposes.',   
    CRTE_USR_ID VARCHAR(50) COMMENT 'Unique value of person, program module, or service that initially created this row or record in this table.',
    UPDT_USR_ID VARCHAR(50) COMMENT 'Unique value of person, program module, or service that modified this row or record in this table.',
    CRTE_TS TIMESTAMP COMMENT 'Date and time when this row or record was inserted into this table.',
    UPDT_TS TIMESTAMP COMMENT 'Date and time when this row or record was last updated or modified in this table.'
)
COMMENT='Contains monthly objectives for business development opportunities.';

-- Tabla: SLS_POWN_MNTHLY_OBJCTV_SG
CREATE OR REPLACE TABLE NMX_MTS1_STG.SLS_POWN_MNTHLY_OBJCTV_SG (
    FSCL_YR_NB NUMBER COMMENT 'Fiscal Year Number',
    DLR_CD VARCHAR(4) COMMENT 'Natural code that identifies dealer',
    DLR_NM VARCHAR(150) COMMENT 'Dealers Name',
    VLU_1_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly preowned sales Objective for the 1st fiscal month of April.',
    VLU_2_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly preowned sales Objective for the 2nd fiscal month of May.',
    VLU_3_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly preowned sales Objective for the 3rd fiscal month of June.',
    VLU_4_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly preowned sales Objective for the 4th fiscal month of July.',
    VLU_5_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly preowned sales Objective for the 5th fiscal month of August.',
    VLU_6_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly preowned sales Objective for the 6th fiscal month of September.',
    VLU_7_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly preowned sales Objective for the 7th fiscal month of October.',
    VLU_8_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly preowned sales Objective for the 8th fiscal month of November.',
    VLU_9_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly preowned sales Objective for the 9th fiscal month of December.',
    VLU_10_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly preowned sales Objective for the 10th fiscal month of January.',
    VLU_11_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly preowned sales Objective for the 11th fiscal month of February.',
    VLU_12_NB NUMBER(12,2) COMMENT 'Corresponds to the monthly preowned sales Objective for the 12th fiscal month of March.',
    HASHKEY STRING COMMENT 'Corresponds to the unique identifier of the table.',
    AUDIT_LOADED_DATE TIMESTAMP COMMENT 'Corresponds to the date when the data was loaded into the system for auditing purposes.'
)
COMMENT='Contains sales targets for preowned vehicles or products.';

-- Tabla: SLS_POWN_MNTHLY_OBJCTV_2_SG
CREATE OR REPLACE TABLE NMX_NMTS1.SLS_POWN_MNTHLY_OBJCTV_2_SG (
    SLS_POWN_MNTHLY_OBJCTV_KY STRING COMMENT 'Corresponds to the unique identifier of the table.', 
    CLNDR_DT NUMBER COMMENT 'Date in format yyyymmdd that corresponds to the month of the objective',
    DLR_KY NUMBER COMMENT 'A unique system-generated numeric value that identifies a specific dealer dimension row.',
    DLR_CD VARCHAR(4) COMMENT 'Natural code that identifies dealer',
    SLS_POWN_OBJCTV_QT NUMBER(12,2) COMMENT 'The target number of preowned (used) units to be sold within a specified period.',
    ADT_LOD_DT TIMESTAMP COMMENT 'Corresponds to the date when the data was loaded into the system for auditing purposes.',   
    CRTE_USR_ID VARCHAR(50) COMMENT 'Unique value of person, program module, or service that initially created this row or record in this table.',
    UPDT_USR_ID VARCHAR(50) COMMENT 'Unique value of person, program module, or service that modified this row or record in this table.',
    CRTE_TS TIMESTAMP COMMENT 'Date and time when this row or record was inserted into this table.',
    UPDT_TS TIMESTAMP COMMENT 'Date and time when this row or record was last updated or modified in this table.'
)
COMMENT='Contains sales targets for preowned vehicles or products.';

-- Tabla: BSNS_ARA_RQRD_PRSN_SG
CREATE OR REPLACE TABLE NMX_MTS1_STG.BSNS_ARA_RQRD_PRSN_SG (
    NEW_PSTN_DS VARCHAR(150) COMMENT 'Name of the position within the organizational structure',
    PSTN_TYP_DS VARCHAR(50) COMMENT 'Business area to which the position belongs',
    STOR_SIZE_DS VARCHAR(50) COMMENT 'Store size by business area',
    MNM_RQRD_STF_NB NUMBER COMMENT 'Minimum number of people required according to the size of the business area.',
    HASHKEY STRING COMMENT 'Corresponds to the unique identifier of the table.',
    AUDIT_LOADED_DATE TIMESTAMP COMMENT 'Corresponds to the date when the data was loaded into the system for auditing purposes.'
)
COMMENT='Contains required personnel data for different business areas.';

-- Tabla: BSNS_ARA_RQRD_PRSN_2_SG
CREATE OR REPLACE TABLE NMX_NMTS1.BSNS_ARA_RQRD_PRSN_2_SG (
    BSNS_ARA_RQRD_PRSN_KY STRING COMMENT 'A unique identifier for the required personnel assigned to a specific business area.',
    NEW_PSTN_DS VARCHAR(150) COMMENT 'Name of the position within the organizational structure',
    PSTN_TYP_DS VARCHAR(50) COMMENT 'Business area to which the position belongs',
    STOR_SIZE_DS VARCHAR(50) COMMENT 'Store size by business area',
    MNM_RQRD_STF_NB NUMBER COMMENT 'Minimum number of people required according to the size of the business area.',
    ADT_LOD_DT TIMESTAMP COMMENT 'Corresponds to the date when the data was loaded into the system for auditing purposes.',   
    CRTE_USR_ID VARCHAR(50) COMMENT 'Unique value of person, program module, or service that initially created this row or record in this table.',
    UPDT_USR_ID VARCHAR(50) COMMENT 'Unique value of person, program module, or service that modified this row or record in this table.',
    CRTE_TS TIMESTAMP COMMENT 'Date and time when this row or record was inserted into this table.',
    UPDT_TS TIMESTAMP COMMENT 'Date and time when this row or record was last updated or modified in this table.'
)
COMMENT='Contains required personnel data for different business areas.';