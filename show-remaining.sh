#!/bin/sh
# Usage: show-remaining.sh [-v]

sync_dir=/home/CORPUSERS/10102229/Dropbox/sneaksync-transfer
echo -n "Files remaining to transfer "
diff -u ${sync_dir}/source_index ${sync_dir}/dest_index | grep ^-f | cut -d , -f 3 | wc -l
echo -n "Parts remaining to transfer "
diff -u ${sync_dir}/source_index ${sync_dir}/dest_index | grep ^-p | cut -d , -f 3 | wc -l
echo -n "Dirs  remaining to transfer "
diff -u ${sync_dir}/source_index ${sync_dir}/dest_index | grep ^-d | cut -d , -f 3 | wc -l
echo -n "Size remaining to transfer "
diff -u ${sync_dir}/source_index ${sync_dir}/dest_index | grep ^-f | cut -d , -f 3 | ${sync_dir}/work/add -q -u

if [ "$1" = "-v" ];  then
	diff -u ${sync_dir}/source_index ${sync_dir}/dest_index | grep ^-f | cut -d , -f 2,3 ;
fi
