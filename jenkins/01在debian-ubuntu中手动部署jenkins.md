# 更新本地软件包索引
我在root下，所以不用sudo
如果在windows下使用docker ubuntu镜像测试部署jenkins,不要忘记run容器的时候暴露端口-p 8080:8080,不然部署之后,外部无法访问
```sh
apt-get update
apt-get install wget
```

# Jenkins 的 Debian 软件包存储库，用于自动安装和升级。要使用此存储库，首先将密钥添加到您的系统（用于每周发布线）
```sh
wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
```

# 添加jenkins apt 存储库条目
```sh
#  echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
#     https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
#     /etc/apt/sources.list.d/jenkins.list > /dev/null

# 没用sudo
 echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
    https://pkg.jenkins.io/debian-stable binary/ | tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
```

# 刚刚做了些配置，继续更新本地包索引，并下载jenkins
```sh
apt-get update
apt-get install fontconfig openjdk-17-jre
apt-get install jenkins
```

# 启动jenkins
```sh
systemctl start jenkins

# docker中ubuntu容器的话,就直接输入jenkins就能启动了
```

# 以下是自己的,宿主机外部访问,run已经暴露了端口
```sh
宿主机(windows)IP:8080
这个密码在启动jenkins的时候就会在终端打印出来
输入76f0a32cde0d4960bfb4421a5a4a19cd管理员密码访问
密码在容器的这个路径下面,最好自己保存一下
/root/.jenkins/secrets/initialAdminPassword

jenkins重启密码也不会变
```

