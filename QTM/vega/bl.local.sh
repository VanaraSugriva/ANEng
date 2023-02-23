#!/usr/bin/bash

# check params:
if ([ -z "$1" ] || [ -z "$2" ]; then
echo "nls or login is empty";
exit 0
fi

# add nls:
echo $1 | sudo -u qt.support tee -a /home/qt.support/nls.blacklist ;
# add login:
echo $2 | sudo -u qt.support tee -a /home/qt.support/login.blacklist ;

# login check for @:

if [[ "$2" =~ [@] ]]; then
echo $2 | cut -d"@" -f1 | sudo -u qt.support tee -a /home/qt.support/login.blacklist ;
fi

# applying news:
sh /home/qt.support/./blacklist_apply.sh

# view changes:
tail -n2 /home/qt.support/*list;

# usage: bl.sh nls login
