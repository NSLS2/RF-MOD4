#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <time.h>

#include <recGbl.h>
#include <dbDefs.h>
#include <dbAccess.h>
#include <menuFtype.h>
#include <registryFunction.h>
#include <aSubRecord.h>
#include <waveformRecord.h>
#include <longinRecord.h>
#include <aiRecord.h>

#include <epicsExport.h>
#include <epicsMath.h>
#include <epicsTypes.h>

int intfloatSubDebug;

static long intfloatSubInit(aSubRecord *precord)
{
    if (intfloatSubDebug)
        printf("Record %s called intfloatInit(%p)\n",
               precord->name, (void*) precord);
    return 0;
}

static long intfloatSubProc(aSubRecord *prec)
{
  float           Flt;
  double          *pDbl;
 
  Flt  = *(float *)(unsigned int *)prec->a;
  pDbl = (double *)prec->vala;

  /* Test ref:  In Val = 0x43a4a1b0 =        3.292632e+02 */

  if (intfloatSubDebug) printf("In Val = 0x%08x =%20.6e \n", *(unsigned int *)&Flt, Flt );
  *pDbl = (double)Flt;
  if (intfloatSubDebug) printf("Out=%20.6e\n", *pDbl );
  prec->neva = 1;
  return 0;
}

/* Register these symbols for use by IOC code: */

epicsExportAddress(int, intfloatSubDebug);
epicsRegisterFunction(  intfloatSubInit);
epicsRegisterFunction(  intfloatSubProc);
