#!/bin/sh
# Usage: show-remaining.sh [-v]

echo -n "Files remaining to transfer "
diff -u ../source_index ../dest_index | grep ^-f | cut -d , -f 3 | wc -l
echo -n "Parts remaining to transfer "
diff -u ../source_index ../dest_index | grep ^-p | cut -d , -f 3 | wc -l
echo -n "Dirs  remaining to transfer "
diff -u ../source_index ../dest_index | grep ^-d | cut -d , -f 3 | wc -l
echo -n "Size remaining to transfer "
diff -u ../source_index ../dest_index | grep ^-f | cut -d , -f 3 | ./add -q -u

if [ "$1" = "-v" ];  then
	diff -u ../source_index ../dest_index | grep ^-f | cut -d , -f 2,3 ;
fi
