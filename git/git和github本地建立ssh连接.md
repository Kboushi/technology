# 配置步骤

本地电脑生成ssh
先执行以下步骤，在用户宿主目录下创建.ssh文件夹，并在其中生成密密钥：

```shell
# windows的话就是在用户文件下面比如c:\users\kboushi\.ssh
mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -t rsa -C xxxx@qq.com
```

根据提示按回车，3次回车，生成私钥和公钥。私钥自己保留，公钥需要告诉我们要访问的ssh服务器，也就是github。

生成的私钥和公钥： 私钥：.ssh/id-rsa 公钥：.ssh/id_rsa.pub

将公钥拷贝给github即可