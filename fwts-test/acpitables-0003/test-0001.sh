#!/bin/bash
#
TEST="Test apcitables against broken ACPI FADT"
NAME=test-0001.sh
TMPLOG=$TMP/acpitables.log.$$

$FWTS --log-format="%line %owner " -w 80 --dumpfile=$FWTSTESTDIR/acpitables-0003/acpidump-0001.log acpitables - | grep "^[0-9]*[ ]*acpitables" | cut -c7- > $TMPLOG
diff $TMPLOG $FWTSTESTDIR/acpitables-0003/acpitables-0001.log >> $FAILURE_LOG
ret=$?
if [ $ret -eq 0 ]; then 
	echo PASSED: $TEST, $NAME
else
	echo FAILED: $TEST, $NAME
fi

rm $TMPLOG
exit $ret
