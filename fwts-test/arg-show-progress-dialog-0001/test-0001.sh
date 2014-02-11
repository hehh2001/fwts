#!/bin/bash
#
TEST="Test --show-progress-dialog option"
NAME=test-0001.sh
TMPLOG=$TMP/progress.log.$$

$FWTS -w 80 --show-progress-dialog -j $FWTSTESTDIR/../data --klog=$FWTSTESTDIR/arg-show-progress-dialog-0001/klog.txt oops klog version > $TMPLOG
diff $TMPLOG $FWTSTESTDIR/arg-show-progress-dialog-0001/progress-0001.log >> $FAILURE_LOG
ret=$?
if [ $ret -eq 0 ]; then 
	echo PASSED: $TEST, $NAME
else
	echo FAILED: $TEST, $NAME
fi

rm $TMPLOG
exit $ret
