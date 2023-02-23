#!/usr/bin/bash

if ([ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]);
then
    echo "nls or login or MRF is empty"
    exit 0
fi

if [ $3 = "center" ]; then echo center;
ssh vega-m9 << 'ENDSSH'
echo $1 | sudo -u qt.support tee -a /home/qt.support/nls.blacklist ; 
echo $2 | sudo -u qt.support tee -a /home/qt.support/login.blacklist ;
if [[ "$2" =~ [@] ]]; then
echo $2 | cut -d"@" -f1 | sudo -u qt.support tee -a /home/qt.support/login.blacklist ;
fi
sh /home/qt.support/./blacklist_apply.sh
tail -n2 /home/qt.support/*list;
ENDSSH
ssh vega-m10 << 'ENDSSH'
echo $1 | sudo -u qt.support tee -a /home/qt.support/nls.blacklist ; 
echo $2 | sudo -u qt.support tee -a /home/qt.support/login.blacklist ;
if [[ "$2" =~ [@] ]]; then
echo $2 | cut -d"@" -f1 | sudo -u qt.support tee -a /home/qt.support/login.blacklist ;
fi
sh /home/qt.support/./blacklist_apply.sh
tail -n2 /home/qt.support/*list;
ENDSSH
elif [ $3 = "sz" ]; then echo sz;
ssh vega-sz << 'ENDSSH'
echo $1 | sudo -u qt.support tee -a /home/qt.support/nls.blacklist ; 
echo $2 | sudo -u qt.support tee -a /home/qt.support/login.blacklist ;
if [[ "$2" =~ [@] ]]; then
echo $2 | cut -d"@" -f1 | sudo -u qt.support tee -a /home/qt.support/login.blacklist ;
fi
sh /home/qt.support/./blacklist_apply.sh
tail -n2 /home/qt.support/*list;
ENDSSH
elif [ $3 = "volga" ]; then echo volga;
ssh vega-volga /bin/bash << 'ENDSSH' 
echo $1 | sudo -u qt.support tee -a /home/qt.support/nls.blacklist ; 
echo $2 | sudo -u qt.support tee -a /home/qt.support/login.blacklist ;
if [[ "$2" =~ [@] ]]; then
echo $2 | cut -d"@" -f1 | sudo -u qt.support tee -a /home/qt.support/login.blacklist ;
fi
sh /home/qt.support/./blacklist_apply.sh
tail -n2 /home/qt.support/*list;
ENDSSH
elif [ $3 = "ural" ]; then echo ural;
ssh -T vega-ural << 'ENDSSH'
echo $1 | sudo -u qt.support tee -a /home/qt.support/nls.blacklist ; 
echo $2 | sudo -u qt.support tee -a /home/qt.support/login.blacklist ;
if [[ "$2" =~ [@] ]]; then
echo $2 | cut -d"@" -f1 | sudo -u qt.support tee -a /home/qt.support/login.blacklist ;
fi
sh /home/qt.support/./blacklist_apply.sh
tail -n2 /home/qt.support/*list;
ENDSSH
elif [ $3 = "dv" ]; then echo dv;
ssh vega-dv << 'ENDSSH'
echo $1 | sudo -u qt.support tee -a /home/qt.support/nls.blacklist ; 
echo $2 | sudo -u qt.support tee -a /home/qt.support/login.blacklist ;
if [[ "$2" =~ [@] ]]; then
echo $2 | cut -d"@" -f1 | sudo -u qt.support tee -a /home/qt.support/login.blacklist ;
fi
sh /home/qt.support/./blacklist_apply.sh
tail -n2 /home/qt.support/*list;
ENDSSH
elif [ $3 = "sibir" ]; then echo sibir;
ssh vega-sibir << 'ENDSSH'
echo $1 | sudo -u qt.support tee -a /home/qt.support/nls.blacklist ; 
echo $2 | sudo -u qt.support tee -a /home/qt.support/login.blacklist ;
if [[ "$2" =~ [@] ]]; then
echo $2 | cut -d"@" -f1 | sudo -u qt.support tee -a /home/qt.support/login.blacklist ;
fi
sh /home/qt.support/./blacklist_apply.sh
tail -n2 /home/qt.support/*list;
ENDSSH
elif [ $3 = "yug" ]; then echo yug;
ssh vega-yug << 'ENDSSH'
echo $1 | sudo -u qt.support tee -a /home/qt.support/nls.blacklist ; 
echo $2 | sudo -u qt.support tee -a /home/qt.support/login.blacklist ;
if [[ "$2" =~ [@] ]]; then
echo $2 | cut -d"@" -f1 | sudo -u qt.support tee -a /home/qt.support/login.blacklist ;
fi
sh /home/qt.support/./blacklist_apply.sh
tail -n2 /home/qt.support/*list;
ENDSSH
fi
