CREATE OR REPLACE TABLE JDP_SERVICIO_1M (
YR_NB NUMBER AS FSCL_YR_NB,  
MNTH_NB NUMBER AS FSCL_MNTH_NB,  
SAMPLE_ID NUMBER AS SAMPL_ID,  
SURVEY_ID NUMBER AS SRVY_ID,  
TYPE VARCHAR(150) AS TYP_SL_DS,  
DELIVERY_CHANNEL VARCHAR(150) AS DLVRY_CHNL_DS,  
STATUS VARCHAR(150) AS STS_DS,  
PROCESSING_DATE NUMBER AS PRCSNG_DT,  
JD_POWER_SURVEY_DATE NUMBER AS JD_PWR_SRVY_DT,  
ADVISOR_ID VARCHAR(55) AS ADVSR_NM,  
ZONE VARCHAR(55) AS DLR_ZN_NM,  
GROUP VARCHAR(55) AS DLR_GRP_NM,  
CSA VARCHAR(55) AS CSA_NM,  
STATE VARCHAR(55) AS ST_NM,  
MATRIX_KEY VARCHAR(55) AS MTRX_CD,  
DISTRIBUTOR_KEY VARCHAR(55) AS DLR_CD,  
DISTRIBUTOR_NAME VARCHAR(150) AS DLR_NM,  
INTERBRANDS VARCHAR(150) AS INTERBRAND_DS,  
BIG_GROUPS VARCHAR(150) AS BIG_GRP_DS,  
CSI VARCHAR(150) AS CSI_DS,  
AS_ROM VARCHAR(55) AS ROM_NM,  
FOM VARCHAR(55) AS FOM_NM,  
NISSAN_MODEL VARCHAR(150) AS NSN_MDL_DS,  
S2_VEHICLE_DELIVERED VARCHAR(2) AS S2_VHCL_DLVRD_DS,  
S3_SERVICE_TYPE VARCHAR(150) AS S3_SVC_TYP_DS,  
NPS1_RECOMMENDATION NUMBER AS NPS1_RCMDTN_NB,  
NPS2_RATING_REASONS NUMBER AS NPS2_RTG_RSN_NB,  
SI0_HOW_SERVICE_APPOINTMENT_WAS_SCHEDULED VARCHAR(150) AS SI0_HOW_SVC_APNTMT_WAS_SCHDLD_DS,  
SI1_A_EASE_OF_SERVICE_APPOINTMENT_SCHEDULING NUMBER AS SI1_A_EASE_OF_SVC_APNTMT_SCHDLG_NB,  
SI1_B_SPEED_OF_VEHICLE_RECEIPT NUMBER AS SI1_B_SPD_OF_VHCL_RCPT_NB,  
SI1_C_OVERALL_SERVICE_INITIATION_PROCESS_RATING NUMBER AS SI1_C_OVRL_SVC_INITIATION_PRCS_RTG_NB,  
SA1_A_FOCUS_ON_YOU_AND_YOUR_NEEDS VARCHAR(2) AS SA1_A_FCS_ON_YOU_AND_YOUR_NEED_DS,  
SA1_B_PROVIDED_USEFUL_GUIDANCE_ABOUT_YOUR_VEHICLE VARCHAR(2) AS SA1_B_PROVIDED_USEFUL_GDNC_ABOUT_YOUR_VHCL_DS,  
SA1_C_KEPT_YOU_INFORMED_ABOUT_YOUR_VEHICLE_STATUS VARCHAR(2) AS SA1_C_KPT_YOU_INFORMED_ABOUT_YOUR_VHCL_STS_DS,  
SA1_D_USED_TABLET_OR_MOBILE_DEVICE VARCHAR(2) AS SA1_D_USD_TBLT_OR_MBL_DVC_DS,  
SA2_SERVICE_ADVISOR_REVIEWED_WORK_WITH_YOU VARCHAR(150) AS SA2_SVC_ADVSR_RVW_WRK_WITH_YOU_DS,  
SA3_A_SERVICE_ADVISOR_FRIENDLINESS NUMBER AS SA3_A_SVC_ADVSR_FRIENDLINESS_NB,  
SA3_B_SERVICE_ADVISOR_KNOWLEDGE NUMBER AS SA3_B_SVC_ADVSR_KNWLDG_NB,  
SA3_C_TRUST_IN_THE_ATTENDING_STAFF NUMBER AS SA3_C_TRST_IN_THE_ATND_STF_NB,  
SA3_D_OVERALL_SERVICE_ADVISOR_RATING NUMBER AS SA3_D_OVRL_SVC_ADVSR_RTG_NB,  
SF1_A_EASE_OF_ACCESS_AND_EXIT_FROM_SERVICE_CENTER NUMBER AS SF1_A_EASE_OF_ACS_AND_EXT_FRM_SVC_CTR_NB,  
SF1_B_SERVICE_CENTER_CLEANLINESS NUMBER AS SF1_B_SVC_CTR_CLEANLINESS_NB,  
SF1_C_COMFORT_AND_COURTESIES NUMBER AS SF1_C_COMFORT_AND_CRTSY_NB,  
SF1_D_OVERALL_FACILITY_RATING NUMBER AS SF1_D_OVRL_FCLTY_RTG_NB,  
VD1_SOMEONE_FROM_DEALER_CONTACTED_YOU_WHEN_VEHICLE_WAS_READY VARCHAR(2) AS VD1_SOMEONE_FRM_DLR_CNTCTD_YOU_WHN_VHCL_WAS_RDY_DS,  
VD2_VEHICLE_READY_AS_PROMISED VARCHAR(150) AS VD2_VHCL_RDY_AS_PRMSE_DS,  
VD3_DETAILED_COST_ESTIMATE_PROVIDED VARCHAR(2) AS VD3_DTL_CST_ESTMT_PROVIDED_DS,  
VD4_FINAL_AMOUNT_PAID VARCHAR(150) AS VD4_FNL_AM_PD_DS,  
VD5_COST_EXPLANATION_AFTER_SERVICE_COMPLETION VARCHAR(150) AS VD5_CST_EXPLTN_AFTR_SVC_CMPLTN_DS,  
VD6_A_TIME_REQUIRED_TO_COMPLETE_PAPERWORK_AND_PICKUP VARCHAR(150) AS VD6_A_TM_RQRD_TO_CMPLT_PPRWORK_AND_PKUP_DS,  
VD6_B_TIME_FROM_ADVISOR_ARRIVAL_TO_FINAL_DELIVERY VARCHAR(150) AS VD6_B_TM_FRM_ADVSR_ARVL_TO_FNL_DLVRY_DS,  
VD7_A_SPEED_OF_DELIVERY_PROCESS NUMBER AS VD7_A_SPD_OF_DLVRY_PRCS_NB,  
VD7_C_FAIRNESS_OF_CHARGE NUMBER AS VD7_C_FAIRNESS_OF_CHRG_NB,  
VD7_B_OVERALL_DELIVERY_PROCESS_RATING NUMBER AS VD7_B_OVRL_DLVRY_PRCS_RTG_NB,  
SQ1_WORK_COMPLETED_RIGHT_FIRST_TIME VARCHAR(2) AS SQ1_WRK_CMPLTD_RGHT_1ST_TM_DS,  
SQ1A_REASON_WORK_NOT_COMPLETED_FIRST_TIME VARCHAR(1500) AS SQ1A_RSN_WRK_NOT_CMPLTD_1ST_TM_DS,  
SQ2_REASON_WORK_NOT_COMPLETED_FIRST_TIME VARCHAR(150) AS SQ2_RSN_WRK_NOT_CMPLTD_1ST_TM_DS,  
SQ2_OTHER_SPECIFY VARCHAR(150) AS SQ2_OTHR_SPCFY_DS,  
SQ3_VEHICLE_ADJUSTMENTS_REMAINED_THE_SAME VARCHAR(2) AS SQ3_VHCL_ADJSMT_RMN_THE_SM_DS,  
SQ4_A_TOTAL_TIME_REQUIRED_TO_COMPLETE_SERVICE NUMBER AS SQ4_A_TOTL_TM_RQRD_TO_CMPLT_SVC_NB,  
SQ4_B_VEHICLE_CLEANLINESS_AND_CONDITION_AT_DELIVERY NUMBER AS SQ4_B_VHCL_CLEANLINESS_AND_CNDTN_AT_DLVRY_NB,  
SQ4_C_OVERALL_SERVICE_QUALITY_RATING NUMBER AS SQ4_C_OVRL_SVC_QLTY_RTG_NB,  
SE1_OVERALL_SERVICE_EXPERIENCE NUMBER AS SE1_OVRL_SVC_EXPRNC_NB,  
SE2_SERVICE_EXPERIENCE_COMMENTS VARCHAR(150) AS SE2_SVC_EXPRNC_CMNT_DS,  
SE3_OVERALL_OPINION_OF_NISSAN_AS_A_BRAND NUMBER AS SE3_OVRL_OPIN_OF_NSN_AS_A_BRND_NB,  
SATISFACTION_INDEX NUMBER AS STSFCN_INDX_NB,  
SERVICE_INITIATION NUMBER AS SVC_INITIATION_NB,  
DEALER_STAFF NUMBER AS DLR_STF_NB,  
FACILITIES NUMBER AS FCLTS_NB,  
DELIVERY NUMBER AS DLVRY_NB,  
QUALITY NUMBER AS QLTY_NB,  
HashKey STRING,
audit_loaded_date TIMESTAMP
);

GRANT SELECT, INSERT, UPDATE, REFERENCES ON SDDBMTS1.NMX_MTS1_STG.JDP_SERVICIO_1M TO ROLE "ENTER ROLE"_$(ENV);