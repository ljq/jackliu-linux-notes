# GPG

GNU Privacy Guard

```

# 创建密钥 
$ gpg --gen-key

# 查看公钥 
$ gpg --list-key

# 查看私钥 
$ gpg --list-secret-key

# 公钥删除 
$ gpg --delete-keys 标识名

# 私钥删除 
$ gpg --delete-secret-keys 标识名

# 公钥导出 
$ gpg --export 标识名 > 导出文件名（多以gpg,asc为文件后缀）

# 私钥导出 
$ gpg --export-secret-key 标识名 > 导出文件名（多以asc为文件后缀）
s
# 密钥导入 
$ gpg --import 密钥文件

# 加密文件 
$ gpg --recipient 标识名 --encrypt 文件名

# 解密文件 
$ gpg --output 新文件名 --decrypt 加密文件名

# 修改密钥 
$ gpg --edit-key 标识名

```

### GPG公钥与私钥的备份

* 备份公钥: ```gpg -o keyfilename --export KeyID``` 如果没有KeyID则是备份所有的公钥，-o表示输出到文件keyfilename中，如果加上-a的参数则输出文本格式的信息，否则输出的是二进制格式信息。

* 备份私钥：```gpg -o keyfilename --export-secret-keys KeyID``` 如果没有KeyID则是备份所有的私钥，-o表示输出到文件keyfilename中，如果加上-a的参数则输出文本格式的信息，否则输出的是二进制格式信息。

* 导入密钥信息：```gpg --import filename```
