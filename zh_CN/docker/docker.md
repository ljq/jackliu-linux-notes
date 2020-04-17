# Docker命令指令

```
attach    attach到一个运行中的容器
build     从Dockefile中建立一个镜像
commit    从一个修改后的容器创建一个新的镜像
create    创建一下新容器 
diff      检查容器中文件的改变 
exec      在一个运行中的容器执行一个命令 
images    镜像列表   （ Docker获取与列出Images镜像详情 ）
info      显示系统信息
kill      kill 一个运行中的容器
login     登录到docker 注册服务器 
logout    从docker注册服务器退出
pause     暂停某一容器的所有进程
push      上传镜像或资源库到Docker注册服务器 
rename    重命名一个存在的容器
search    在Docker Hub上搜索一个镜像 
stats     显示容器使用资源的一系列的统计信息
cp        从一个容器文件系统中拷贝文件/目录到主机
unpause   取消暂停的容器
    sudo docker cp 7bb0e258aefe:/etc/debian_version
    拷贝7bb0e258aefe中的/etc/debian_version到当前目录下
    注意：只要7bb0e258aefe没有被删除，文件命名空间就还在，可以放心的把exit状态的container的文件拷贝出来
import    从压缩的文件中创建一个新文件系统镜像
    docker import url|-  "o">[repository[:tag "o">]]
    cat export.tar  "p">| docker import - imported-nginx:latest
    docker import http://example.com/export.tar
    从归档文件（支持远程文件）创建一个镜像， export 的逆操作，可为导入镜像打上标签。导出后导入（exported-imported)）的容器会丢失所有的提交历史，无法回滚
inspect   返回容器或镜像底层信息
    docker instpect nginx:latest
    docker inspect nginx-container
    检查镜像或者容器的参数，默认返回 JSON 格式
    -f 指定返回值的模板文件。
load      从归档的tar中加载一个镜像
    docker load [options]
    docker load < debian.tar
    docker load -i "debian.tar"
    从 tar 镜像归档中载入镜像， docker save 的逆操作。保存后再加载（saved-loaded）的镜像不会丢失提交历史和层，可以回滚
    -i "debian.tar" 指定载入的镜像归档。
logs      获取容器操作日志
     -f 跟踪容器日志的最近更新
     -t 显示容器日志的时间戳
     --tail="10" 仅列出最新10条容器日志
ps        容器列表
    -a 列出所有容器（含沉睡镜像）
    --before="nginx" 列出在某一容器之前创建的容器，接受容器名称和ID作为参数
    --since="nginx" 列出在某一容器之后创建的容器，接受容器名称和ID作为参数
    -f [exited=<int>] 列出满足
    exited=<int> 条件的容器
    -l 仅列出最新创建的一个容器
    --no-trunc 显示完整的容器ID
    -n=4 列出最近创建的4个容器
    -q 仅列出容器ID
    -s 显示容器大小
pull      从Docker注册服务器下载镜像或资源库
          将镜像推送至远程仓库，默认为 Docker Hub 
rm        删除一个或多个容器
    docker rm [options "o">] <container>  "o">[container...]
    docker rm nginx-01 nginx-02 db-01 db-02
    sudo docker rm -l /webapp/redis
    -f强行移除该容器，即使其正在运行
    -l 移除容器间的网络连接，而非容器本身
    -v 移除与容器关联的空间
rmi       删除一个或多个镜像
    docker rmi [options "o">] <image>  "o">[image...]
    docker rmi nginx:latest postgres:latest python:latest
    从本地移除一个或多个指定的镜像
    -f 强行移除该镜像，即使其正被使用
    --no-prune 不移除该镜像的过程镜像，默认移除
run       在一个新的容器中运行一个命令
    -a stdin 指定标准输入输出内容类型，可选 STDIN/
    STDOUT / STDERR 三项；
    -d 后台运行容器，并返回容器ID；
    -i 以交互模式运行容器，通常与 -t 同时使用；
    -t 为容器重新分配一个伪输入终端，通常与 -i 同时使用；
    --name="nginx-lb" 为容器指定一个名称；
    --dns 8.8.8.8 指定容器使用的DNS服务器，默认和宿主一致；
    --dns-search example.com 指定容器DNS搜索域名，默认和宿主一致；
    -h "mars" 指定容器的hostname；
    -e username="ritchie" 设置环境变量；
    --env-file=[] 从指定文件读入环境变量；
    --cpuset="0-2" or --cpuset="0,1,2"
    绑定容器到指定CPU运行；
save      保存一个镜像到一个归档文件
    docker save -i "debian.tar"
    docker save -i "debian.tar"
    docker save > "debian.tar"
    将指定镜像保存成 tar 归档文件， docker load 的逆操作。保存后再加载（saved-loaded）的镜像不会丢失提交历史和层，可以回滚
    -o "debian.tar" 指定保存的镜像归档
start|stop|restart 启动、停止和重启一个或多个指定容器
    docker start|stop "p">|restart [options "o">] <container>  "o">[container...]
    -a 待完成
    -i 启动一个容器并进入交互模式；
    -t 10 停止或者重启容器的超时时间（秒），超时后系统将杀死进程。
kill      杀死一个或多个指定容器进程
    -s "KILL" 自定义发送至容器的信号
top       查看容器中运行的进程
    docker top <running_container>  "o">[ps options]
    查看一个正在运行容器进程，支持 ps 命令参数
history
    docker history  "o">[options] <image> 查看指定镜像的创建历史
    --no-trunc 显示完整的提交记录
    -q 仅列出提交记录ID
events    从服务器拉取个人动态，可选择时间区间
    ocker events [options "o">]
    docker events --since= "s2">"20141020"
    docker events --until= "s2">"20120310"
export
    docker export <container>
    docker export nginx-01 > export.tar
    将指定的容器保存成 tar 归档文件， docker import 的逆操作。导出后导入（exported-imported)）的容器会丢失所有的提交历史，无法回滚
tag
    docker tag [options "o">] <image>[:tag "o">] [repository/ "o">][username/]name "o">[:tag]
    标记本地镜像，将其归入某一仓库
    -f 覆盖已有标记。

```


