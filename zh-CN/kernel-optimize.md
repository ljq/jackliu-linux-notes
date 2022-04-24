# 内核关键参数优化

#### /proc/sys/net/core/wmem_max
最大socket写buffer,可参考的优化值:873200

#### /proc/sys/net/core/rmem_max
最大socket读buffer,可参考的优化值:873200

#### /proc/sys/net/ipv4/tcp_wmem
TCP写buffer,可参考的优化值: 8192 436600 873200

#### /proc/sys/net/ipv4/tcp_rmem
TCP读buffer,可参考的优化值: 32768 436600 873200

#### /proc/sys/net/ipv4/tcp_mem
同样有3个值,意思是:
net.ipv4.tcp_mem[0]:低于此值,TCP没有内存压力.
net.ipv4.tcp_mem[1]:在此值下,进入内存压力阶段.
net.ipv4.tcp_mem[2]:高于此值,TCP拒绝分配socket.
上述内存单位是页,而不是字节.可参考的优化值是:786432 1048576 1572864

#### /proc/sys/net/core/netdev_max_backlog
进入包的最大设备队列.默认是300,对重负载服务器而言,该值太低,可调整到1000.

#### /proc/sys/net/core/somaxconn
listen()的默认参数,挂起请求的最大数量.默认是128.对繁忙的服务器,增加该值有助于网络性能.可调整到256.

#### /proc/sys/net/core/optmem_max
socket buffer的最大初始化值,默认10K.

#### /proc/sys/net/ipv4/tcp_max_syn_backlog
进入SYN包的最大请求队列.默认1024.对重负载服务器,增加该值显然有好处.可调整到2048.

#### /proc/sys/net/ipv4/tcp_retries2
TCP失败重传次数,默认值15,意味着重传15次才彻底放弃.可减少到5,以尽早释放内核资源.

#### /proc/sys/net/ipv4/tcp_keepalive_time
#### /proc/sys/net/ipv4/tcp_keepalive_intvl
#### /proc/sys/net/ipv4/tcp_keepalive_probes
这3个参数与TCP KeepAlive有关.默认值是:

tcp_keepalive_time = 7200 seconds (2 hours)
tcp_keepalive_probes = 9
tcp_keepalive_intvl = 75 seconds

意思是如果某个TCP连接在idle 2个小时后,内核才发起probe.如果probe 9次(每次75秒)不成功,内核才彻底放弃,认为该连接已失效.对服务器而言,显然上述值太大. 可调整到:
```
/proc/sys/net/ipv4/tcp_keepalive_time 1800
/proc/sys/net/ipv4/tcp_keepalive_intvl 30
/proc/sys/net/ipv4/tcp_keepalive_probes 3
```

#### proc/sys/net/ipv4/ip_local_port_range
指定端口范围的一个配置,默认是32768 61000,已够大.

 

```net.ipv4.tcp_syncookies = 1```
表示开启SYN Cookies。当出现SYN等待队列溢出时，启用cookies来处理，可防范少量SYN攻击，默认为0，表示关闭；

```net.ipv4.tcp_tw_reuse = 1```
表示开启重用。允许将TIME-WAIT sockets重新用于新的TCP连接，默认为0，表示关闭；

```net.ipv4.tcp_tw_recycle = 1```
表示开启TCP连接中TIME-WAIT sockets的快速回收，默认为0，表示关闭。

```net.ipv4.tcp_fin_timeout = 30```
表示如果套接字由本端要求关闭，这个参数决定了它保持在FIN-WAIT-2状态的时间。

```net.ipv4.tcp_keepalive_time = 1200```
表示当keepalive起用的时候，TCP发送keepalive消息的频度。缺省是2小时，改为20分钟。

```net.ipv4.ip_local_port_range = 1024 65000```
表示用于向外连接的端口范围。缺省情况下很小：32768到61000，改为1024到65000。

```net.ipv4.tcp_max_syn_backlog = 8192```
表示SYN队列的长度，默认为1024，加大队列长度为8192，可以容纳更多等待连接的网络连接数。

```net.ipv4.tcp_max_tw_buckets = 5000```
表示系统同时保持TIME_WAIT套接字的最大数量，如果超过这个数字，TIME_WAIT套接字将立刻被清除并打印警告信息。默认为180000，改为 5000。对于Apache、Nginx等服务器，上几行的参数可以很好地减少TIME_WAIT套接字数量，但是对于Squid，效果却不大。此项参数可以控制TIME_WAIT套接字的最大数量，避免Squid服务器被大量的TIME_WAIT套接字拖死

