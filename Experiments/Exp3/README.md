# MapReduce for weather dataset

### Reducer Code

```python
#!/usr/bin/python

import sys

for line in sys.stdin:
	line = line.strip()
	words = line.split()
	
	month = line[10:12]
	daily_max = line[38:45]
	daily_max = daily_max.strip()
	
	for word in words:
		print ('%s\t%s' % (month ,daily_max))
```

### Mapper Code

```python
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

```
