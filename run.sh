# run.sh
#解压tar包
tar -xzvf docker_install.tar.gz
#使用rpm安装所有包
rpm -ivh *.rpm

#启动docker服务
sudo systemctl start docker

#定义文件路径
file_path="/usr/lib/systemd/system/docker.service"

echo "更改TCP连接..."

#修改docker的连接为tcp连接，使用sed命令
sed -in-place -e's/ExecStart=\/usr\/bin\/dockerd-current \\/ExecStart=\/usr\/bin\/docker daemon -H tcp:\/\/0.0.0.0:2375 -H unix:\/\/\/var\/run\/docker.sock/' $file_path

echo "修改完成..."
#cat /Users/dzzxjl/Desktop/data_replace_test.txt

#重启docker
systemctl daemon-reload
systemctl restart docker
