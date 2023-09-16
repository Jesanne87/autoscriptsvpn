#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="Jesanne87"
echo -e "\e[32mloading...\e[0m"
clear
echo " "
echo "===========================================";
echo " ";
if [ -e "/root/log-limit.txt" ]; then
echo "User Who Violate The Maximum Limit";
echo "Time - Username - Number of Multilogin"
echo "-------------------------------------";
cat /root/log-limit.txt
else
echo " No user has committed a violation"
echo " "
echo " or"
echo " "
echo " The user-limit script not been executed."
fi
echo " ";
echo "===========================================";
echo " ";
read -n1 -r -p "Press any key to continue..."
    sleep 1
    ssh
