# Centos7-Systemd-Service自定义编写Service应用服务配置说明整理


#### 系统基本service服务配置目录（此目录勿动，一般情况下只放系统核心基础服务配置，否存放应用注册类服务配置）：
/etc/systemd/system

#### 自定义服务配置管理目录（存放自定义应用注册类服务和第三方服务类配置）：
/usr/lib/systemd/system/

#### 自定义.service配置文件 (权限：754) 格式（以应用app-run.service为例, 执行文件作好超时处理！）：

```
[Unit]
Description="app-run@Author Jack Liu Process Daemon" 	# 服务描述
After=rc-local.service					# 服务类别：  
                                                        #       例启动顺序(默认在rc-local.service之后调用执行)  

[Service]
Type=forking						# 优先使用forking方式:
                                                        #       (遵循传统Unix做法,设置PIDFile=选项
                                                        #        帮助systemd准确定位该服务的主进程)
PIDFile=/var/run/app-run.pid				# 设置应用进程的PID（缺省）
Environment="GOPATH=/usr/local/go"                      # 环境变量设置，可设置多个Environment=项
                                                        #    备注：Environment= 或 EnvironmentFile=
                                                        #         引用文件, 两种方式皆可
ExecStart=/data/auto_run.sh start			# 调用启动可执行文件：  
                                                        #        （Service配置全部使用绝对路径，  
                                                        #         可执行文件内命令用绝对的路径格式）  
ExecReload=/data/auto_run.sh reload                     # 重新加载（缺省）
ExecStop=/data/auto_run.sh stop                         # 停止服务（缺省）
DefaultTimeoutStartSec=30                               # 服务启动允许的最大时长，超时时间（默认无单位:秒）  
                                                        #     单位："ms"(毫秒), "s"(秒), "min"(分钟),
                                                        #           "h"(小时), "d"(天), "w"(周)  
PrivateTmp=True						# 是否分配独立的临时空间（缺省）								

[Install]
WantedBy=multi-user.target
```

###### EnvironmentFile默认约定引用存放目录一般为：/usr/lib/systemd/system/app-run.service.d/environment.conf（格式：Key=Value）


#### Service服务管理常用操作命令
```
在开机时启用一个服务：systemctl enable app-run.service  
在开机时禁用一个服务：systemctl disable app-run.service
启动一个服务：systemctl start app-run.service  
关闭一个服务：systemctl stop app-run.service  
重启一个服务：systemctl restart app-run.service  
显示一个服务的状态：systemctl status app-run.service    
查看服务是否开机启动：systemctl is-enabled app-run.service  
查看已启动的服务列表：systemctl list-unit-files|grep enabled  
```

###### 注意：服务无法执行检查SElinux是否开启，自行关闭SElinux。
