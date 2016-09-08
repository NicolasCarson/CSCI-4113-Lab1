#!/bin/bash
#Nicolas Carson Lab1 CSCI:4114
export TERM=${TERM:-dumb}

clear

space=$(df / | grep -oP '\d+(?=%)')
memlimit=80

echo "Current Memory used is: $space"

if [[ $space -gt $memlimit ]];
then
  echo "Warning Message"
  echo -e "Warning Memory in / Directory is >80% full" | /usr/sbin/sendmail "MemWarning" root
fi
