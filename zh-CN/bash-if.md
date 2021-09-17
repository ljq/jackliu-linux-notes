```
[ -a ${file} ]  如果 ${file} 存在则为真。  
[ -b ${file} ]  如果 ${file} 存在且是一个块特殊文件则为真。  
[ -c ${file} ]  如果 ${file} 存在且是一个字特殊文件则为真。  
[ -d ${file} ]  如果 ${file} 存在且是一个目录则为真。  
[ -e ${file} ]  如果 ${file} 存在则为真。  
[ -f ${file} ]  如果 ${file} 存在且是一个普通文件则为真。  
[ -g ${file} ] 如果 ${file} 存在且已经设置了SGID则为真。 [ -h ${file} ]  如果 ${file} 存在且是一个符号连接则为真。  
[ -k ${file} ]  如果 ${file} 存在且已经设置了粘制位则为真。  
[ -p ${file} ]  如果 ${file} 存在且是一个名字管道(F如果O)则为真。  
[ -r ${file} ]  如果 ${file} 存在且是可读的则为真。  
[ -s ${file} ]  如果 ${file} 存在且大小不为0则为真。  
[ -t FD ]  如果文件描述符 FD 打开且指向一个终端则为真。  
[ -u ${file} ]  如果 ${file} 存在且设置了SUID (set user ID)则为真。  
[ -w ${file} ]  如果 ${file} 如果 ${file} 存在且是可写的则为真。  
[ -x ${file} ]  如果 ${file} 存在且是可执行的则为真。  
[ -O ${file} ]  如果 ${file} 存在且属有效用户ID则为真。  
[ -G ${file} ]  如果 ${file} 存在且属有效用户组则为真。  
[ -L ${file} ]  如果 ${file} 存在且是一个符号连接则为真。  
[ -N ${file} ]  如果 ${file} 存在 and has been mod如果ied since it was last read则为真。  
[ -S ${file} ]  如果 ${file} 存在且是一个套接字则为真。  
[ ${file}1 -nt ${file}2 ]  如果 ${file}1 has been changed more recently than ${file}2, or 如果 ${file}1 exists and ${file}2 does not则为真。  
[ ${file}1 -ot ${file}2 ]  如果 ${file}1 比 ${file}2 要老, 或者 ${file}2 存在且 ${file}1 不存在则为真。  
[ ${file}1 -ef ${file}2 ]  如果 ${file}1 和 ${file}2 指向相同的设备和节点号则为真。  
[ -o OPTIONNAME ]  如果 shell选项 "OPTIONNAME" 开启则为真。  
[ -z STRING ]  "STRING" 的长度为零则为真。  
[ -n STRING ] or [ STRING ]  "STRING" 的长度为非零 non-zero则为真。  
[ STRING1 == STRING2 ]  如果2个字符串相同。 "=" may be used instead of "==" for strict POSIX compliance则为真。  
[ STRING1 != STRING2 ]  如果字符串不相等则为真。 
[ STRING1 < STRING2 ]  如果 "STRING1" sorts before "STRING2" lexicographically in the current locale则为真。  
[ STRING1 > STRING2 ]  如果 "STRING1" sorts after "STRING2" lexicographically in the current locale则为真。  
[ ARG1 OP ARG2 ] "OP" is one of -eq, -ne, -lt, -le, -gt or -ge. These arithmetic binary operators return true if "ARG1" is equal to, not equal to, less than, less than or equal to, greater than, or greater than or equal to "ARG2", respectively. "ARG1" and "ARG2" are integers.
```
