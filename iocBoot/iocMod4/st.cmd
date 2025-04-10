#!../../bin/linux-x86_64/Mod4

#- You may have to change Mod4 to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/Mod4.dbd"
Mod4_registerRecordDeviceDriver pdbbase

drvAsynIPPortConfigure("MOD4", "10.0.138.12:502", 0, 0, 1)
modbusInterposeConfig("MOD4", 0, 2000, 0)

#drvModbusAsynConfigure(portName, tcpPortName, slaveAddress, modbusFunction, modbusStartAddress, modbusLength, dataType, pollMsec, plcType)
drvModbusAsynConfigure("INP_MB_ID",                 "MOD4", 0,  4,   0, 1, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_MB_REV",                "MOD4", 0,  4,   1, 1, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_TcpWatchdog",           "MOD4", 0,  4,   2, 1, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_State",                 "MOD4", 0,  4,   3, 1, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_StatusBits",            "MOD4", 0,  4,   4, 1, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_AccessLevel",           "MOD4", 0,  4,   5, 1, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_SlowKlyTimeRemaining",  "MOD4", 0,  4,   6, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_PulseRepFreq",          "MOD4", 0,  4,   8, 2, 7, 100, "Beckhoff")

drvModbusAsynConfigure("INP_TargetState",           "MOD4", 0,  4,  20, 1, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_VoltSet",               "MOD4", 0,  4,  21, 2, 7, 100, "Beckhoff")
#drvModbusAsynConfigure("INP_CurrentSet",            "MOD4", 0,  4,  23, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_PulseWidth",            "MOD4", 0,  4,  25, 2, 7, 100, "Beckhoff")

drvModbusAsynConfigure("INP_CCPS1VoltRead",         "MOD4", 0,  4, 100, 2, 7, 100, "Beckhoff")

#**********************************************************************************************
# AUG. 31, 2016 - Addresses > 20 from C:\Mbus\ScandiCAT ModbusTCP.xml
#

drvModbusAsynConfigure("INP_CCPS1ILRead",           "MOD4", 0,  4, 120, 1, 0, 100, "Beckhoff")
#drvModbusAsynConfigure("INP_CCPS2ILRead",           "MOD4", 0,  4, 121, 1, 0, 100, "Beckhoff")

#drvModbusAsynConfigure("INP_VoltSet",               "MOD4", 0,  4,   8, 2, 7, 100, "Beckhoff")
#drvModbusAsynConfigure("INP_CurrentSet",            "MOD4", 0,  4,  11, 2, 7, 100, "Beckhoff")
#drvModbusAsynConfigure("INP_PulseWidth",            "MOD4", 0,  4,  13, 2, 7, 100, "Beckhoff")

#drvModbusAsynConfigure("INP_CCPS2VoltRead",         "MOD4", 0,  4, 102, 2, 7, 100, "Beckhoff")

drvModbusAsynConfigure("INP_FastFilPsCurrRead",     "MOD4", 0,  4, 200, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_FastFilPsVoltRead",     "MOD4", 0,  4, 202, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_IonPsMonRead",          "MOD4", 0,  4, 300, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_IonPsVoltRead",         "MOD4", 0,  4, 302, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_IonPsPressureRead",     "MOD4", 0,  4, 304, 2, 7, 100, "Beckhoff")

drvModbusAsynConfigure("INP_SPS1CurrRead",          "MOD4", 0,  4, 400, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_SPS1VoltRead",          "MOD4", 0,  4, 402, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_SPS2CurrRead",          "MOD4", 0,  4, 404, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_SPS2VoltRead",          "MOD4", 0,  4, 406, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_SPS3CurrRead",          "MOD4", 0,  4, 408, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_SPS3VoltRead",          "MOD4", 0,  4, 410, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_SPS4CurrRead",          "MOD4", 0,  4, 412, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_SPS4VoltRead",          "MOD4", 0,  4, 414, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_SPS5CurrRead",          "MOD4", 0,  4, 416, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_SPS5VoltRead",          "MOD4", 0,  4, 418, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_SPS6CurrRead",          "MOD4", 0,  4, 420, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_SPS6VoltRead",          "MOD4", 0,  4, 422, 2, 7, 100, "Beckhoff")

drvModbusAsynConfigure("INP_IFBCtRead",             "MOD4", 0,  4, 500, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_IFBCvdRead",            "MOD4", 0,  4, 502, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_IFBFwhmRead",           "MOD4", 0,  4, 504, 2, 7, 100, "Beckhoff")

#drvModbusAsynConfigure("INP_IFBFwdRead",            "MOD4", 0,  4, 506, 2, 7, 100, "Beckhoff")
#drvModbusAsynConfigure("INP_IFBRefRead",            "MOD4", 0,  4, 508, 2, 7, 100, "Beckhoff")
#drvModbusAsynConfigure("INP_RfOutFwhmRead",         "MOD4", 0,  4, 510, 2, 7, 100, "Beckhoff")

drvModbusAsynConfigure("INP_IFBOilTemperature",     "MOD4", 0,  4, 600, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_IFBOilLevel",           "MOD4", 0,  4, 602, 2, 7, 100, "Beckhoff")
#drvModbusAsynConfigure("INP_IFBOilHumidity",        "MOD4", 0,  4, 604, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_IFBCollInletTemp",      "MOD4", 0,  4, 700, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_IFBCollOutletTemp",     "MOD4", 0,  4, 702, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_IFBBodyInletTemp",      "MOD4", 0,  4, 704, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_IFBBodyOutletTemp",     "MOD4", 0,  4, 706, 2, 7, 100, "Beckhoff")
#drvModbusAsynConfigure("INP_IFBBodyTemp",           "MOD4", 0,  4, 708, 2, 7, 100, "Beckhoff")
#drvModbusAsynConfigure("INP_IFBSolenoidTemp",       "MOD4", 0,  4, 710, 2, 7, 100, "Beckhoff")
#drvModbusAsynConfigure("INP_IFBSolenoidTemp",       "MOD4", 0,  4, 710, 2, 7, 100, "Beckhoff")

drvModbusAsynConfigure("INP_IFB_Flow1",             "MOD4", 0,  4, 800, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_IFB_Flow2",             "MOD4", 0,  4, 802, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_IFB_Flow3",             "MOD4", 0,  4, 804, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_IFB_Flow4",             "MOD4", 0,  4, 806, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_IFB_Flow5",             "MOD4", 0,  4, 808, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("INP_IFB_Flow6",             "MOD4", 0,  4, 810, 2, 7, 100, "Beckhoff")
#drvModbusAsynConfigure("INP_IFB_Flow7",             "MOD4", 0,  4, 812, 2, 7, 100, "Beckhoff")

drvModbusAsynConfigure("INP_IFBBdyPwrLoss",         "MOD4", 0,  4, 900, 2, 7, 100, "Beckhoff")

drvModbusAsynConfigure("OUT_Watchdog",              "MOD4", 0, 16,   0, 1, 0, 100, "Beckhoff")
drvModbusAsynConfigure("OUT_TargetState",           "MOD4", 0, 16,   1, 1, 0, 100, "Beckhoff")
drvModbusAsynConfigure("OUT_Command",               "MOD4", 0, 16,   2, 1, 0, 100, "Beckhoff")
drvModbusAsynConfigure("OUT_VoltSetRem",            "MOD4", 0, 16, 100, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("OUT_FilCurrSet",            "MOD4", 0, 16, 200, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("OUT_PulseWidth",            "MOD4", 0, 16, 300, 2, 7, 100, "Beckhoff")
drvModbusAsynConfigure("OUT_DigiWfSeq",             "MOD4", 0, 16,3000, 1, 0, 100, "Beckhoff")

drvModbusAsynConfigure("INP_EventsIndex",           "MOD4", 0,  4, 999, 1, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_EventsIncr",            "MOD4", 0,  4,1000, 1, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_EventsType",            "MOD4", 0,  4,1050, 1, 0, 100, "Beckhoff")

#drvModbusAsynConfigure("INP_MEV_Incr",              "MOD4", 0,  4,1700, 1, 0, 100, "Beckhoff")
#drvModbusAsynConfigure("INP_MEV_Type",              "MOD4", 0,  4,1701, 1, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_MEV_Struct",             "MOD4", 0,  4,1700,13, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_MIL_Struct",             "MOD4", 0,  4,1715,13, 0, 100, "Beckhoff")

# New, Update Address
##############################################################################################
drvModbusAsynConfigure("INP_LOG_StartIndex",        "MOD4", 0,  4,1450, 1, 0, 100, "Beckhoff")

drvModbusAsynConfigure("INP_LOG_Wave_Increment",    "MOD4", 0,  4,1000,50, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_LOG_Wave_EventType",    "MOD4", 0,  4,1050,50, 0, 100, "Beckhoff")

# Addresses 1450, 1550 seem not to be in the simulator:
#drvModbusAsynConfigure("INP_LOG_Wave_Timestamp_1",  "MOD4", 0,  4,1550,50, 5, 100, "Beckhoff")
#drvModbusAsynConfigure("INP_LOG_Wave_Timestamp_2",  "MOD4", 0,  4,1450,50, 5, 100, "Beckhoff")
#
# According to simulation configuration file the timestamp array are on ADR 1100 containing
# 200 g_aEventsTime(s) int T_FILETIME format ... 4[bytes]x50 = 200 ...
#
drvModbusAsynConfigure("INP_LOG_Wave_Timestamp_1",  "MOD4", 0,  4,1100,100, 5, 100, "Beckhoff")
drvModbusAsynConfigure("INP_LOG_Wave_Timestamp_2",  "MOD4", 0,  4,1200,100, 5, 100, "Beckhoff")


##############################################################################################


drvModbusAsynConfigure("INP_LOG_Counter",           "MOD4", 0,  4,1300, 2, 5, 100, "Beckhoff")
drvModbusAsynConfigure("INP_LOG_EventIndex",        "MOD4", 0,  4,1400, 1, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_LOG_TextIndex",         "MOD4", 0,  4,1450, 1, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_LOG_DataType",          "MOD4", 0,  4,1500, 1, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_LOG_DataValueInt32",    "MOD4", 0,  4,1550, 2, 5, 100, "Beckhoff")
drvModbusAsynConfigure("INP_LOG_DataValueFloat",    "MOD4", 0,  4,1550, 2, 7, 100, "Beckhoff")

drvModbusAsynConfigure("INP_LOG_Wave_TrigID",       "MOD4", 0,  4,1300,50, 5, 100, "Beckhoff")
drvModbusAsynConfigure("INP_LOG_Wave_EventIndex",   "MOD4", 0,  4,1400,50, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_LOG_Wave_TextIndex",    "MOD4", 0,  4,1450,50, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_LOG_Wave_DataType",     "MOD4", 0,  4,1500,50, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_LOG_Wave_DataInt32",    "MOD4", 0,  4,1550,50, 5, 100, "Beckhoff")
drvModbusAsynConfigure("INP_LOG_Wave_DataFloat",    "MOD4", 0,  4,1550,50, 7, 100, "Beckhoff")

# Matrix
drvModbusAsynConfigure("INP_MX_Wave_Stat1",         "MOD4", 0,  4,2000,  64, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_MX_Wave_Stat2",         "MOD4", 0,  4,2064,  64, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_MX_Wave_Stat3",         "MOD4", 0,  4,2128,  64, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_MX_Wave_Stat4",         "MOD4", 0,  4,2192,  64, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_MX_Wave_Sts1",          "MOD4", 0,  4,2300,  64, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_MX_Wave_Sts2",          "MOD4", 0,  4,2364,  64, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_MX_Wave_Sts3",          "MOD4", 0,  4,2428,  64, 0, 100, "Beckhoff")
drvModbusAsynConfigure("INP_MX_Wave_Sts4",          "MOD4", 0,  4,2492,  64, 0, 100, "Beckhoff")

# Digitizer
drvModbusAsynConfigure("INP_SN",                    "MOD4", 0,  4,3000,   1, 4, 100, "Beckhoff")
drvModbusAsynConfigure("INP_DI_Wave00",             "MOD4", 0,  4,3001,  64, 4, 100, "Beckhoff")
drvModbusAsynConfigure("INP_DI_Wave01",             "MOD4", 0,  4,3065,  64, 4, 100, "Beckhoff")
drvModbusAsynConfigure("INP_DI_Wave02",             "MOD4", 0,  4,3129,  64, 4, 100, "Beckhoff")
drvModbusAsynConfigure("INP_DI_Wave03",             "MOD4", 0,  4,3193,  64, 4, 100, "Beckhoff")
drvModbusAsynConfigure("INP_DI_Wave04",             "MOD4", 0,  4,3257,  64, 4, 100, "Beckhoff")
drvModbusAsynConfigure("INP_DI_Wave05",             "MOD4", 0,  4,3321,  64, 4, 100, "Beckhoff")
drvModbusAsynConfigure("INP_DI_Wave06",             "MOD4", 0,  4,3385,  64, 4, 100, "Beckhoff")
drvModbusAsynConfigure("INP_DI_Wave07",             "MOD4", 0,  4,3449,  64, 4, 100, "Beckhoff")

## Load record instances
dbLoadRecords("db/TRFCB02-CPCL-RSCN_mod.db","SYS1=LN-RF,DEV1=Mod:4")
dbLoadRecords("db/misc.db","SYS1=LN-RF,DEV1=Mod:4,DEV2=Dig")
dbLoadRecords("db/Out.db", "SYS1=LN-RF,DEV1=Mod:4")
dbLoadRecords("db/log.db", "SYS1=LN-RF,DEV1=Mod:4")
#dbLoadRecords("db/logEntryTxt.db", "SYS1=LN-RF,DEV1=Mod:4")
dbLoadRecords("db/logEntryType.db", "SYS1=LN-RF,DEV1=Mod:4")
dbLoadRecords("db/logEntryState.db", "SYS1=LN-RF,DEV1=Mod:4")
dbLoadRecords("db/logEntryWarn.db", "SYS1=LN-RF,DEV1=Mod:4")
dbLoadRecords("db/logEntryMsg.db", "SYS1=LN-RF,DEV1=Mod:4")
dbLoadRecords("db/logEntryIL.db", "SYS1=LN-RF,DEV1=Mod:4")
dbLoadRecords("db/logEntryTrID.db", "SYS1=LN-RF,DEV1=Mod:4")
dbLoadRecords("db/logEntryTS.db", "SYS1=LN-RF,DEV1=Mod:4")
dbLoadRecords("db/logEntryTxtSel.db", "SYS1=LN-RF,DEV1=Mod:4")
dbLoadRecords("db/logEntryEvData.db", "SYS1=LN-RF,DEV1=Mod:4")
dbLoadRecords("db/SSM.db", "SYS1=LN-RF,DEV1=Mod:4")
dbLoadRecords("db/MEV.db", "SYS1=LN-RF,DEV1=Mod:4")
dbLoadRecords("db/MIL.db", "SYS1=LN-RF,DEV1=Mod:4")
dbLoadRecords("db/accuhrs.db", "SYS1=LN-RF,DEV1=Mod:4")
dbLoadRecords("db/iocAdminSoft.db", "IOC=RF-CT{$(IOC)}")
dbLoadRecords("db/reccaster.db", "P=RF-CT{${IOC}-RC}")
dbLoadRecords("db/asynRecord.db", "P=LN-RF{Mod:4},R=CAT3, PORT=MOD4, ADDR=0, OMAX=40, IMAX=40")
dbLoadRecords("db/save_restoreStatus.db", "P=RF-CT{$(IOC)}")

# Auto save/restore
save_restoreSet_status_prefix("RF-CT{$(IOC)}")
pwd
asSetFilename("${TOP}/DEFAULT.acf")
#asSetFilename("/cf-update/acf/default.acf")

# ensure directories exist
system("install -d ${TOP}/as/req")
system("install -d ${TOP}/as/save")

set_savefile_path("${TOP}/as","/save")
set_requestfile_path("${TOP}/as","/req")

set_pass0_restoreFile("MOD4_settings.sav")
set_pass0_restoreFile("MOD4_values.sav")
set_pass1_restoreFile("MOD4_values.sav")

#asynSetTraceMask("INP_MB_ID", -1, 0xff)
#asynSetTraceMask("INP_TcpWatchdog", -1, 0xff)
#asynSetTraceIOMask("INP_TcpWatchdog", -1, 0xff)

#asynSetTraceMask("INP_PulseWidth", -1, 0xff)
#asynSetTraceIOMask("INP_PulseWidth", -1, 0xff)

#var scandiTSDebug 

cd "${TOP}/iocBoot/${IOC}"
callbackSetQueueSize(20000)
iocInit

dbl > records.dbl

#system "cp records.dbl /cf-update/$HOSTNAME.$IOCNAME.dbl"

makeAutosaveFileFromDbInfo("${TOP}/as/req/MOD4_settings.req", "autosaveFields_pass0")
makeAutosaveFileFromDbInfo("${TOP}/as/req/MOD4_values.req", "autosaveFields")

create_monitor_set("MOD4_settings.req", 5, "")
create_monitor_set("MOD4_values.req", 5, "")

caPutLogInit("10.0.152.133:7004", 1)
date

