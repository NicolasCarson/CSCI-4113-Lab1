#!/bin/bash
#Nicolas Carson Lab 1 CSCI:4113

clear

freeram=$(free -m | awk '/^Mem/ {print $3}')
load=$(uptime | grep -ohe 'load average[s:][: ].*')
activeusers=$(uptime | grep -ohe '[0-9.*] user[s,]')
totalusers=$(cut -d: -f1 /etc/passwd | wc -l)
mostusedshell=$(cut -d: -f7 /etc/passwd | sort | uniq -c | sort -n -r | head -1 | xargs | cut -d" " -f2-)
lobytesreceived=$(cat /sys/class/net/lo/statistics/rx_bytes)
lobytestransmitted=$(cat /sys/class/net/lo/statistics/tx_bytes)
enbytesreceived=$(cat /sys/class/net/enp0s3/statistics/rx_bytes)
enbytestransmitted=$(cat /sys/class/net/enp0s3/statistics/tx_bytes)

if ping -c 1 google.com >> /dev/null 2>&1; then
  internet="Yes"
else
  internet="No"
fi

echo -e "\nCPU AND MEMORY RESOURCES---------------------------"
echo "CPU Load Average: $load     Free Ram: $freeram MB"

echo -e "\nNETWORK CONNECTIONS--------------------------------"
echo "lo Bytes Received: $lobytesreceived     lo Bytes Transmitted: $lobytestransmitted"
echo "enp0s3 Bytes Received: $enbytesreceived    enp0s3 Bytes Transmitted: $enbytestransmitted"
echo "Internet Connectivity: $internet"

echo -e "\nACCOUNT INFORMATION---------------------------------"
echo "Total Users: $totalusers     Active Users: $activeusers"
echo "Most Frequently Used Shell: $mostusedshell"
