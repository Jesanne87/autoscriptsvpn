#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="Jesanne87"
clear
echo -e "\e[32mloading...\e[0m"
clear
read -p "Input USERNAME to change password: " username
egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
read -p "Input new PASSWORD for user $username: " password

clear
echo "Connecting to Server..."
sleep 0.5
echo "Generating New Password..."
sleep 0.5
  egrep "^$username" /etc/passwd >/dev/null
  echo -e "$password\n$password" | passwd $username
  clear
  echo " "
  echo "-------------------------------------------"
  echo -e "Password for user ${blue}$username${NC} successfully changed."
  echo -e "The new Password for user ${blue}$username${NC} is ${red}$password${NC}"
  echo "-------------------------------------------"
  echo " "

else
echo " "
echo -e "Username ${red}$username${NC} not found in your VPS"

    sleep 1.5
    ssh 
fi
