#!/bin/bash
# After the Linux system is installed and deployed, remove unwanted users and groups, the minimum permission principle
# The default users and groups that can be removed from the Linux system are:
#
# delete users, such as adm, lp, sync, shutdown, the halt, news, uucp, operator, games, gopher, ...
# remove groups, such as adm, lp, news, uucp, games, dip, pppusers, popusers, slipusers, ...
# ------------------------------------------------------------------------------------------------------------------------

# Remove unnecessary system users and groups

# Remove unnecessary users
Userdel adm
Userdel lp
Userdel sync
Userdel shutdown
Userdel the halt
Userdel news
Userdel uucp
Userdel operator
Userdel games
Userdel gopher
Userdel ftp

# Remove unnecessary groups
Groupdel adm
Groupdel lp
Groupdel news
Groupdel uucp
Groupdel games
Groupdel dip
Groupdel pppusers
Groupdel popusers
Groupdel slipusers
