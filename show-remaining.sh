#!/bin/sh
# Usage: show-remaining.sh [-h|-v|-vv]

if [ "$1" = "-h" ];  then
	echo "Usage: show-remaining.sh [-h|-v|-vv]"
	echo "  -h   - show this usage help"
	echo "  -v   - show list of files remaining to transfer"
	echo "  -vv  - show the full diff"
	exit 1
fi

sync_dir=/home/CORPUSERS/10102229/Dropbox/sneaksync-transfer
if [ "$1" = "-vv" ];  then
	diff -u ${sync_dir}/source_index ${sync_dir}/dest_index
fi

echo -n "Files remaining to transfer "
count=$(diff -u ${sync_dir}/source_index ${sync_dir}/dest_index | grep ^-f | cut -d , -f 3 | wc -l)
echo $count
echo -n "Parts remaining to transfer "
diff -u ${sync_dir}/source_index ${sync_dir}/dest_index | grep ^-p | cut -d , -f 3 | wc -l
echo -n "Dirs  remaining to transfer "
diff -u ${sync_dir}/source_index ${sync_dir}/dest_index | grep ^-d | cut -d , -f 3 | wc -l
echo -n "Size remaining to transfer "
if [ "$count" = "0" ]; then
	echo 0
else
	diff -u ${sync_dir}/source_index ${sync_dir}/dest_index | grep ^-f | cut -d , -f 3 | ${sync_dir}/work/add -q -u
fi

if [ "$1" = "-v" ];  then
	diff -u ${sync_dir}/source_index ${sync_dir}/dest_index | grep ^-f | cut -d , -f 2,3 ;
fi

