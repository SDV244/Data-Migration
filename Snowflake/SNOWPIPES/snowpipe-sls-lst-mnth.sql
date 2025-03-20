CREATE OR REPLACE PIPE SDDBMTS1.NMX_MTS1_STG.JDP_ASMNT_SLS_LST_MNTH_SG_PIPE
AUTO_INGEST = TRUE
AS
COPY INTO SDDBMTS1.NMX_MTS1_STG.JDP_ASMNT_SLS_LST_MNTH_SG (
    FSCL_YR_NB,
    FSCL_MNTH_NB,
    SAMPL_ID,
    SRVY_ID,
    TYP_SLS_DS,
    DLVRY_CHNL_DS,
    STS_DS,
    PRCSNG_DT,
    JD_PWR_SRVY_DT,
    ADVSR_NM,
    DLR_ZN_NM,
    DLR_GRP_NM,
    CSA_NM,
    ST_NM,
    MTRX_CD,
    DLR_CD,
    DLR_NM,
    INTERBRAND_DS,
    BIG_GRP_DS,
    SSI_DS,
    SLS_ROM_NM,
    DOM_NM,
    NSN_MDL_DS,
    S1_VHCL_DLVRD_DS,
    NPS1_RCMDTN_NB,
    NPS2_RTG_REASONS_NB,
    SE1_1_MDI_USD_TO_PRCHS_VHCL_DS,
    SE1_2_MDI_USD_TO_PRCHS_VHCL_DS,
    SE1_3_MDI_USD_TO_PRCHS_VHCL_DS,
    SE1_4_MDI_USD_TO_PRCHS_VHCL_DS,
    SE2_ONLN_SRCH_MADE_VST_MORE_EFCNT_DS,
    SE3_1_ACTVTY_PRFRMD_IN_DGTL_CHNL_DS,
    SE3_2_ACTVTY_PRFRMD_IN_DGTL_CHANNELS_DS,
    SE3_3_ACTVTY_PRFRMD_IN_DGTL_CHANNELS_DS,
    SE3_4_ACTVTY_PRFRMD_IN_DGTL_CHANNELS_DS,
    SE3_5_ACTVTY_PRFRMD_IN_DGTL_CHANNELS_DS,
    SE3_6_ACTVTY_PRFRMD_IN_DGTL_CHANNELS_DS,
    SE3_7_ACTVTY_PRFRMD_IN_DGTL_CHANNELS_DS,
    SE3_8_ACTVTY_PRFRMD_IN_DGTL_CHANNELS_DS,
    SE3_9_ACTVTY_PRFRMD_IN_DGTL_CHANNELS_DS,
    SE3_10_ACTVTY_PRFRMD_IN_DGTL_CHANNELS_DS,
    SE3_10_OTHR_DS,
    SE4_EASY_TO_CNTCT_AND_SCHDL_VST_THRGH_DGTL_MDI_DS,
    SE5_A_EASY_TO_FIND_INFRMN_NEEDED_DS,
    SE5_B_WBST_OPTNS_FACILITATE_PRCHS_PRCS_DS,
    SE5_C_WBST_DSGN_IS_ATTRACTIVE_DS,
    SE5_D_ONLN_RQST_RESPONDED_QUICKLY_BY_DLR_DS,
    BW1_GNRL_WBST_EXPRNC_NB,
    F1_A_FCLTY_APRNC_NB,
    F1_B_OVRL_FCLTY_RTG_NB,
    SP1_TM_UNTIL_GREETING_DS,
    SP2_SLS_STF_PROACTV_UPDTD_YOU_DS,
    SP3_EFCNCY_IN_TBLT_OR_MBL_USE_DS,
    SP3A_TBLT_OR_MBL_USE_ENHNCD_PRCHS_EXPRNC_DS,
    SP4_SLS_STF_UNDERSTOOD_YOUR_NEEDS_DS,
    SP5_TST_DRV_CONDUCTED_DS,
    VOC3_OFFERED_TST_DRV_DS,
    SP5A_MDL_USD_FOR_TST_DRV_DS,
    SP5A_14_OTHR_DS,
    SP5BA_EASY_TO_SCHDL_TST_DRV_AT_CONVENIENT_TM_DS,
    SP5BB_ALL_NEED_AND_QSTN_WERE_RSLVD_DS,
    SP5BC_TST_DRV_DRTN_WAS_APPROPRIATE_DS,
    SP6_TST_DRV_EVLTN_DS,
    VOC4_TST_DRV_STSFCN_NB,
    SP8_A_SLS_STF_ALWYS_MADE_ME_A_PRITY_DS,
    SP8_B_SLS_STF_SHOWED_EFCNCY_IN_EVRY_PRCS_DS,
    SP7_A_SLS_STF_FRIENDLINESS_NB,
    SP7_B_SLS_STF_TRANSPARENCY_NB,
    SP7_F_VHCL_KNWLDG_NB,
    SP7_G_FNCL_PRDT_KNWLDG_NB,
    SP7_H_SVC_PRCS_KNWLDG_NB,
    SP7_C_EFCTV_CMNCTN_OUTSD_DLRSHP_NB,
    SP7_D_SLS_STF_EXPLTN_AND_GDNC_NB,
    SP7_E_OVRL_SLS_STF_RTG_NB,
    WD2_A_FELT_PRSUR_FRM_SLS_STF_DS,
    WD2_B_PRC_SEEMED_FAIR_DS,
    WD2_C_PRC_ANSWR_CLRTY_DS,
    WD2_D_PRC_PRMSE_CHNG_DS,
    WD2_E_SLS_PRSUR_ADTNL_PRDT_DS,
    WD1_A_FNL_PRC_AGRMT_NB,
    WD1_B_NGTN_LCTN_COMFORT_NB,
    WD1_C_QTN_FNCG_CLRTY_NB,
    WD1_D_NGTN_FNCG_RTG_NB,
    PC1_PPRWRK_CMPLTN_TM_NB,
    PC2_A_DCMNT_CLRTY_TRANSPARENCY_NB,
    PC2_B_PPRWRK_CMPLTN_SPD_NB,
    PC2_C_PPRWRK_RTG_NB,
    DP1_VHCL_DLVRY_TM_DS,
    DP1A_DLVRY_TM_EXPECTATION_DS,
    DP1B_DLR_TM_DURING_DLVRY_DS,
    DP3_A_1ST_SVC_APNTMT_DS,
    DP3_B_MNTNC_SCHDL_RVW_DS,
    DP3_C_SVC_OVERVIEW_DS,
    DP3_D_NSN_CONNECT_EXPLTN_DS,
    DP3_E_BLUETOOTH_CNCTN_EXPLTN_DS,
    DP3_F_VHCL_FEATR_EXPLTN_DS,
    DP3_G_FLW_UP_APNTMT_DS,
    DP3A_1_VHCL_DLVRY_CNDTN_DS,
    DP3A_2_VHCL_DLVRY_CNDTN_DS,
    DP3A_3_VHCL_DLVRY_CNDTN_DS,
    DP3A_4_VHCL_DLVRY_CNDTN_DS,
    DP4_A_EFCTVNS_IN_EXPLAINING_NSN_SFTY_NB,
    DP4_B_TM_DEDICATED_TO_VHCL_DLVRY_NB,
    DP4_C_VHCL_CNDTN_AT_DLVRY_TM_NB,
    DP4_D_OVRL_VHCL_DLVRY_PRCS_RTG_NB,
    SU3_TM_TAKN_FOR_PRCHS_PRCS_DS,
    SU4_PRCHS_PRCS_WAS_CLER_AND_SIMPL_DS,
    SU1_OVRL_PRCHS_EXPRNC_NB,
    SU2_CMNT_ON_PRCHS_EXPRNC_DS,
    BE1_MN_FCTR_IN_CHOOSE_YOUR_NSN_DS,
    BE2_LKLIHD_OF_TRST_NSN_AS_A_BRND_NB,
    BE3_MOST_EXCITING_STG_OF_THE_PRCS_DS,
    BE3_7_OTHR_DS,
    BE4_OVRL_OPIN_OF_NSN_AS_A_BRND_NB,
    STSFCN_INDX_NB,
    WBST_NB,
    FCLTS_NB,
    SLS_STF_NB,
    NGTN_PRCS_NB,
    PPRWRK_NB,
    DLVRY_NB,
    HASHKEY,
    AUDIT_LOADED_DATE
) FROM (
    SELECT
        $1::FLOAT AS FSCL_YR_NB,
        $2::FLOAT AS FSCL_MNTH_NB,
        $3::VARCHAR(250) AS SAMPL_ID,
        $4::VARCHAR(250) AS SRVY_ID,
        $5::VARCHAR(250) AS TYP_SLS_DS,
        $6::VARCHAR(250) AS DLVRY_CHNL_DS,
        $7::VARCHAR(250) AS STS_DS,
        $8::DATE AS PRCSNG_DT,
        $9::DATE AS JD_PWR_SRVY_DT,
        $10::VARCHAR(100) AS ADVSR_NM,
        $11::VARCHAR(250) AS DLR_ZN_NM,
        $12::VARCHAR(250) AS DLR_GRP_NM,
        $13::VARCHAR(250) AS CSA_NM,
        $14::VARCHAR(250) AS ST_NM,
        $15::VARCHAR(250) AS MTRX_CD,
        $16::VARCHAR(250) AS DLR_CD,
        $17::VARCHAR(250) AS DLR_NM,
        $18::VARCHAR(250) AS INTERBRAND_DS,
        $19::VARCHAR(250) AS BIG_GRP_DS,
        $20::VARCHAR(250) AS SSI_DS,
        $21::VARCHAR(250) AS SLS_ROM_NM,
        $22::VARCHAR(250) AS DOM_NM,
        $23::VARCHAR(250) AS NSN_MDL_DS,
        $24::VARCHAR(250) AS S1_VHCL_DLVRD_DS,
        $25::FLOAT AS NPS1_RCMDTN_NB,
        $26::FLOAT AS NPS2_RTG_REASONS_NB,
        $27::VARCHAR(250) AS SE1_1_MDI_USD_TO_PRCHS_VHCL_DS,
        $28::VARCHAR(250) AS SE1_2_MDI_USD_TO_PRCHS_VHCL_DS,
        $29::VARCHAR(250) AS SE1_3_MDI_USD_TO_PRCHS_VHCL_DS,
        $30::VARCHAR(250) AS SE1_4_MDI_USD_TO_PRCHS_VHCL_DS,
        $31::VARCHAR(250) AS SE2_ONLN_SRCH_MADE_VST_MORE_EFCNT_DS,
        $32::VARCHAR(250) AS SE3_1_ACTVTY_PRFRMD_IN_DGTL_CHNL_DS,
        $33::VARCHAR(250) AS SE3_2_ACTVTY_PRFRMD_IN_DGTL_CHANNELS_DS,
        $34::VARCHAR(250) AS SE3_3_ACTVTY_PRFRMD_IN_DGTL_CHANNELS_DS,
        $35::VARCHAR(250) AS SE3_4_ACTVTY_PRFRMD_IN_DGTL_CHANNELS_DS,
        $36::VARCHAR(250) AS SE3_5_ACTVTY_PRFRMD_IN_DGTL_CHANNELS_DS,
        $37::VARCHAR(250) AS SE3_6_ACTVTY_PRFRMD_IN_DGTL_CHANNELS_DS,
        $38::VARCHAR(250) AS SE3_7_ACTVTY_PRFRMD_IN_DGTL_CHANNELS_DS,
        $39::VARCHAR(250) AS SE3_8_ACTVTY_PRFRMD_IN_DGTL_CHANNELS_DS,
        $40::VARCHAR(250) AS SE3_9_ACTVTY_PRFRMD_IN_DGTL_CHANNELS_DS,
        $41::VARCHAR(250) AS SE3_10_ACTVTY_PRFRMD_IN_DGTL_CHANNELS_DS,
        $42::VARCHAR(200) AS SE3_10_OTHR_DS,
        $43::VARCHAR(250) AS SE4_EASY_TO_CNTCT_AND_SCHDL_VST_THRGH_DGTL_MDI_DS,
        $44::VARCHAR(250) AS SE5_A_EASY_TO_FIND_INFRMN_NEEDED_DS,
        $45::VARCHAR(250) AS SE5_B_WBST_OPTNS_FACILITATE_PRCHS_PRCS_DS,
        $46::VARCHAR(250) AS SE5_C_WBST_DSGN_IS_ATTRACTIVE_DS,
        $47::VARCHAR(250) AS SE5_D_ONLN_RQST_RESPONDED_QUICKLY_BY_DLR_DS,
        $48::FLOAT AS BW1_GNRL_WBST_EXPRNC_NB,
        $49::FLOAT AS F1_A_FCLTY_APRNC_NB,
        $50::FLOAT AS F1_B_OVRL_FCLTY_RTG_NB,
        $51::VARCHAR(250) AS SP1_TM_UNTIL_GREETING_DS,
        $52::VARCHAR(250) AS SP2_SLS_STF_PROACTV_UPDTD_YOU_DS,
        $53::VARCHAR(250) AS SP3_EFCNCY_IN_TBLT_OR_MBL_USE_DS,
        $54::VARCHAR(250) AS SP3A_TBLT_OR_MBL_USE_ENHNCD_PRCHS_EXPRNC_DS,
        $55::VARCHAR(250) AS SP4_SLS_STF_UNDERSTOOD_YOUR_NEEDS_DS,
        $56::VARCHAR(250) AS SP5_TST_DRV_CONDUCTED_DS,
        $57::VARCHAR(250) AS VOC3_OFFERED_TST_DRV_DS,
        $58::VARCHAR(250) AS SP5A_MDL_USD_FOR_TST_DRV_DS,
        $59::VARCHAR(250) AS SP5A_14_OTHR_DS,
        $60::VARCHAR(250) AS SP5BA_EASY_TO_SCHDL_TST_DRV_AT_CONVENIENT_TM_DS,
        $61::VARCHAR(250) AS SP5BB_ALL_NEED_AND_QSTN_WERE_RSLVD_DS,
        $62::VARCHAR(250) AS SP5BC_TST_DRV_DRTN_WAS_APPROPRIATE_DS,
        $63::VARCHAR(250) AS SP6_TST_DRV_EVLTN_DS,
        $64::FLOAT AS VOC4_TST_DRV_STSFCN_NB,
        $65::VARCHAR(250) AS SP8_A_SLS_STF_ALWYS_MADE_ME_A_PRITY_DS,
        $66::VARCHAR(250) AS SP8_B_SLS_STF_SHOWED_EFCNCY_IN_EVRY_PRCS_DS,
        $67::FLOAT AS SP7_A_SLS_STF_FRIENDLINESS_NB,
        $68::FLOAT AS SP7_B_SLS_STF_TRANSPARENCY_NB,
        $69::FLOAT AS SP7_F_VHCL_KNWLDG_NB,
        $70::FLOAT AS SP7_G_FNCL_PRDT_KNWLDG_NB,
        $71::FLOAT AS SP7_H_SVC_PRCS_KNWLDG_NB,
        $72::FLOAT AS SP7_C_EFCTV_CMNCTN_OUTSD_DLRSHP_NB,
        $73::FLOAT AS SP7_D_SLS_STF_EXPLTN_AND_GDNC_NB,
        $74::FLOAT AS SP7_E_OVRL_SLS_STF_RTG_NB,
        $75::VARCHAR(250) AS WD2_A_FELT_PRSUR_FRM_SLS_STF_DS,
        $76::VARCHAR(250) AS WD2_B_PRC_SEEMED_FAIR_DS,
        $77::VARCHAR(250) AS WD2_C_PRC_ANSWR_CLRTY_DS,
        $78::VARCHAR(250) AS WD2_D_PRC_PRMSE_CHNG_DS,
        $79::VARCHAR(250) AS WD2_E_SLS_PRSUR_ADTNL_PRDT_DS,
        $80::FLOAT AS WD1_A_FNL_PRC_AGRMT_NB,
        $81::FLOAT AS WD1_B_NGTN_LCTN_COMFORT_NB,
        $82::FLOAT AS WD1_C_QTN_FNCG_CLRTY_NB,
        $83::FLOAT AS WD1_D_NGTN_FNCG_RTG_NB,
        $84::FLOAT AS PC1_PPRWRK_CMPLTN_TM_NB,
        $85::FLOAT AS PC2_A_DCMNT_CLRTY_TRANSPARENCY_NB,
        $86::FLOAT AS PC2_B_PPRWRK_CMPLTN_SPD_NB,
        $87::FLOAT AS PC2_C_PPRWRK_RTG_NB,
        $88::VARCHAR(250) AS DP1_VHCL_DLVRY_TM_DS,
        $89::VARCHAR(250) AS DP1A_DLVRY_TM_EXPECTATION_DS,
        $90::VARCHAR(250) AS DP1B_DLR_TM_DURING_DLVRY_DS,
        $91::VARCHAR(250) AS DP3_A_1ST_SVC_APNTMT_DS,
        $92::VARCHAR(250) AS DP3_B_MNTNC_SCHDL_RVW_DS,
        $93::VARCHAR(250) AS DP3_C_SVC_OVERVIEW_DS,
        $94::VARCHAR(250) AS DP3_D_NSN_CONNECT_EXPLTN_DS,
        $95::VARCHAR(250) AS DP3_E_BLUETOOTH_CNCTN_EXPLTN_DS,
        $96::VARCHAR(250) AS DP3_F_VHCL_FEATR_EXPLTN_DS,
        $97::VARCHAR(250) AS DP3_G_FLW_UP_APNTMT_DS,
        $98::VARCHAR(250) AS DP3A_1_VHCL_DLVRY_CNDTN_DS,
        $99::VARCHAR(250) AS DP3A_2_VHCL_DLVRY_CNDTN_DS,
        $100::VARCHAR(250) AS DP3A_3_VHCL_DLVRY_CNDTN_DS,
        $101::VARCHAR(250) AS DP3A_4_VHCL_DLVRY_CNDTN_DS,
        $102::FLOAT AS DP4_A_EFCTVNS_IN_EXPLAINING_NSN_SFTY_NB,
        $103::FLOAT AS DP4_B_TM_DEDICATED_TO_VHCL_DLVRY_NB,
        $104::FLOAT AS DP4_C_VHCL_CNDTN_AT_DLVRY_TM_NB,
        $105::FLOAT AS DP4_D_OVRL_VHCL_DLVRY_PRCS_RTG_NB,
        $106::VARCHAR(250) AS SU3_TM_TAKN_FOR_PRCHS_PRCS_DS,
        $107::VARCHAR(250) AS SU4_PRCHS_PRCS_WAS_CLER_AND_SIMPL_DS,
        $108::FLOAT AS SU1_OVRL_PRCHS_EXPRNC_NB,
        $109::VARCHAR(250) AS SU2_CMNT_ON_PRCHS_EXPRNC_DS,
        $110::VARCHAR(250) AS BE1_MN_FCTR_IN_CHOOSE_YOUR_NSN_DS,
        $111::FLOAT AS BE2_LKLIHD_OF_TRST_NSN_AS_A_BRND_NB,
        $112::VARCHAR(250) AS BE3_MOST_EXCITING_STG_OF_THE_PRCS_DS,
        $113::VARCHAR(500) AS BE3_7_OTHR_DS,
        $114::FLOAT AS BE4_OVRL_OPIN_OF_NSN_AS_A_BRND_NB,
        $115::FLOAT AS STSFCN_INDX_NB,
        $116::FLOAT AS WBST_NB,
        $117::FLOAT AS FCLTS_NB,
        $118::FLOAT AS SLS_STF_NB,
        $119::FLOAT AS NGTN_PRCS_NB,
        $120::FLOAT AS PPRWRK_NB,
        $121::FLOAT AS DLVRY_NB,
        $122::VARCHAR(250) AS HASHKEY,
        $123::TIMESTAMP AS AUDIT_LOADED_DATE
    FROM '@NMEX_MAP_EXT_STG/validated/JDP/VENTA JDP 1M'
) FILE_FORMAT = (
    TYPE = 'CSV',
    FIELD_DELIMITER = ';',
    SKIP_HEADER = 1,
    DATE_FORMAT = 'AUTO',
    TIMESTAMP_FORMAT = 'AUTO',
    NULL_IF = ('NULL', '','NaN','nan','NAN'),
    TRIM_SPACE = TRUE
) ON_ERROR = 'CONTINUE';