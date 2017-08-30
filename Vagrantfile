# -*- mode: ruby -*-
# vi: set ft=ruby :
bashrc = File.read('.bashrc')
# https://www.vagrantup.com/docs/index.html

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.box_check_update = false
  config.vm.post_up_message = <<-GUIDE
  to connect to master:
      vagrant ssh master
  to destroy and rebuild:
      vagrant destroy -f-f
      vagrant up
  to visit webui :
    http://192.168.48.30:8080
  to start jupyter notebook
    vagrant ssh master -c '/opt/anaconda2/bin/jupyter notebook'

  GUIDE
  # config.vm.synced_folder './', '/home/vagrant/soft', owner: "www-data", group: "www-data"

  # config.vm.network "public_network"
  # config.vm.synced_folder "../data", "/vagrant_data"
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  config.vm.define "master", primary: true do |master|
    master.vm.network "private_network", ip: "192.168.48.30"
    master.vm.hostname = "sparkluster-master"

    master.vm.provision "shell", inline: bashrc + <<-SHELL
      ${SPARK_HOME}/sbin/start-master.sh -h ${SPARK_MASTER_IP}
      ${SPARK_HOME}/sbin/start-slave.sh ${SPARK_MASTER_URL}
      echo "please visit http://${SPARK_MASTER_IP}:8080 for web ui"
    SHELL

    master.vm.provision "shell", name: 'test', privileged: false, inline: bashrc + <<-SHELL
      conda create -n jupyter -y -f --offline
      source activate jupyter
      conda install notebook -y
      /vagrant/prepare_notebook.py
      # findspark is a Python library that automatically allow you to import and use PySpark as any other Python library. There are other options to make the integration (create a jupyter profile for Spark) but up to date findspark is imho the faster and simpler one.
      pip install findspark
      /vagrant/first_app.py
    SHELL
  end
  config.vm.define "slave1", primary: true do |slave1|
    slave1.vm.network "private_network", ip: "192.168.48.31"
    slave1.vm.hostname = "sparkluster-slave1"
    slave1.vm.provision "shell", inline: bashrc + <<-SHELL
      ${SPARK_HOME}/sbin/start-slave.sh ${SPARK_MASTER_URL}
    SHELL
  end
  # config.vm.define "slave2", primary: true do |slave2|
  #   slave2.vm.network "private_network", ip: "192.168.48.32"
  #   slave2.vm.hostname = "sparkluster-slave2"
  #   slave2.vm.provision "shell", inline: bashrc + <<-SHELL
  #     ${SPARK_HOME}/sbin/start-slave.sh ${SPARK_MASTER_URL}
  #   SHELL
  # end
  config.vm.provision "shell", path: "change_source.sh"
  config.vm.provision "shell", inline: <<-SHELL
    echo 'Asia/Shanghai' > /etc/timezone
    apt-get update
    apt-get install -y ntpdate openjdk-8-jdk
  SHELL
  config.vm.provision "shell", name: 'makedirs', privileged: false, inline: <<-SHELL
    mkdir -p ~/.pip
  SHELL
  config.vm.provision "file", source: ".vimrc", destination: ".vimrc"
  config.vm.provision "file", source: "pip.conf", destination: ".pip/pip.conf"
  config.vm.provision "shell", path: "init_soft.sh"
  config.vm.provision "shell", run: "always", inline: <<-SHELL
    ntpdate time1.aliyun.com
    date
  SHELL
end
