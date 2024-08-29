#!/usr/bin/python

from operator import itemgetter
import sys

current_month = None
current_max = 0
month = None

for line in sys.stdin:
	line = line.strip()
	month, daily_max = line.split('\t', 1)
	try:
		daily_max = float(daily_max)
	except ValueError:
		continue
	if current_month == month:
		if daily_max > current_max:
			current_max = daily_max
	else:
		if current_month:
			print ('%s\t%s' % (current_month, current_max))
		current_max = daily_max
		current_month = month
if current_month == month:
	print ('%s\t%s' % (current_month, current_max))
