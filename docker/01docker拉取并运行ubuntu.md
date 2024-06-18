# docker拉取ubuntu
```sh
# docker自动拉取default tag: latest
docker pull ubuntu

# Using default tag: latest
# latest: Pulling from library/ubuntu
# 9c704ecd0c69: Pull complete
# Digest: sha256:2e863c44b718727c860746568e1d54afd13b2fa71b160f5cd9058fc436217b30
# Status: Downloaded newer image for ubuntu:latest
# docker.io/library/ubuntu:latest

# What's Next?
#   View a summary of image vulnerabilities and recommendations → docker scout quickview ubuntu

```

# 创建并运行容器
```sh
# -it 表示以交互式的方式运行容器，--name表示指定容器的名称
docker run -it --name jenkins-ubuntu ubuntu
# root@edd469e325e0:/# 
# 我们可以exit退出来, 但是会终止容器，使用exec命令，再使用exit不会终止容器

# -a是查看隐藏的容器，因为状态是退出（exited），所以被隐藏了
docker container ls -a
# CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS                
#           PORTS     NAMES
# edd469e325e0   ubuntu    "/bin/bash"   2 minutes ago   Exited (0) About a minute ago             jenkins-ubuntu

# docker重新启动容器，此时状态为up，启动了不代表你进入容器了
docker restart jenkins-ubuntu
# CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS         PORTS     NAMES
# edd469e325e0   ubuntu    "/bin/bash"   6 minutes ago   Up 8 seconds          
#    jenkins-ubuntu
```

# 进入容器
```sh
# 使用exec进入容器，此命令将在当前终端打开一个新的bash会话，并连接到jenkins-ubuntu容器
docker exec -it jenkins-ubuntu bash
# root@edd469e325e0:/# 
# 使用exit，也不会终止容器
docker container ls
# status是up
# CONTAINER ID   IMAGE     COMMAND       CREATED          STATUS         PORTS     NAMES
# edd469e325e0   ubuntu    "/bin/bash"   13 minutes ago   Up 6 minutes             jenkins-ubuntu
```

# 在容器中执行命令
```sh
# 查看当前系统
uname -a 
apt-get update
```
