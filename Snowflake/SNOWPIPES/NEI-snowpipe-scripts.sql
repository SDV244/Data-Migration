-- Snowpipe for RSLT_SVC_NSN_EXPRNC_INDX_SG (Service)
CREATE OR REPLACE PIPE NMX_MTS1_STG.RSLT_SVC_NSN_EXPRNC_INDX_SG_PIPE
  AUTO_INGEST = TRUE
  AS COPY INTO NMX_MTS1_STG.RSLT_SVC_NSN_EXPRNC_INDX_SG (
    FSCL_YR_NB,
    FSCL_QTR_SHRT_NM,
    DLR_CD,
    DLR_NM,
    DLR_GRP_NM,
    DLR_ZN_NM,
    RSLT_SVC_NB,
    BDC_AFTSLS_OPRTNY_3_1_1_2_FLW_UP_NO_SHOW_NB,
    BDC_AFTSLS_CNTCT_3_1_2_1_CSTMR_INFRMN_NB,
    BDC_AFTSLS_CNTCT_3_1_2_2_FLW_GDLN_NB,
    BDC_AFTSLS_APNTMT_3_1_3_1_PR_APNTMT_PREPARATION_NB,
    BDC_AFTSLS_APNTMT_3_1_3_2_RTNTN_CMPGN_NB,
    BDC_AFTSLS_APNTMT_3_1_3_3_ENSURE_MNTNC_BNFT_NB,
    BDC_AFTSLS_CNFMTN_3_1_4_1_CNFMTN_CALL_NB,
    BDC_AFTSLS_CNFMTN_3_1_4_2_PKUP_DLVRY_NB,
    EFCTV_OPP_RCPTN_3_2_1_1_WLCM_CLNT_NB,
    EFCTV_OPP_RCPTN_3_2_1_2_VHCL_ISPCTN_NB,
    EFCTV_OPP_RCPTN_3_2_1_3_LISTEN_CLNT_NEED_NB,
    EFCTV_OPP_QLTY_CMPGN_3_2_2_1_APLY_CMPGN_NB,
    EFCTV_OPP_WRK_EXPLTN_3_2_3_1_EXPLAIN_TSK_NB,
    EFCTV_OPP_WRK_EXPLTN_3_2_3_2_DLVRY_PRMSE_NB,
    SVC_WRK_PRGRS_CTRL_3_3_1_2_MNTR_PRGRS_NB,
    SVC_WRKSHOP_3_3_2_1_WRK_TM_CLNT_CNTCT_NB,
    SVC_WRKSHOP_3_3_2_2_TOOL_IVNTRY_NB,
    SVC_WRKSHOP_3_3_2_3_TOOL_MNTNC_NB,
    SVC_WRKSHOP_3_3_2_4_TOOL_EQPMNT_NB,
    SVC_WRKSHOP_3_3_2_5_MPI_NB,
    SVC_NXT_APNTMT_3_3_3_1_SCHDL_NXT_SVC_NB,
    WASH_STNDRD_3_4_1_1_WASH_ARA_CNDTN_NB,
    WASH_STNDRD_3_4_1_2_HMN_RSRC_NB,
    WASH_STNDRD_3_4_1_3_WASH_PRCS_STG_NB,
    WASH_STNDRD_3_4_1_4_QLTY_ISPCTN_NB,
    QLTY_CTRL_ISPCTN_3_5_1_1_RSPBLY_NB,
    QLTY_CTRL_ISPCTN_3_5_1_2_PRCS_EXCTN_NB,
    QLTY_CTRL_PRGRM_F1_3_5_2_1_SLTN_RCLM_NB,
    DLVRY_FLW_UP_3_6_1_1_PREP_FOR_DLVRY_NB,
    DLVRY_FLW_UP_3_6_1_2_DLVRY_EXPLTN_NB,
    DLVRY_FLW_UP_3_6_1_3_ROAD_ASTNC_NB,
    DLVRY_FLW_UP_3_6_1_4_NXT_SVC_RMNDR_NB,
    FLW_UP_3_6_2_1_VOC_NB,
    FLW_UP_3_6_2_2_CMPLNT_TRCKNG_CAC_NB,
    EXPRS_SVC_APNTMT_3_7_1_1_OFR_CNFRM_FLW_UP_NB,
    EXPRS_SVC_RCPTN_3_7_2_1_RGSTR_INSPCT_EXPLAIN_NB,
    EXPRS_SVC_CNTL_3_7_3_1_ASGN_WRK_NB,
    EXPRS_SVC_CNTL_3_7_3_2_USE_RAMP_TOOL_NB,
    EXPRS_SVC_CMNCTN_3_7_4_1_WASHING_STF_QLTY_NB,
    EXPRS_SVC_ISPCTN_3_7_5_1_QLTY_CNTL_NB,
    EXPRS_SVC_CMNCTN_3_7_6_1_USE_POP_MTRL_NB,
    NREDI_SVC_5S_3_8_1_1_MNTNC_SVC_ARA_NB,
    NREDI_SVC_5S_3_8_1_2_MNTNC_RCPTN_NB,
    NREDI_SVC_5S_3_8_1_3_MNTNC_WRKSHOP_NB,
    NREDI_SVC_5S_3_8_1_4_MNTNC_FACADE_NB,
    NREDI_SVC_5S_3_8_2_1_SELF_EVLTN_NB,
    ORGANIZATIONAL_STRCTR_3_9_1_1_SVC_ADVSR,
    ORGANIZATIONAL_STRCTR_3_9_1_2_SVC_TCHNCN,
    ORGANIZATIONAL_STRCTR_3_9_1_3_WSHR_NB,
    ORGANIZATIONAL_STRCTR_3_9_1_4_QLTY_CNTL_NB,
    HASHKEY,
    AUDIT_LOADED_DATE
) FROM (
    SELECT
        $1::FLOAT AS FSCL_YR_NB,
        $2::FLOAT AS FSCL_QTR_SHRT_NM,
        $3::VARCHAR(250) AS DLR_CD,
        $4::VARCHAR(250) AS DLR_NM,
        $5::VARCHAR(250) AS DLR_GRP_NM,
        $6::VARCHAR(250) AS DLR_ZN_NM,
        $7::FLOAT AS RSLT_SVC_NB,
        $8::FLOAT AS BDC_AFTSLS_OPRTNY_3_1_1_2_FLW_UP_NO_SHOW_NB,
        $9::FLOAT AS BDC_AFTSLS_CNTCT_3_1_2_1_CSTMR_INFRMN_NB,
        $10::FLOAT AS BDC_AFTSLS_CNTCT_3_1_2_2_FLW_GDLN_NB,
        $11::FLOAT AS BDC_AFTSLS_APNTMT_3_1_3_1_PR_APNTMT_PREPARATION_NB,
        $12::FLOAT AS BDC_AFTSLS_APNTMT_3_1_3_2_RTNTN_CMPGN_NB,
        $13::FLOAT AS BDC_AFTSLS_APNTMT_3_1_3_3_ENSURE_MNTNC_BNFT_NB,
        $14::FLOAT AS BDC_AFTSLS_CNFMTN_3_1_4_1_CNFMTN_CALL_NB,
        $15::FLOAT AS BDC_AFTSLS_CNFMTN_3_1_4_2_PKUP_DLVRY_NB,
        $16::FLOAT AS EFCTV_OPP_RCPTN_3_2_1_1_WLCM_CLNT_NB,
        $17::FLOAT AS EFCTV_OPP_RCPTN_3_2_1_2_VHCL_ISPCTN_NB,
        $18::FLOAT AS EFCTV_OPP_RCPTN_3_2_1_3_LISTEN_CLNT_NEED_NB,
        $19::FLOAT AS EFCTV_OPP_QLTY_CMPGN_3_2_2_1_APLY_CMPGN_NB,
        $20::FLOAT AS EFCTV_OPP_WRK_EXPLTN_3_2_3_1_EXPLAIN_TSK_NB,
        $21::FLOAT AS EFCTV_OPP_WRK_EXPLTN_3_2_3_2_DLVRY_PRMSE_NB,
        $22::FLOAT AS SVC_WRK_PRGRS_CTRL_3_3_1_2_MNTR_PRGRS_NB,
        $23::FLOAT AS SVC_WRKSHOP_3_3_2_1_WRK_TM_CLNT_CNTCT_NB,
        $24::FLOAT AS SVC_WRKSHOP_3_3_2_2_TOOL_IVNTRY_NB,
        $25::FLOAT AS SVC_WRKSHOP_3_3_2_3_TOOL_MNTNC_NB,
        $26::FLOAT AS SVC_WRKSHOP_3_3_2_4_TOOL_EQPMNT_NB,
        $27::FLOAT AS SVC_WRKSHOP_3_3_2_5_MPI_NB,
        $28::FLOAT AS SVC_NXT_APNTMT_3_3_3_1_SCHDL_NXT_SVC_NB,
        $29::FLOAT AS WASH_STNDRD_3_4_1_1_WASH_ARA_CNDTN_NB,
        $30::FLOAT AS WASH_STNDRD_3_4_1_2_HMN_RSRC_NB,
        $31::FLOAT AS WASH_STNDRD_3_4_1_3_WASH_PRCS_STG_NB,
        $32::FLOAT AS WASH_STNDRD_3_4_1_4_QLTY_ISPCTN_NB,
        $33::FLOAT AS QLTY_CTRL_ISPCTN_3_5_1_1_RSPBLY_NB,
        $34::FLOAT AS QLTY_CTRL_ISPCTN_3_5_1_2_PRCS_EXCTN_NB,
        $35::FLOAT AS QLTY_CTRL_PRGRM_F1_3_5_2_1_SLTN_RCLM_NB,
        $36::FLOAT AS DLVRY_FLW_UP_3_6_1_1_PREP_FOR_DLVRY_NB,
        $37::FLOAT AS DLVRY_FLW_UP_3_6_1_2_DLVRY_EXPLTN_NB,
        $38::FLOAT AS DLVRY_FLW_UP_3_6_1_3_ROAD_ASTNC_NB,
        $39::FLOAT AS DLVRY_FLW_UP_3_6_1_4_NXT_SVC_RMNDR_NB,
        $40::FLOAT AS FLW_UP_3_6_2_1_VOC_NB,
        $41::FLOAT AS FLW_UP_3_6_2_2_CMPLNT_TRCKNG_CAC_NB,
        $42::FLOAT AS EXPRS_SVC_APNTMT_3_7_1_1_OFR_CNFRM_FLW_UP_NB,
        $43::FLOAT AS EXPRS_SVC_RCPTN_3_7_2_1_RGSTR_INSPCT_EXPLAIN_NB,
        $44::FLOAT AS EXPRS_SVC_CNTL_3_7_3_1_ASGN_WRK_NB,
        $45::FLOAT AS EXPRS_SVC_CNTL_3_7_3_2_USE_RAMP_TOOL_NB,
        $46::FLOAT AS EXPRS_SVC_CMNCTN_3_7_4_1_WASHING_STF_QLTY_NB,
        $47::FLOAT AS EXPRS_SVC_ISPCTN_3_7_5_1_QLTY_CNTL_NB,
        $48::FLOAT AS EXPRS_SVC_CMNCTN_3_7_6_1_USE_POP_MTRL_NB,
        $49::FLOAT AS NREDI_SVC_5S_3_8_1_1_MNTNC_SVC_ARA_NB,
        $50::FLOAT AS NREDI_SVC_5S_3_8_1_2_MNTNC_RCPTN_NB,
        $51::FLOAT AS NREDI_SVC_5S_3_8_1_3_MNTNC_WRKSHOP_NB,
        $52::FLOAT AS NREDI_SVC_5S_3_8_1_4_MNTNC_FACADE_NB,
        $53::FLOAT AS NREDI_SVC_5S_3_8_2_1_SELF_EVLTN_NB,
        $54::FLOAT AS ORGANIZATIONAL_STRCTR_3_9_1_1_SVC_ADVSR,
        $55::FLOAT AS ORGANIZATIONAL_STRCTR_3_9_1_2_SVC_TCHNCN,
        $56::FLOAT AS ORGANIZATIONAL_STRCTR_3_9_1_3_WSHR_NB,
        $57::FLOAT AS ORGANIZATIONAL_STRCTR_3_9_1_4_QLTY_CNTL_NB,
        $58::VARCHAR(250) AS HASHKEY,
        $59::TIMESTAMP AS AUDIT_LOADED_DATE
    FROM '@NMEX_MAP_EXT_STG/validated/NEI/servicio'
)
FILE_FORMAT = (
    TYPE = 'CSV',
    FIELD_DELIMITER = ';',
    SKIP_HEADER = 1,
    DATE_FORMAT = 'AUTO',
    TIMESTAMP_FORMAT = 'AUTO',
    NULL_IF = ('NULL', '','NaN','nan','NAN'),
    TRIM_SPACE = TRUE,
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
)
ON_ERROR = 'CONTINUE';

-- Snowpipe for RSLT_SLS_NSN_EXPRNC_INDX_SG (Sales)
CREATE OR REPLACE PIPE NMX_MTS1_STG.RSLT_SLS_NSN_EXPRNC_INDX_SG_PIPE
  AUTO_INGEST = TRUE
  AS COPY INTO NMX_MTS1_STG.RSLT_SLS_NSN_EXPRNC_INDX_SG (
    FSCL_YR_NB,
    FSCL_QTR_SHRT_NM,
    DLR_CD,
    DLR_NM,
    DLR_GRP_NM,
    DLR_ZN_NM,
    RSLT_SL_NB,
    RSLT_SVC_NB,
    RSLT_EFCTVNS_NB,
    BSNS_DVLPMT_CTR_2_1_1_1_OPRTNY_MGMT,
    BSNS_DVLPMT_CTR_2_1_2_1_CSTMR_INFRMN,
    BSNS_DVLPMT_CTR_2_1_3_1_APNTMT_PREPARATION,
    BSNS_DVLPMT_CTR_2_1_4_1_APNTMT_CNFMTN,
    EFCTV_OPRTNY_RCPTN_2_2_1_1_WLCM_CLNT_NB,
    EFCTV_OPRTNY_2_2_1_2_CSTMR_RGSTRN,
    EFCTV_OPRTNY_2_2_1_3_APV_ASGNMT,
    EFCTV_OPRTNY_CNSLT_2_2_2_1_IDNTFY_NEED_NB,
    EFCTV_OPRTNY_2_2_2_2_HM_CNSLTON_TOOL,
    EFCTV_OPRTNY_CNSLT_2_2_2_3_TOOL_DGTL_NB,
    PRDT_PRSNT_STC_2_3_1_1_EXPLAIN_FEATR_NB,
    PRDT_PRSNT_STC_2_3_1_2_ACSR_NB,
    PRDT_PRSNT_STC_2_3_1_3_ACSRY_COMMS_NB,
    PRDT_PRSNT_TST_DRV_2_3_2_1_CAR_AVLBTY_NB,
    PRDT_PRSNT_TST_DRV_2_3_2_2_LCNS_CK_NB,
    PRDT_PRSNT_TST_DRV_2_3_2_3_EXPLAIN_FEATR_NB,
    PRDT_PRSNT_TST_DRV_2_3_2_4_CLNT_AMENITIES_NB,
    PRDT_PRSNT_TST_DRV_2_3_2_5_STSFCN_SRVY_NB,
    ECNMC_PRPSL_TRADIN_2_4_1_1_PROMOTE_PRGRM_NB,
    ECNMC_PRPSL_SL_CLSR_2_4_2_1_PRFL_NB,
    ECNMC_PRPSL_SL_CLSR_2_4_2_2_DOC_CKLIST_NB,
    ECNMC_PRPSL_2_4_2_4_SLS_CLSR_STRTGY,
    ECNMC_PRPSL_SL_CLSR_2_4_2_5_CRDT_APP_NB,
    DLVRY_FLW_UP_2_5_1_1_PREP_SCHDL_NB,
    DLVRY_FLW_UP_2_5_1_2_CNFRM_CLNT_DTLS_NB,
    DLVRY_FLW_UP_2_5_1_3_PREP_VHCL_NB,
    DLVRY_FLW_UP_2_5_1_4_RCV_CLNT_NB,
    DLVRY_FLW_UP_2_5_1_5_HNDVR_DOCS_VHCL_NB,
    FLW_UP_2_5_2_1_SLSFRC_CMPLNT_NB,
    GTE_4_2_6_1_1_NEW_VHCL_RCPT,
    GTE_4_2_6_1_2_STRG_CNDTN,
    GTE_4_2_6_1_3_PRDCTY_MNTNC,
    GTE_4_2_6_1_4_ACSRY_INSTLN,
    GTE_4_2_6_1_5_PR_DLVRY_ISPCTN,
    GTE_4_2_6_1_6_CSTMR_DLVRY_SHWRM,
    GTE_4_2_6_1_7_QLTY_MGMT_SYSTM,
    NREDI_SLS_AND_5S_2_7_1_1_SHWRM_MNTNC,
    NREDI_SLS_AND_5S_2_7_1_2_CNSLTON_ARA_MNTNC,
    NREDI_SLS_AND_5S_2_7_1_3_VHCL_DLVRY_ARA_MNTNC,
    NREDI_SLS_AND_5S_2_7_1_4_FACADE_AND_OUTDOR_SPC_MNTNC,
    NREDI_SLS_AND_5S_2_7_2_1_SELF_EVLTN_AND_FLW_UP,
    NREDI_SLS_AND_5S_2_8_1_1_RQRD_SLS_ADVSR,
    NREDI_SLS_AND_5S_2_8_1_2_RQRD_BM_SLS,
    NREDI_SLS_AND_5S_2_8_1_3_SLS_STRCTR,
    NREDI_SLS_AND_5S_2_8_1_4_ADPC,
    HASHKEY,
    AUDIT_LOADED_DATE
) FROM (
    SELECT
        $1::FLOAT AS FSCL_YR_NB,
        $2::FLOAT AS FSCL_QTR_SHRT_NM,
        $3::VARCHAR(250) AS DLR_CD,
        $4::VARCHAR(250) AS DLR_NM,
        $5::VARCHAR(250) AS DLR_GRP_NM,
        $6::VARCHAR(250) AS DLR_ZN_NM,
        $7::FLOAT AS RSLT_SL_NB,
        $8::FLOAT AS RSLT_SVC_NB,
        $9::FLOAT AS RSLT_EFCTVNS_NB,
        $10::FLOAT AS BSNS_DVLPMT_CTR_2_1_1_1_OPRTNY_MGMT,
        $11::FLOAT AS BSNS_DVLPMT_CTR_2_1_2_1_CSTMR_INFRMN,
        $12::FLOAT AS BSNS_DVLPMT_CTR_2_1_3_1_APNTMT_PREPARATION,
        $13::FLOAT AS BSNS_DVLPMT_CTR_2_1_4_1_APNTMT_CNFMTN,
        $14::FLOAT AS EFCTV_OPRTNY_RCPTN_2_2_1_1_WLCM_CLNT_NB,
        $15::FLOAT AS EFCTV_OPRTNY_2_2_1_2_CSTMR_RGSTRN,
        $16::FLOAT AS EFCTV_OPRTNY_2_2_1_3_APV_ASGNMT,
        $17::FLOAT AS EFCTV_OPRTNY_CNSLT_2_2_2_1_IDNTFY_NEED_NB,
        $18::FLOAT AS EFCTV_OPRTNY_2_2_2_2_HM_CNSLTON_TOOL,
        $19::FLOAT AS EFCTV_OPRTNY_CNSLT_2_2_2_3_TOOL_DGTL_NB,
        $20::FLOAT AS PRDT_PRSNT_STC_2_3_1_1_EXPLAIN_FEATR_NB,
        $21::FLOAT AS PRDT_PRSNT_STC_2_3_1_2_ACSR_NB,
        $22::FLOAT AS PRDT_PRSNT_STC_2_3_1_3_ACSRY_COMMS_NB,
        $23::FLOAT AS PRDT_PRSNT_TST_DRV_2_3_2_1_CAR_AVLBTY_NB,
        $24::FLOAT AS PRDT_PRSNT_TST_DRV_2_3_2_2_LCNS_CK_NB,
        $25::FLOAT AS PRDT_PRSNT_TST_DRV_2_3_2_3_EXPLAIN_FEATR_NB,
        $26::FLOAT AS PRDT_PRSNT_TST_DRV_2_3_2_4_CLNT_AMENITIES_NB,
        $27::FLOAT AS PRDT_PRSNT_TST_DRV_2_3_2_5_STSFCN_SRVY_NB,
        $28::FLOAT AS ECNMC_PRPSL_TRADIN_2_4_1_1_PROMOTE_PRGRM_NB,
        $29::FLOAT AS ECNMC_PRPSL_SL_CLSR_2_4_2_1_PRFL_NB,
        $30::FLOAT AS ECNMC_PRPSL_SL_CLSR_2_4_2_2_DOC_CKLIST_NB,
        $31::FLOAT AS ECNMC_PRPSL_2_4_2_4_SLS_CLSR_STRTGY,
        $32::FLOAT AS ECNMC_PRPSL_SL_CLSR_2_4_2_5_CRDT_APP_NB,
        $33::FLOAT AS DLVRY_FLW_UP_2_5_1_1_PREP_SCHDL_NB,
        $34::FLOAT AS DLVRY_FLW_UP_2_5_1_2_CNFRM_CLNT_DTLS_NB,
        $35::FLOAT AS DLVRY_FLW_UP_2_5_1_3_PREP_VHCL_NB,
        $36::FLOAT AS DLVRY_FLW_UP_2_5_1_4_RCV_CLNT_NB,
        $37::FLOAT AS DLVRY_FLW_UP_2_5_1_5_HNDVR_DOCS_VHCL_NB,
        $38::FLOAT AS FLW_UP_2_5_2_1_SLSFRC_CMPLNT_NB,
        $39::FLOAT AS GTE_4_2_6_1_1_NEW_VHCL_RCPT,
        $40::FLOAT AS GTE_4_2_6_1_2_STRG_CNDTN,
        $41::FLOAT AS GTE_4_2_6_1_3_PRDCTY_MNTNC,
        $42::FLOAT AS GTE_4_2_6_1_4_ACSRY_INSTLN,
        $43::FLOAT AS GTE_4_2_6_1_5_PR_DLVRY_ISPCTN,
        $44::FLOAT AS GTE_4_2_6_1_6_CSTMR_DLVRY_SHWRM,
        $45::FLOAT AS GTE_4_2_6_1_7_QLTY_MGMT_SYSTM,
        $46::FLOAT AS NREDI_SLS_AND_5S_2_7_1_1_SHWRM_MNTNC,
        $47::FLOAT AS NREDI_SLS_AND_5S_2_7_1_2_CNSLTON_ARA_MNTNC,
        $48::FLOAT AS NREDI_SLS_AND_5S_2_7_1_3_VHCL_DLVRY_ARA_MNTNC,
        $49::FLOAT AS NREDI_SLS_AND_5S_2_7_1_4_FACADE_AND_OUTDOR_SPC_MNTNC,
        $50::FLOAT AS NREDI_SLS_AND_5S_2_7_2_1_SELF_EVLTN_AND_FLW_UP,
        $51::FLOAT AS NREDI_SLS_AND_5S_2_8_1_1_RQRD_SLS_ADVSR,
        $52::FLOAT AS NREDI_SLS_AND_5S_2_8_1_2_RQRD_BM_SLS,
        $53::FLOAT AS NREDI_SLS_AND_5S_2_8_1_3_SLS_STRCTR,
        $54::FLOAT AS NREDI_SLS_AND_5S_2_8_1_4_ADPC,
        $55::VARCHAR(250) AS HASHKEY,
        $56::TIMESTAMP AS AUDIT_LOADED_DATE
    FROM '@NMEX_MAP_EXT_STG/validated/NEI/ventas'
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