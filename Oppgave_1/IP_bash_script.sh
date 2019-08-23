# Create a simple "Hello World" -bash script. This is to ensure that Bash is properly installed and working on your machine.

#!/bin/bash
echo hello world


# Develop a bash script that takes an IP (IPv4) from a user. Based on this IP, the script should ping all (255) IPs within that range. For example, if the user enters the IP 192.168.1.50, the script should ping every IP from 192.168.1.1 to 192.168.1.255 *Hint:* use read to get input from the user.
#!/bin/bash
read -p "Enter beginning IP-address: " host1
read -p "Enter ending IP-address: " host2
SUBNET=${host1%.*}
netId1=${host1#$SUBNET.}
netId2=${host2#$SUBNET.}
for ((i=netId1; i<=netId2; i++)); do
ping -c 1 ${SUBNET}.$i
done

# Update the script so that the script only prints the IPs of which there was a reply. *Hint:* It might be easier to temporarily store the results in a file
#!/bin/bash
prefix=${1:-192.168.1}

for ip in `seq 1 255`
do
  ( echo ping -c1 -w1 ${prefix}.${ip} > /dev/null 2>&1 && echo ${prefix}.${ip} ) &
done
wait
