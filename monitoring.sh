#!/bin/bash 

# Arquitetura
arch=$(uname -a)

# CPU fisica
cpuf=$(lscpu | grep 'Soquete(s)' | awk '{print $2}')

# CPU virtual
cpuv=$(lscpu | grep 'CPU(s):' | awk '{print $2}')

# RAM
total_ram=$(free -m | grep Mem | awk '{print $2}')
used_ram=$(free -m | grep Mem | awk '{print $3}')
perc_ram=$(free -m | grep Mem | awk '{printf("(%.2f%%)"), $3/$2 * 100}')

# DISK
total_disk=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{disk_t += $2} END {printf ("%.1fGb\n"), disk_t/1024}')
used_disk=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{disk_u += $3} END {print disk_u}')
perc_disk=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{disk_u+= $3} {disk_t+= $2} END {printf("(%d%%)"), disk_u/disk_t*100}')

# CPU LOAD
cpul=$(vmstat 1 2 | tail -1 | awk '{printf $15}')
cpu_op=$(expr 100 - $cpul)
cpu_fin=$(printf "%.1f" $cpu_op)

# LAST BOOT
last_reboot=$(uptime -s | cut -d ':' -f 1,2)

# LVM 
lvm_active=$(if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo yes; else echo no; fi)

# NUMBER OF CONNEXIONS
number_c=$(ss -s | grep ESTAB | wc -l)

# NUMBER OF CONNECTED USERS 
users_con=$(users | wc -w)

# NETWORK
ip=$(hostname -I)
mac=$(ip addr show | grep link/ether | awk '{print $2}')

# SUDO
sudo_quan=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

wall	" Architecture: $arch
		  CPU physical: $cpuf
		  vCpu: $cpuv
		  Memory Usage: $used_ram/${total_ram}MB $perc_ram
		  Disk Usage: $used_disk/${total_disk} $perc_disk
		  CPU Load: $cpu_fin%
		  Last boot: $last_reboot
		  LVM Use: $lvm_active
		  Connections TCP: $number_c ESTABILISHED
		  User log: $users_con
		  Network: IP $ip ($mac)
		  Sudo: $sudo_quan cmd"
		 