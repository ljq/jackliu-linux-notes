### 配置文件体系


### 配置文件

###### 全局
```
/etc/ssh/

# 保存Diffie-Hellman组通过密钥交换构建安全的网络传输层
/etc/ssh/moduli

# 缺省的SSH客户端配置文件
/etc/ssh/ssh_config

# sshd守护进程的配置文件
/etc/ssh/sshd _config

# sshd守护进程的DSA私钥
/etc/ssh/ssh_host_dsa_key

# sshd守护进程的DSA公钥
/etc/ssh/ssh_host_dsa_key.pub

# sshd守护进程的SSH协议版本1的RAS私钥
/etc/ssh/ssh_host_key

# sshd守护进程的SSH协议版本1的RAS公钥
/etc/ssh/ssh_host_key.pub

# sshd守护进程的SSH协议版本2的RAS私钥
/etc/ssh/ssh_host_rsa_key

# sshd守护进程的SSH协议版本2的RAS公钥
/etc/ssh/ssh_ho st_rsa_key.pub

# sshd守护进程的PAM配置文件
/etc/pam.d/sshd 

# sshd服务的配置文件
/etc/sysconfig/sshd 

```

###### 用户
```
~/.ssh/

# 服务器用来验证SSH客户端的客户公钥
~/.ssh/authorized_keys

# 用户的DSA私钥
~/.ssh/id_dsa 

# 用户的DSA公钥
~/.ssh/id_dsa. pub

# 用户的SSH协议版本2的RSA私钥
~/.ssh/id_rsa 

# 用户的SSH协议版本2的RSA公钥
~/.ssh/id_rsa.pub

# 用户的SSH协议版本1的RSA私钥 
~/.ssh/identity

# 用户的SSH协议版本的RSA公钥
~/.ssh/identity.pub

# 用户连接的SSH服务器公钥
~/.ssh/known_hosts 

```


### SSH Tunnel 安全隧道


