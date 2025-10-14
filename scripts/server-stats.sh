#!/bin/bash

# uso CPU
echo "--------- || Use of CPU: || ---------"
mpstat -P ALL
echo ""

# uso memoria total (free y en uso)
echo "-------- || Use of Memory(mb): || ---------"
free -m
echo ""
# uso disco (free y en uso)
echo "---- || DISKS: || ----"
lsblk
echo ""
echo "---- || Disk Usage: || ----"
df -h
echo "---- || Total disk space: || ----"
df -h --total | grep total
echo ""
# top 5 procesos
echo "---- || Top 5 Processes by usage: || ----"
ps aux k-pcpu | head -6
echo ""

echo "---- || System info || ----"
uname -a
echo ""

echo "---- || Logged users in the server || ----"
who
echo ""

echo "---- || You are || ----"
whoami
