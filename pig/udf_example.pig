-- Register the Python UDF script
REGISTER 'hdfs:///uppercase_udf.py' USING jython AS udf;

-- Load some data
data = LOAD 'hdfs:///input_dir/sample.txt' AS (text:chararray);

-- Use the Python UDF
uppercased_data = FOREACH data GENERATE udf.uppercase(text) AS uppercase_text;

-- Store the result
STORE uppercased_data INTO 'hdfs:///pig_output_data';
