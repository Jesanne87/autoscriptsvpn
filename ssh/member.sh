#!/bin/bash
wget https://github.com/${GitUser}/
GitUser="Jesanne87"
# // Export Color & Information
export WH='\033[1;37m'                   
export RED='\033[0;31m'
export GRN='\033[0;32m'
export YLW='\033[0;33m'
export BLU='\033[0;34m'
export PLE='\033[0;35m'
export CYA='\033[0;36m'
export LHT='\033[0;37m'
export NC='\033[0m'
# LINE COLOUR
line=$(cat /etc/line)
clear
echo "•─────────────────────────────────────────────•"
echo "USERNAME          EXP DATE          STATUS"
echo "•─────────────────────────────────────────────•"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "         LOCKED${NORMAL}"
else
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "${GREEN}UNLOCKED${NORMAL}"
fi
fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo "•─────────────────────────────────────────────•"
echo "Account number: $JUMLAH user"
echo "•─────────────────────────────────────────────•"
echo ""
read -n1 -r -p "Press any key to continue..."
    sleep 1
    ssh
