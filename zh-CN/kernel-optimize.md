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


### 内核参数值优化

```kernel.wake_balance = 1```
导致调度运行线程被唤醒的任何avaialble调度的CPU。而不是它的CPU的优化的基础上缓存痕迹。默认为1

```kernel.suid_dumpable = 0```

```kernel.unknown_nmi_panic = 0```
该参数的值影响的行为（非屏蔽中断处理）。当这个值为非0，未知的NMI受阻，PANIC出现。这时，内核调试信息显示控制台，则可以减轻系统中的程序挂起。

```kernel.ngroups_max = 65536```
该文件显示了最大数量的补充群体用户可以是一个成员（内核的NGROUPS_MAX）的使用者。缺省值是65536，这可调似乎没有在任何地方使用最新的内核

```kernel.printk_ratelimit_burst = 10```
一段时间后，我们执行一个信息由printk_ratelimit秒钟，我们允许脉冲信息通过。Printk_ratelimit_burst指定信息数量。在ratelimiting开始起用前，我们提交出信息。

```kernel.printk_ratelimit = 5```
一些警告信息速度有限。Printk_ratelimit指定的最小长度的时间间隔这些信息（秒）。默认情况下，我们允许美5秒间隔。值为0时将禁用速率限制。

```kernel.panic_on_oops = 1```
控制内核的行为时遇到错误。

0 尝试继续运行。

1 延迟几秒钟（输出klogd时间记录），然后警告，如果警告sysctl也是非0后机器将重新启动。

```kernel.pid_max = 32768```
PID分配限制值。当内核下一个PID值到达这个值，它会回到最低的PID值。PID的最大的pid_max未分配，默认值为32768

```kernel.overflowgid = 65534 和 kernel.overflowuid = 65534```
这两个文件分别保存那些支持16位用户标识和组标识的任何文件系统的用户标识（UID）和组标识（GID）。可是更改这些值，但如果您确实觉得需要这样做，那么可能会发现更改组和密码文件项更容易些。

```kernel.pty.nr = 1```
这个只读文件表明多少unix的98假终端目前正在使用

```kernel.pty.max = 4096```
此文件规定的最大数量的unix 98 假终端。

```kernel.random.uuid = cbd55511-5292-4195-99f3-c7e0b5b87624```
这个只读文件包含随机字符串一样。一次是在系统启动后产生。另见：与/proc/sys/kernel/random/uuid.

```kernel.random.boot_id = 538713fc-3f16-4d9f-9c75-7e5e61c10ee9```
这个只读文件包含随机字符串一样。每次都会重新读。请参阅：/proc/sys/kernel/random/boot_id。

```kernel.random.write_wakeup_threshold = 128```
此文件包含二进制位数以下唤醒进程，做选择（）或查询（）的写权限的/dev/rrandom。

```kernel.random.read_wakeup_threshold = 64```
这个文件包含了很多信息片，他们有关于激活很多因等待查询/dev/random信息而休眠的进程。默认值为64。

```kernel.random.entropy_avail = 3456```
这个只读文件给出可用的平均信息量，通常，这个字为4096（bits）。一个全部的信息平均量的统筹。

```kernel.random.poolsize = 512```
这个文件提供平均信息数量池的大小。通常，这将是4096bits(512btyes).它可以将其更改为任何值的一种算法用。目前的选择是：32，64，128，256，512，1024，2048。

```kernel.threads-max = 139264```
该文件指定内核所能使用的线程的最大数目。

```kernel.cad_pid = 1```
按 ctrl-alt-del这个顺序 按下这些键 可以查到进程的id,init默认的id 是1

```kernel.sysrq = 0```
如果该文件指定的值为非0，则激活sysctem request key。默认值：0。

```kernel.sem = 250 32000 32 128```
该参数表示设置的信号量。

```kernel.msgmnb = 16384```
该文件指定在一个消息队列中最大的字节数 缺省设置：16384。

```kernel.msgmni = 16```
该文件指定消息队列标识的最大数目。缺省设置：16。

```kernel.msgmax = 8192```
该文件指定了从一个进程发送到另一个进程的消息最大长度。进程间的消息传递是在内核的内存中进行的。不会交换到硬盘上。所以如果增加该值，则将增加操作系统所使用的内存数量。

```kernel.shmmni = 4096```
该参数用于设置系统范围内共享内存段的最大数量，默认值为4096，通常不需要修改。

```kernel.shmall = 2097152```
该参数表示统一一次可以使用的共享内存总量（以页为单位）。默认是2097152，通常不需要修改。

```kernel.shmmax = 33554432```
该参数定义了共享内存段的最大尺寸（以字节为单位）。默认是32M。

```kernel.acct = 2 4 30```
该文件有三个配置值，根据包含日志的文件系统上可用空间的数量（以百分比表示），这些值控制何时开始进行进程记账，如果可用空间低于这个百分比值，则停止进程记账，如果可用共建高于这个百分比值，则开始进程记账。检查上面两个值得频率（以秒为单位）要更改这个文件的某个值，应该回送用空格分隔开的一串数字。默认值：2 4 30 如果包含日志的文件系统上只有少于2%的可用空间，则这些值会使记账停止，如果有4%或者更多的空间，则再次启动记账，每30秒做一次检查。

```kernel.hotplug = /sbin/hotplug```
hotplug的策略代理的位置，默认值是“/sbin/hotplug”

```kernel.modprobe = /sbin/modprobe```
这里是modprobe所存放的位置，使用这个程序按照要求装载模块。缺省值：”/sbin/modprobe”.

```kernel.printk = 6 4 1 7```
该文件有四个数字值，它们根据日志记录消息的重要性，定义将其发送到何处，关于不同日志级别的更多信息，请阅读syslog。该文件4个值为：

控制台日志级别，优先级高于该值的消息将打印值控制台。

缺省消息日志级别：将用该优先级来打印没有优先级的消息。

最低的控制台日志级别：控制台日志级别可被设置最小值（最高优先级）

缺省的控制台日志级别：控制台日志级别的缺省值、

缺省设置：6 4 1 7。

```kernel.ctrl-alt-del = 0```
该文件有一个二进制值，该值控制系统在接收到ctrl+alt+delete按键组合时如何反应，这两个关键值为0值表示捕获ctrl+alt+delete。并将其送至init程序。这将允许系统可以完美地关闭和重启，就好象你输入shutdown命令一样。1值表示不捕获ctrl+alt+delete，将执行非干净的关闭，就好象直接关闭电源一样。默认值为0。

```kernel.real-root-dev = 0```
如果你已经支持编译initrd内核这个是可以编译的。在这种情况下，如果“真”根设备可以从linux内部文件系统改变新的文件设备号

```kernel.cap-bound = -257```
这个参数所谓“性能限制规定”的使用者空间：列表功能，可以将

```kernel.tainted = 0```
如果内核已经被非零改变。数值可ORed在一起：

1 一个模块与非GPL许可已被载入，这包括模块没有授权。（把modutils和module-init-tools在一起。）

2 这个模块被insmod强制装入。（把modutils和module-init-tools）。

4 不安全的SMP处理器：CPU的SMP与SMP不适合。

8 一个模块被rommod强制卸载（把modutils和module-init-tools）

16 自动校验发生异常。

32 系统已达到bad_page

```kernel.core_pattern = core```
是用来指定一个核心DumpFlie可格局名称：最大长度是64个字符。默认值为：“core”。Core_pattern被用作一种模式模板的输出文件名。某些字符串的模式(从“%”)是取代其实际值。反向兼容core_uses_pid:如果core_pattern不包括“%，p值”（默认是不）和core_uses_pid设置，然后

```kernel.core_uses_pid = 1```
默认coredump filename是“核心”。通过设置core_uses_pid为1(默认值为0)，文件名的coredump成为核心PID。如果core_pattern不包括“%p”（默认是不）和core_uses_pid设置。那时pid将附加到文件名上。

```kernel.print-fatal-signals = 0```
这能够打印出一些关于用户在内核控制台出错的一些信息。它能记录早先的用户在那里出现了错误。默认是 off

```kernel.exec-shield-randomize = 1```
文件控制exec-shield是否要随机化VM映射。

0- 禁用随机化VM映射。

1- 启用随机化VM映射。

此选项默认值为1

```kernel.exec-shield = 1```
文件控制总体Exec-shield功能。这里他值有以下几个

0-（包括随机化的VM映射）在所有的二进制程序中被禁用，不管它是否已被标记。

1-在所有标记的二进制程序中被启用。

2-在所有二进制程序中被启用，不管它是否被标记）（仅用于测试目的）

此选项默认值为1.

```kernel.panic = 0```
该文件表示如果发生“内核严重错误（kernel panic）”，则内核在重新引导之前等待的时间（以秒为单位）。0秒设置在内发生内核严重错误时将禁止重新引导。缺省值：0

```kernel.domainname = (none)```
该文件允许配置网络域名。它没有缺省值，也许已经设置了域名。也许没有设置。

```kernel.hostname = localhost.localdomain```
该文件允许你配置网络主机名。

```kernel.version = #1 SMP Fri Apr 20 16:36:54 EDT 2007```
内核版本

```kernel.osrelease = 2.6.9-55.ELsmp```
内核OS 发布号

```kernel.ostype = Linux```
内核OS类型。
