#!/usr/bin/python

import sys, sha

try:
	path = sys.argv[1]
except:
	print "Usage: test_sha1 <filename>"
	sys.exit(1)

def calculate_sha1(path):
	f = open(path, mode='rb')
	d = sha.new()
	buf = 0
	while buf != b'':
		buf = f.read(32768)
		d.update(buf)
	f.close()
	print d.hexdigest()

calculate_sha1(path)
