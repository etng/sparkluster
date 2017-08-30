tar zxvf /vagrant/soft/spark-2.2.0-bin-hadoop2.7.tgz -C /opt/
tar zxvf /vagrant/soft/hadoop-2.8.1.tar.gz -C /opt/
/vagrant/soft/Anaconda2-4.4.0-Linux-x86_64.sh -b -p /opt/anaconda2
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --set show_channel_urls yes
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/

cat /vagrant/.bashrc >> /home/ubuntu/.bashrc
