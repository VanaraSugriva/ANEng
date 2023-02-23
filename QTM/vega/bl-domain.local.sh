#!/usr/bin/bash
domain=$1;
echo $domain | sudo -u qt.support tee -a /opt/vega-dist/etc/domain.filter; 
sudo -u qt.support /home/qt.support/domain_apply.sh
