#!/bin/bash
# After the Linux system is installed and deployed, remove unwanted users and groups, the minimum permission principle
# The default users and groups that can be removed from the Linux system are:
#
# delete users, such as adm, lp, sync, shutdown, the halt, news, uucp, operator, games, gopher, ...
# remove groups, such as adm, lp, news, uucp, games, dip, pppusers, popusers, slipusers, ...
# ------------------------------------------------------------------------------------------------------------------------

# Remove unnecessary system users and groups

# Remove unnecessary users
userdel adm
userdel lp
userdel sync
userdel shutdown
userdel the halt
userdel news
userdel uucp
userdel operator
userdel games
userdel gopher
userdel ftp

# Remove unnecessary groups
groupdel adm
groupdel lp
groupdel news
groupdel uucp
groupdel games
groupdel dip
groupdel pppusers
groupdel popusers
groupdel slipusers
