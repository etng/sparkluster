### download softwareas

# https://www.anaconda.com/download/#download
# wget -c https://repo.continuum.io/archive/Anaconda2-4.4.0.1-Linux-ppc64le.sh -P soft
# https://repo.continuum.io/archive/
# or from mirror https://mirror.tuna.tsinghua.edu.cn/help/anaconda/
wget -c https://repo.continuum.io/archive/Anaconda2-4.4.0-Linux-x86_64.sh -P soft
# http://spark.apache.org/downloads.html
wget -c https://d3kbcqa49mib13.cloudfront.net/spark-2.2.0-bin-hadoop2.7.tgz -P soft
# http://hadoop.apache.org/releases.html
wget -c http://www-us.apache.org/dist/hadoop/common/hadoop-2.8.1/hadoop-2.8.1.tar.gz -P soft
# all machine are ubuntu 16.04 lts
vagrant box add ubuntu/xenial64

vagrant destroy -f
vagrant up

vagrant ssh master

