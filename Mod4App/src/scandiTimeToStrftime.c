#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <math.h>

#include "dbDefs.h"
#include "epicsTime.h"
#include "alarm.h"
#include "devSup.h"
#include "recGbl.h"

#include "aiRecord.h"
#include "stringinRecord.h"
#include "epicsExport.h"

#include <registryFunction.h>
#include <aSubRecord.h>

int scandiTSDebug;

typedef struct _FILETIME {
  unsigned int dwLowDateTime;
  unsigned int dwHighDateTime;
} FILETIME, *PFILETIME;


static long scandiTsubInit(aSubRecord *prec)
{
    if (scandiTSDebug)
        printf("Record %s called scandiTsubInit(%p)\n",
               prec->name, (void *)prec);
    return 0;
}

/*******************************************************************
For checking:
FILETIME            UNIX TIME

116444736000000000          0,  * 1970-01-01 00:00:00 UTC UNIX epoch
127673360590000000 1122862459,  * 2005-08-01 02:14:19 UTC Late date
131190624000000000 1474588800   * 2016-09-23 00:00:00 UTC Now

Number of seconds from 1 Jan. 1601 00:00 to 1 Jan 1970 00:00 UTC
2^32 = 4 294 967 296

The EPICS Epoch is 00:00:00 Jan 1, 1990 UTC
*******************************************************************/
#define	T0   116444736000000000
#define T0Lo 0xd53e8000
#define T0Hi 0x019db1de

#define	T1   127673360590000000
#define T1Lo 0xb93f4f80
#define T1Hi 0x01c5963e

#define	T2   131190624000000000
#define T2Lo 0x6d61c000
#define T2Hi 0x01d2152d

#define	MS_TICKRATE 1E-07
#define EPOCH_DIFF 11644473600

//#define TZ_DIFF (5*3600)
// TZ_DIFF Sweden = 7 h
//#define TZ_DIFF   (7*3600)
// Aug. 17, 2017: TZ_DIFF = 0
#define TZ_DIFF   (0*3600)
#define LEAP_SEC        0
#define DAYLIGHT_SAV 3600

//116 444 736 000 000 000
//             10 000 000

static long scandiTsubProcess(aSubRecord *prec)
{
register
  int   i, j;
  int   l = 0;
  int   n = 0;

  FILETIME        ft;
  epicsTimeStamp  et;

  long double     dtf;
  long double     dt_sec;
  long double     dt_nsec;
  double          dbl_ns;
  char		  c[128];


/******************************************************************/
/* Construct 2005-08-01 02:14:19 as FILETIME                      */
/******************************************************************/

//  ft.dwLowDateTime  = T0Lo;
//  ft.dwHighDateTime = T0Hi;

//  ft.dwLowDateTime  = T1Lo;
//  ft.dwHighDateTime = T1Hi;

//  ft.dwLowDateTime  = T2Lo;
//  ft.dwHighDateTime = T2Hi;

  ft.dwLowDateTime  = *(unsigned int *)prec->a;
  ft.dwHighDateTime = *(unsigned int *)prec->b;

  if( scandiTSDebug ) {
    printf("1. ft.dwLowDateTime   =0x%08x = %16u\n", ft.dwLowDateTime,  ft.dwLowDateTime);
    printf("1. ft.dwHighDateTimen =0x%08x = %16u\n", ft.dwHighDateTime, ft.dwHighDateTime);
    }

  dtf = (long double)ft.dwHighDateTime*(long double)(4294967296) + (long double)ft.dwLowDateTime;
  /* dtf is in Microsoft units [100 ns = 0.1 us]                                               */

  if( scandiTSDebug ) printf( "dtf=%24.0Lf\n", dtf);

  dt_sec  = dtf*MS_TICKRATE;

  if( scandiTSDebug ) printf( "1. dt_sec=%24.0Lf\n", dt_sec);
 
  dt_sec -= (long double)EPOCH_DIFF;

  if( scandiTSDebug ) printf( "2. dt_sec=%24.0Lf\n", dt_sec);

  dt_nsec= ((double)ft.dwLowDateTime - floor((double)ft.dwLowDateTime))*100;

  dt_nsec   = dtf*MS_TICKRATE - (long long unsigned)(dtf*MS_TICKRATE);

  if( scandiTSDebug ) printf("BP A. nsec=%1.10Lf\n", dt_nsec);

  dbl_ns    = (double)floor(dt_nsec*1000+0.5);

  /* Microsoft unit [100 ns = 0.1 us]                                                          */
  /* The most significat bit in dwLowDateTime = 2^32 = 4 294 967 296 [Microsoft units]         */
  /* nanoseconds there are *100 more                                                           */

  if( scandiTSDebug ) printf("N. nsec=%1.10lf\n", dbl_ns);

  et.secPastEpoch  = (unsigned int)floor(dt_sec);
  et.secPastEpoch += LEAP_SEC;
  et.secPastEpoch -= POSIX_TIME_AT_EPICS_EPOCH; // Leap second

//et.secPastEpoch  = 1474588800 - POSIX_TIME_AT_EPICS_EPOCH; // + TZ_DIFF => Sep 23, 2016 00:00:00.000
  et.secPastEpoch -= DAYLIGHT_SAV;   // Daylight saving

  et.secPastEpoch += TZ_DIFF; // 1 sec + TZ_DIFF => Jan 01, 1990 00:00:01.000

  et.nsec          = (unsigned int)(1E+06*floor(dbl_ns));
  
  if( scandiTSDebug ) {
    printf("1. et.secPastEpoch=%20u\n", et.secPastEpoch);
    printf("1. et.nsec=%20u\n", et.nsec);
    }

  memset(c, 0, sizeof(c));
  epicsTimeToStrftime( c, sizeof(c),
                              "%b %d, %Y %H:%M:%S.%03f", &et);

  recGblGetTimeStamp(prec);

  if( scandiTSDebug ) {
    printf("c=%s\n", c);
    printf("2- secPastEpoch=%20d\n", prec->time.secPastEpoch);
    printf("2- nsec=%3d\n", prec->time.nsec);
    printf( "NOVA=%d\n", prec->nova);
    }

  //l = epicsTimeToStrftime( prec->vala, prec->nova,
  //                            "%b %d, %Y %H:%M:%S.%03f", &prec->time);

  l = epicsTimeToStrftime( prec->vala, prec->nova,
                               "%b %d, %Y %H:%M:%S.%03f", &et);

  if( scandiTSDebug ) {
    printf("Record %s called scandiTsubProcess(%p)\n",
      prec->name, (void *)prec);
    printf("VAL INPA=0x%08x\n", *(unsigned int *)prec->a);
    printf("VAL INPB=0x%08x\n", *(unsigned int *)prec->b);
    printf( " %s\n", prec->vala);
    }

  if( scandiTSDebug ) printf("scandiTSProcess\n");
  return 0;
}

/* Register these symbols for use by IOC code: */

epicsExportAddress(int, scandiTSDebug);
epicsRegisterFunction(scandiTsubInit);
epicsRegisterFunction(scandiTsubProcess);
