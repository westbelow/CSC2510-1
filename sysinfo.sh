#!/bin/bash
mkdir system_info
touch system_info/system_info.txt
echo "System information has been gathered. Here's the summary:" > system_info/system_info.txt 
echo "Date and time" >> system_info/system_info.txt
date +"%D %R:%S %Z" >> system_info/system_info.txt
echo "User: $USER" >> system_info/system_info.txt
echo "Current working directory:" >> system_info/system_info.txt
pwd >> system_info/system_info.txt
echo >>  system_info/system_info.txt
echo "System Usage:">> system_info/system_info.txt
top -b -n 1 | head -n 5 >> system_info/system_info.txt
echo >> system_info/system_info.txt
echo "Disk Usage:" >> system_info/system_info.txt
df -h >> system_info/system_info.txt
cat system_info/system_info.txt
