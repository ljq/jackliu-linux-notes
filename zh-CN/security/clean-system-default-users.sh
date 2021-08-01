#!/bin/bash
# Linux系统安装部署后，删除无用的用户和组,最小权限原则
# Linux系统中可以删除的默认用户和组有：
# 删除的用户,如adm,lp,sync,shutdown,halt,news,uucp,operator,games,gopher等。
# 删除的组,如adm,lp,news,uucp,games,dip,pppusers,popusers,slipusers等。
# -----------------------------------------------------------------------------

# 删除不必要的系统用户和群组

# 删除不必要的用户
userdel adm
userdel lp
userdel sync
userdel shutdown
userdel halt
userdel news
userdel uucp
userdel operator
userdel games
userdel gopher
userdel ftp
# 删除不必要的群组
groupdel adm
groupdel lp
groupdel news
groupdel uucp
groupdel games
groupdel dip
groupdel pppusers
groupdel popusers
groupdel slipusers
