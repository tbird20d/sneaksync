#!/bin/sh

workdir=/home/CORPUSERS/10102229/Dropbox/sneaksync-transfer/work
LOG=${workdir}/remaining-log.txt
echo "------------------" >>$LOG
date >>$LOG
${workdir}/show-remaining.sh >>$LOG
tail -n 6 $LOG
