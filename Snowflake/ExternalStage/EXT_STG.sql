CREATE OR REPLACE STAGE NMEX_MAP_EXT_STG
URL = 's3://nissan-nna-nmex-dev-dms-us-east-1'
STORAGE_INTEGRATION = MTS1_STR_S3_BD_DMS_INT_DEV;
