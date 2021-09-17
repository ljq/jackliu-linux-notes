```
[ -a ${file} ] True if ${file} exists.
[ -b ${file} ] True if ${file} exists and is a block-specific file.
[ -c ${file} ] True if ${file} exists and is a word special file.
[ -d ${file} ] True if ${file} exists and is a directory.
[ -e ${file} ] True if ${file} exists.
[ -f ${file} ] True if ${file} exists and is a normal file.
[ -g ${file} ] True if ${file} exists and SGID has been set. [ -h ${file} ] True if ${file} exists and is a symbolic link.
[ -k ${file} ] True if ${file} exists and the sticky bit has been set.
[ -p ${file} ] True if ${file} exists and is a name pipe (F if O).
[ -r ${file} ] True if ${file} exists and is readable.
[ -s ${file} ] True if ${file} exists and the size is not 0.
[ -t FD] True if the file descriptor FD is open and points to a terminal.
[ -u ${file} ] True if ${file} exists and SUID (set user ID) is set.
[ -w ${file} ] True if ${file} exists and is writable.
[ -x ${file} ] True if ${file} exists and is executable.
[ -o ${file} ] True if ${file} exists and is a valid user ID.
[ -g ${file} ] True if ${file} exists and belongs to a valid user group.
[ -l ${file} ] True if ${file} exists and is a symbolic link.
[ -n ${file} ] If ${file} exists and has been mod if IED since it was last read
[ -s ${file} ] True if ${file} exists and is a socket.
[ ${file}1 -nt ${file}2 ] ${file}1 has been changed more recently than ${file}2, Or if ${file}1 exists and ${file}2 does not.
${file}1 -ot ${file}2 -ot ${file}2 -ot ${file}2 -ot ${file}2 -ot ${file}2
[ ${file}1 -ef ${file}2 ] True if ${file}1 and ${file}2 point to the same device and node number.
[ -o OPTIONNAME ] True if shell option "OPTIONNAME" is enabled.
[ -z STRING ] True if the length of "STRING" is zero.
[ -n STRING ] or [ STRING ] If the length of "STRING" is non-zero, it is true.
[ STRING1 == STRING2 ] If two strings are the same. "=" may be used instead of "==" for strict POSIX compliance is true
[ STRING1!= STRING2 ] True if strings are not equal.
[ STRING1 < STRING2 ] Is true if "STRING1" sorts before "STRING2" lexicographically in the current locale.
[ STRING1 > STRING2 ] True if "STRING1" sorts after "STRING2" lexicographically in the current locale.
[ ARG1 OP ARG2 ] "OP" is one of -eq, -ne, -lt, -le, -gt or -ge. These arithmetic binary operators return true if "ARG1" is equal to, not equal to, less than, less than or equal to, greater than, or greater than or equal to "ARG2", respectively. "ARG1" and "ARG2" are integers.
```
