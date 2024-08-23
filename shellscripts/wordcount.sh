read -p 'Enter the input file name in hdfs [/input_dir]:  ' infile
read -p 'Enter the file name of mapper python script in [$HADOOP_HOME/input/pyscripts]:  ' mapscript
read -p 'Enter the file name of reducer python script in [$HADOOP_HOME/input/pyscripts]:  ' redscript

hadoop jar /home/soul/hadoop-3.4.0/share/hadoop/tools/lib/hadoop-streaming-3.4.0.jar \
-input /input_dir/$infile \
-output /output_dir \
-mapper /home/soul/hadoop-3.4.0/input/pyscripts/$mapscript \
-reducer /home/soul/hadoop-3.4.0/input/pyscripts/$redscript
