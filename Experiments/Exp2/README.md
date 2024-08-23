# Word Count using MapReduce

- The shell command is

```shell
read -p 'Enter the input file name in hdfs [/input_dir]:  ' infile
read -p 'Enter the file name of mapper python script in [$HADOOP_HOME/input/pyscripts]:  ' mapscript
read -p 'Enter the file name of reducer python script in [$HADOOP_HOME/input/pyscripts]:  ' redscript

hadoop jar /home/soul/hadoop-3.4.0/share/hadoop/tools/lib/hadoop-streaming-3.4.0.jar \
-input /input_dir/$infile \
-output /output_dir \
-mapper /home/soul/hadoop-3.4.0/input/pyscripts/$mapscript \
-reducer /home/soul/hadoop-3.4.0/input/pyscripts/$redscript
```

- The mapper is written in python

```python
#!/usr/bin/python

import sys

for line in sys.stdin:
    line = line.strip()
    
    words = line.split()
    
    for word in words:
        print(f'{word}\t1')
```

- The recuder is 

```python
#!/usr/bin/python 
  
from operator import itemgetter
import sys

current_word = None
word = None
current_count = 0

for line in sys.stdin:
	line = line.strip()
	word, count = line.split('\t', 1)
	
	count = int(count)
	if word == current_word:
		current_count += count
	else:
		if current_word:
			print(f'{current_word}\t{current_count}')
		current_count = count
		current_word = word
if current_word == word:
	print(f'{current_word}\t{current_count}')
```

The `wordCount.txt` file in the root of this repository is the file whose word count is calculated.
