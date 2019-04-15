# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export HADOOP_HOME=/home/vagrant/hadoop
export JAVA_HOME=/home/vagrant/jdk
export PATH=/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/bin/:/sbin:/bin:/home/vagrant/hadoop/bin/:/home/vagrant/hadoop/sbin:/home/vagrant/jdk/bin
export HADOOP_CONF_DIR=/home/vagrant/hadoop/etc/hadoop
alias ll='ls -al'
alias hjs='hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-2.8.5.jar'
alias hput='hadoop dfs -copyFromLocal'
alias hls='hadoop dfs -ls'
alias hrm='hadoop dfs -rm'
