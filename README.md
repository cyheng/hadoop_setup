# hadoop

## hadoop 集群
####三个节点node1 node2 node3

- 安装vagrant
- 下载jdk-8u201-linux-x64.tar.gz
- 下载hadoop-2.8.5.tar.gz

```bash
vagrant up
```

- 登录到node1,下面的作用是ssh免密登录

```bash
vagrant ssh node1
./ssh_ip.sh
pscp -h ip.txt  ~/ssh_ip.sh /home/vagrant 
pssh -h ip.txt -i bash ~/ssh_ip.sh
```

- start hadoop

```bash
cd ~/test
chmod +x *.sh
hdfs namenode -format
./startAll.sh
./start-example.sh
```




