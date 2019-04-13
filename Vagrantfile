# -*- mode: ruby -*-
# vi: set ft=ruby :

#
$clusters_script = <<-SCRIPT
#!/bin/bash

# at /home/vagrant
#---hosts---
cat >> /etc/hosts <<EOF

192.168.33.101  node1
192.168.33.102  node2
192.168.33.103  node3

EOF
#---ssh_config-----
cat >> /etc/ssh/ssh_config <<EOF

StrictHostKeyChecking no

UserKnownHostsFile /dev/null

EOF
# install expect,wget,lrzsz
sudo yum install expect -y
sudo yum install wget -y
sudo yum install lrzsz -y


#---env---
cat >> /root/.bashrc <<EOF
export JAVA_HOME=/home/vagrant/jdk

export HADOOP_HOME=/home/vagrant/hadoop
export PATH=$PATH:$HADOOP_HOME/bin/:$HADOOP_HOME/sbin:$JAVA_HOME/bin
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
alias ll='ls -al'
EOF
source /root/.bashrc

cat >> .bashrc <<EOF
export HADOOP_HOME=/home/vagrant/hadoop
export JAVA_HOME=/home/vagrant/jdk
export PATH=$PATH:$HADOOP_HOME/bin/:$HADOOP_HOME/sbin:$JAVA_HOME/bin
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
alias ll='ls -al'
EOF
source .bashrc


#---hadoop---
tar -zxf hadoop-2.8.5.tar.gz
mv hadoop-2.8.5 hadoop
mv env/*  hadoop/etc/hadoop/
sudo mkdir -p $HADOOP_HOME/data/namenode
sudo mkdir -p $HADOOP_HOME/hadoop/data/namenode
sudo mkdir -p $HADOOP_HOME/hadoop/tmp
sudo chown -R vagrant hadoop
cp $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.8.5.jar ./



#---jdk---
tar -zxf jdk-8u201-linux-x64.tar.gz
mv jdk1* jdk
sudo chown -R vagrant jdk

#install pssh
tar xf pssh-2.3.1.tar.gz
cd ./pssh-2.3.1/
sudo python setup.py install
cd ..
chmod +x *.sh
rm -f *.gz
#---ssh---
mv /home/vagrant/sshd_config /etc/ssh/sshd_config
systemctl restart sshd.service

SCRIPT


Vagrant.configure("2") do |config|

		(1..3).each do |i|
		config.vm.define "node#{i}" do |node|
	
		# 设置虚拟机的Box
		node.vm.box = "centos/7"
		# 设置虚拟机的主机名
		node.vm.hostname="node#{i}"
		# 设置虚拟机的IP
		node.vm.network "private_network", ip: "192.168.33.#{100+i}"

		# 设置主机与虚拟机的共享目录
		#node.vm.synced_folder "~/Desktop/share", "/home/vagrant/share"
		# 复制相应的依赖文件
		config.vm.provision "file", source: "./jdk-8u201-linux-x64.tar.gz", destination: "/home/vagrant/jdk-8u201-linux-x64.tar.gz"
		config.vm.provision "file", source: "./hadoop-2.8.5.tar.gz", destination: "/home/vagrant/hadoop-2.8.5.tar.gz"
		config.vm.provision "file", source: "./sshd_config", destination: "/home/vagrant/sshd_config"
		config.vm.provision "file", source: "./host_ip.txt", destination: "/home/vagrant/host_ip.txt"
		config.vm.provision "file", source: "./ip.txt", destination: "/home/vagrant/ip.txt"
		config.vm.provision "file", source: "./pssh-2.3.1.tar.gz", destination: "/home/vagrant/pssh-2.3.1.tar.gz"
		config.vm.provision "file", source: "./ssh_ip.sh", destination: "/home/vagrant/ssh_ip.sh"
		config.vm.provision "file", source: "./env", destination: "/home/vagrant/env"
		config.vm.provision "file", source: "./test", destination: "/home/vagrant/test"

		# VirtaulBox相关配置
		node.vm.provider "virtualbox" do |v|
			# 设置虚拟机的名称
			v.name = "node#{i}"
			# 设置虚拟机的内存大小  
			v.memory = 2048
			# 设置虚拟机的CPU个数
			v.cpus = 1
		end
		node.vm.provision "shell", inline: $clusters_script # 使用shell脚本进行软件安装和配置
		end
	end
end
