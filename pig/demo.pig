-- Load the data from HDFS
data = LOAD '/input_dir/sample.txt' USING PigStorage(',') AS (id:int, name:chararray);
-- Dump the data to check if it was loaded correctly
DUMP data;
