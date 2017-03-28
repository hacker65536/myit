#system admin reporter

`/etc/cron.d/sysstat`

```crontab
# Run system activity accounting tool every 10 minutes
*/10 * * * * root /usr/lib64/sa/sa1 1 1
# 0 * * * * root /usr/lib64/sa/sa1 600 6 &
# Generate a daily summary of process accounting at 23:53
53 23 * * * root /usr/lib64/sa/sa2 -A
```






`/usr/lib64/sa/sa1`
```bash
#!/bin/sh
# /usr/lib64/sa/sa1
# (C) 1999-2009 Sebastien Godard (sysstat <at> orange.fr)
#
#@(#) sysstat-9.0.4
#@(#) sa1: Collect and store binary data in system activity data file.
#
HISTORY=0
SADC_OPTIONS="-S DISK"
DDIR=/var/log/sa
DATE=`date +%d`
CURRENTFILE=sa${DATE}
CURRENTDIR=`date +%Y%m`
SYSCONFIG_DIR=/etc/sysconfig
umask 0022
[ -r ${SYSCONFIG_DIR}/sysstat ] && . ${SYSCONFIG_DIR}/sysstat
if [ ${HISTORY} -gt 28 ]
then
        cd ${DDIR} || exit 1
        [ -d ${CURRENTDIR} ] || mkdir -p ${CURRENTDIR}
        # If ${CURRENTFILE} exists and is a regular file, then make sure
        # the file was modified this day (and not e.g. month ago)
        # and move it to ${CURRENTDIR}
        [ ! -L ${CURRENTFILE} ] &&
                [ -f ${CURRENTFILE} ] &&
                [ "`date +%Y%m%d -r ${CURRENTFILE}`" = "${CURRENTDIR}${DATE}" ] &&
                mv -f ${CURRENTFILE} ${CURRENTDIR}/${CURRENTFILE}
        touch ${CURRENTDIR}/${CURRENTFILE}
        # Remove the "compatibility" link and recreate it to point to
        # the (new) current file
        rm -f ${CURRENTFILE}
        ln -s ${CURRENTDIR}/${CURRENTFILE} ${CURRENTFILE}
else
        # If ${CURRENTFILE} exists, is a regular file and is from a previous
        # month then delete it so that it is recreated by sadc afresh
        [ -f ${CURRENTFILE} ] && [ "`date +%Y%m -r ${CURRENTFILE}`" -lt "${CURRENTDIR}" ] && rm -f ${CURRENTFILE}
fi
ENDIR=/usr/lib64/sa
cd ${ENDIR}
[ "$1" = "--boot" ] && shift && BOOT=y || BOOT=n
if [ $# = 0 ] && [ "${BOOT}" = "n" ]
then
# Note: Stats are written at the end of previous file *and* at the
# beginning of the new one (when there is a file rotation) only if
# outfile has been specified as '-' on the command line...
        exec ${ENDIR}/sadc -F -L ${SADC_OPTIONS} 1 1 -
else
        exec ${ENDIR}/sadc -F -L ${SADC_OPTIONS} $* -
fi
```
