# PIG

## Demo

Create a `sample.txt` file with the following contents.
```
1,Jerin
2,Sheela
3,Bellavita
```

Load the file into hdfs.
```bash
hdfs dfs -put sample.txt /input_dir
```

Create a `demo.pig` file
```sql
-- Load the data from HDFS
data = LOAD '/home/hadoop/piginput/sample.txt' USING PigStorage(',') AS (id:int, name:chararray);
-- Dump the data to check if it was loaded correctly
DUMP data;
```

```bash
pig udf_example.pig
```

![]()
![]()
