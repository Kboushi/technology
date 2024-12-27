# 创建两个ssh密钥

```bash
ssh-keygen -C "ok1@tt.com"
ssh-keygen -C "fd2@dd.net"

Enter file in which to save the key 不要在创建第二个把第一个覆盖了，换一个名字，比如id_rsa_second
```

这样在.ssh你就有两份ssh公私钥了

假如私钥分别是

id_rsa

id_rsa_second

在.ssh文件夹下创建config文件

```bash
# ok1@tt.com
host git1
    hostname github.com
    Port 22
    User ok1
    PreferredAuthentications publickey
    IdentityFile .ssh的文件夹位置/id_rsa  windows 是\, linux是/
# fd2@dd.com
host git2
    hostname github.com
    Port 22
    User fd2
    PreferredAuthentications publickey
    IdentityFile .ssh的文件夹位置/id_rsa_second

```

# clone

clone第二个github

git clone git@git2:-----.git

这里的git2是host名字
