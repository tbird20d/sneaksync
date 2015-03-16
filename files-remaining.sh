#!/bin/sh

echo -n "Files remaining to transfer "
diff -u ../source_index ../dest_index | grep ^-f
