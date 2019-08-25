# 2) Create a simple "Hello World" -bash script. This is to ensure that Bash is properly installed and working on your machine.

#!/bin/bash
echo hello world


# 3) Develop a bash script that takes an IP (IPv4) from a user. Based on this IP, the script should ping all (255) IPs within that range. For example, if the user enters the IP 192.168.1.50, the script should ping every IP from 192.168.1.1 to 192.168.1.255 *Hint:* use read to get input from the user.

#!/usr/bin/env bash
COUNTER=1

read -p 'IP-address: ' ip
while [ $COUNTER -lt 255 ]
do
  ping $(echo $ip | cut -c 1-10)$COUNTER -c 1
  COUNTER=$(( $COUNTER + 1 ))
done

# 4) Update the script so that the script only prints the IPs of which there was a reply. *Hint:* It might be easier to temporarily store the results in a file

#!/bin/bash
prefix=${1:-192.168.1}

for ip in `seq 1 255`
do
  ( ping -c1 -w1 ${prefix}.${ip} > /dev/null 2>&1 && echo ${prefix}.${ip} ) &
done
wait

# 5) Update the script so that the user can use command-line arguments to ping an IP

#!/usr/bin/env bash
ping $1 -c 4
