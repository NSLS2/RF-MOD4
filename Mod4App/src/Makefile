TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================
#=============================
# Build the IOC support library

LIBRARY_IOC += Mod4Support

Mod4Support_SRCS += acalc.c
Mod4Support_SRCS += devFileWaveform.c
Mod4Support_SRCS += intfloatcnv.c
Mod4Support_SRCS += scandiTimeToStrftime.c

Mod4Support_LIBS += $(EPICS_BASE_IOC_LIBS)
#=============================
#=============================
#=============================
# Build the IOC application

PROD_IOC = Mod4
# Mod4.dbd will be created and installed
DBD += Mod4.dbd

# Mod4.dbd will be made up from these files:
Mod4_DBD += base.dbd

# Include dbd files from all support applications:
Mod4_DBD += asyn.dbd
Mod4_DBD += caPutLog.dbd
Mod4_DBD += devIocStats.dbd
Mod4_DBD += calcSupport.dbd
Mod4_DBD += system.dbd
Mod4_DBD += stream.dbd
Mod4_DBD += drvAsynSerialPort.dbd 
Mod4_DBD += asSupport.dbd
Mod4_DBD += AppInclude.dbd
Mod4_DBD += scandiTime.dbd
Mod4_DBD += devFileWaveform.dbd
Mod4_DBD += acalc.dbd
Mod4_DBD += intfloatcnv.dbd
Mod4_DBD += reccaster.dbd

# Add all the support libraries needed by this IOC
Mod4_LIBS += Mod4Support stream calc sscan devIocStats autosave modbus asyn caPutLog reccaster seq pv pvDatabase qsrv pvaClient pvAccessIOC pvAccess pvAccessCA nt pvData

# Mod4_registerRecordDeviceDriver.cpp derives from Mod4.dbd
Mod4_SRCS += Mod4_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
Mod4_SRCS_DEFAULT += Mod4Main.cpp
Mod4_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#Mod4_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link QSRV (pvAccess Server) if available
ifdef EPICS_QSRV_MAJOR_VERSION
    Mod4_LIBS += qsrv
    Mod4_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
    Mod4_DBD += PVAServerRegister.dbd
    Mod4_DBD += qsrv.dbd
endif

# Finally link to the EPICS Base libraries
Mod4_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

