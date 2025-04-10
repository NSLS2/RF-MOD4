TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
#  Optimization of db files using dbst (DEFAULT: NO)
#DB_OPT = YES

#----------------------------------------------------
# Create and install (or just install) into <top>/db
# databases, templates, substitutions like this
DB += mb_ai_int16.template
DB += mb_ai_float32.template
DB += mb_ai_int32.template
DB += mb_wave_log_int16.template
DB += mb_wave_matrix_int16.template
DB += mb_wave_digi_int16.template
DB += mb_wave_log_int32.template
DB += mb_wave_log_float.template
DB += TRFCB02-CPCL-RSCN_mod.db
DB += misc.db
DB += Out.db
DB += log.db
DB += logEntryState.template
DB += logEntryState.db
DB += logEntryType.template
DB += logEntryType.db
DB += logEntryWarn.template
DB += logEntryWarn.db
DB += logEntryMsg.template
DB += logEntryMsg.db
DB += logEntryIL.template
DB += logEntryIL.db
DB += logEntryTrID.template
DB += logEntryTrID.db
DB += logEntryTS.template
DB += logEntryTS.db
DB += logEntryTxtSel.template
DB += logEntryTxtSel.db
DB += logEntryEvData.template
DB += logEntryEvData.db
DB += SSM.template
DB += SSM.db
DB += MEV.template
DB += MEV.db
DB += MIL.template
DB += MIL.db
DB += accuhrs.template
DB += accuhrs.db

#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

DB_INSTALLS += $(ASYN)/db/asynRecord.db
DB_INSTALLS += $(AUTOSAVE)/asApp/Db/save_restoreStatus.db
DB_INSTALLS += $(DEVIOCSTATS)/db/iocAdminSoft.db
DB_INSTALLS += ${RECSYNC}/castApp/Db/reccaster.db

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

