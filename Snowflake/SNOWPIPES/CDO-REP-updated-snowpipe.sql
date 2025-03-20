CREATE OR REPLACE PIPE NMX_MTS1_STG.SLS_OF_EFCNCY_SG_PIPE 
AUTO_INGEST = TRUE
AS
COPY INTO NMX_MTS1_STG.SLS_OF_EFCNCY_SG (
    FSCL_YR_NB,
    DLR_NM,
    DLR_CD,
    VLU_1_NB,
    VLU_2_NB,
    VLU_3_NB,
    VLU_4_NB,
    VLU_5_NB,
    VLU_6_NB,
    VLU_7_NB,
    VLU_8_NB,
    VLU_9_NB,
    VLU_10_NB,
    VLU_11_NB,
    VLU_12_NB,
    HASHKEY,
    AUDIT_LOADED_DATE
)
FROM (
    SELECT
        $1::NUMBER AS FSCL_YR_NB,
        $3::VARCHAR(150) AS DLR_NM, -- dstrbr in the CSV
        $2::VARCHAR(4) AS DLR_CD,  -- dlr_cd in the CSV
        $5::NUMBER(12,6) AS VLU_1_NB,  -- april_orders_pub_gar_int
        $6::NUMBER(12,6) AS VLU_2_NB,  -- may_orders_pub_gar_int
        $7::NUMBER(12,6) AS VLU_3_NB,  -- june_orders_pub_gar_int
        $8::NUMBER(12,6) AS VLU_4_NB,  -- july_orders_pub_gar_int
        $9::NUMBER(12,6) AS VLU_5_NB,  -- august_orders_pub_gar_int
        $10::NUMBER(12,6) AS VLU_6_NB, -- september_orders_pub_gar_int
        $11::NUMBER(12,6) AS VLU_7_NB, -- october_orders_pub_gar_int
        $12::NUMBER(12,6) AS VLU_8_NB, -- november_orders_pub_gar_int
        $13::NUMBER(12,6) AS VLU_9_NB, -- december_orders_pub_gar_int
        $14::NUMBER(12,6) AS VLU_10_NB, -- january_orders_pub_gar_int
        $15::NUMBER(12,6) AS VLU_11_NB, -- february_orders_pub_gar_int
        $16::NUMBER(12,6) AS VLU_12_NB, -- march_orders_pub_gar_int
        $29::STRING AS HASHKEY,        -- HashKey
        $30::TIMESTAMP AS AUDIT_LOADED_DATE -- audit_loaded_date
    FROM '@NMEX_MAP_EXT_STG/validated/CDO/reproceso'
)
FILE_FORMAT = (
    TYPE = 'CSV',
    FIELD_DELIMITER = ';',
    SKIP_HEADER = 1,
    DATE_FORMAT = 'AUTO',
    TIMESTAMP_FORMAT = 'AUTO',
    NULL_IF = ('NULL', '','NaN','nan','NAN'),
    TRIM_SPACE = TRUE
)
ON_ERROR = 'CONTINUE';
