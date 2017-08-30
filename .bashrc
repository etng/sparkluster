export SPARK_MASTER_IP="192.168.48.30"
export SPARK_MASTER_URL=spark://192.168.48.30:7077
# SPARK
export SPARK_HOME="/opt/spark-2.2.0-bin-hadoop2.7/"
# Hadoop
export HADOOP_HOME="/opt/hadoop-2.8.1"
export LD_LIBRARY_PATH=$HADOOP_HOME/lib/native:$LD_LIBRARY_PATH
export PATH=/opt/anaconda2/bin/:$PATH
alias start_notebook="jupyter notebook --no-browser --ip='0.0.0.0' --notebook-dir=/vagrant/notebooks"
export JUPYTER_NOTEBOOK_PASSWORD="secret"
