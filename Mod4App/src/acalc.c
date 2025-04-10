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

#include <epicsExport.h>
#include <epicsMath.h>
#include <epicsTypes.h>

int acalcaSubDebug;

static long acalcaSubInit(aSubRecord *precord)
{
    if (acalcaSubDebug)
        printf("Record %s called okSNoRdInit(%p)\n",
               precord->name, (void*) precord);
    return 0;
}

static long acalcaSubProc(aSubRecord *prec)
{
register
  int    i, min_n;
  int    n[2] = {0, 0};
  int    nelm[2] = {0, 0};

  double *pDbl[2];
  double d = 0;
  int    *pInt[2];
  int    k = 0;

  n[0] = nelm[0] = prec->noa;
  n[1] = nelm[1] = prec->nova;

  d = *(double *)prec->b;
  k = (int)d;
  
  if (acalcaSubDebug) {
    printf("Record %s called acalcaSubProc(%p) - Entering --- >\n", prec->name, (void*) prec);
    printf("d=%8.1f, k=%d\n", d, k);
    }

  min_n = (n[0] < n[1]) ? n[0] : n[1];

  if( min_n ) {
    i = 0;
    pDbl[0] = (double *)prec->a;
    pDbl[1] = (double *)prec->vala;
    pInt[0] = (int *)prec->a;
    pInt[1] = (int *)prec->vala;

    while( i < min_n ) {
      switch( prec->fta ) {
        case DBF_ULONG:
          *(pInt[1]+i) = (*(pInt[0]+i) < k)? *(pInt[0]+i):k;
          if (acalcaSubDebug) printf("%3d in=%6d ut=%6d\n", i, *(pInt[0]+i), *(pInt[1]+i) );
          break;
        case DBF_DOUBLE:
          *(pDbl[1]+i) = (*(pDbl[0]+i) < d)? *(pDbl[0]+i):d;
          if (acalcaSubDebug) printf("%3d in=%6.3f ut=%6.3f\n", i, *(pDbl[0]+i), *(pDbl[1]+i) );
          break;
        }
      i++;
      }
    }

  prec->neva = min_n;
  return 0;
}

/* Register these symbols for use by IOC code: */

epicsExportAddress(int, acalcaSubDebug);
epicsRegisterFunction(  acalcaSubInit);
epicsRegisterFunction(  acalcaSubProc);

