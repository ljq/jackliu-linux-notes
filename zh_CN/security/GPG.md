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