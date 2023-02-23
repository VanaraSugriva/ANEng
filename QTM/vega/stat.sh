#!/bin/bash

rm -r /tmp/1 /tmp/2 2>/dev/null
mkdir /tmp/1 /tmp/2

scp u.user@ip:/var/log/nginx/main/access.log /tmp/1
scp u.user@ip:/var/log/nginx/main/access.log /tmp/2

# use rsync: 
# rsync -avzhue ssh --progress u.user@ip:/var/log/nginx/main/access.log ./1/access.log
# rsync -avzhue ssh --progress u.user@ip:/var/log/nginx/main/access.log ./2/access.log

# for date by regexp user input:
# read -p 'paste date regexp like: 26/Nov/2020|27/Nov/2020|28/Nov/2020|29/Nov/2020|30/Nov/2020: ' date;

date=$(date -d "-1 day" +"%d/%b/%Y") # yesterday date

echo -e "\nrt-stv-adblock-1 rt-stv-adblock-2  $date  \n"
echo -n "blockpage: "
cat /tmp/1/access.log /tmp/2/access.log | grep -E "$date" | grep "GET /block?" | wc -l
echo -n "blockpage uniq: "
cat /tmp/1/access.log /tmp/2/access.log | grep -E "$date" | grep "GET /block?" | awk '{print $1}' | sort | uniq | wc -l
echo -n "pay_now: "
cat /tmp/1/access.log /tmp/2/access.log | grep -E "$date" | grep "POST" | grep pay_now | wc -l
echo -n "pay_now uniq: "
cat /tmp/1/access.log /tmp/2/access.log | grep -E "$date" | grep "POST" | grep pay_now | awk '{print $1}' | sort | uniq | wc -l
echo -n "pay_later: "
cat /tmp/1/access.log /tmp/2/access.log | grep -E "$date" | grep "POST" | grep pay_later | wc -l
echo -n "pay_later uniq: "
cat /tmp/1/access.log /tmp/2/access.log | grep -E "$date" | grep "POST" | grep pay_later | awk '{print $1}' | sort | uniq | wc -l

rm -r /tmp/1 /tmp/2
