#!/usr/bin/python

import sys, time

ESC = '\x1B'
erase_end_of_line = ESC+'[K'
erase_cur_line = ESC+'[2K'
erase_screen = ESC+'[2J'
beginning_of_line = ESC+'[0G'

#print erase_screen,
#sys.stdout.flush()

prefix = "count: "
for i in [1,2,3,4,5]:
	print prefix,i,
	sys.stdout.flush()
	time.sleep(1)
	print erase_cur_line,
	sys.stdout.write(beginning_of_line)
	sys.stdout.flush()
