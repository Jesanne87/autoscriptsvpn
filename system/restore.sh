#!/bin/bash
###########- COLOR CODE -##############
NC="\e[0m"
RED="\033[0;31m" 
COLOR1='\e[0;32m'
COLBG1='\e[0m'
green='\e[0;32m'                  
###########- END COLOR CODE -##########
clear
cd
MYIP=$(curl -sS ipv4.icanhazip.com)
read -p "Your Backup file Name saved on GitHUB : " username
NameUser=$username
#NameUser=$(curl -sS https://raw.githubusercontent.com/msi8888/allow/main/accessmenu | grep $MYIP | awk '{print $2}')
cekdata=$(curl -sS https://raw.githubusercontent.com/Jesanne87/backup/main/$NameUser-$MYIP/$NameUser.zip | grep 404 | awk '{print $1}' | cut -d: -f1)

echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • RESTOR PANEL MENU •             ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
[[ "$cekdata" = "404" ]] && {
red "│  [INFO] Data not found / you never backup"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}            •   JsPhantom   •               "
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu
}
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • RESTOR PANEL MENU •             ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "│  [INFO] Data found for zipfile $RED$NameUser${NC}"
mkdir -p /root/backup
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Restore Data..."
read -rp "│  Password File: " -e InputPass
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Downloading data.."
wget -O /root/backup/backup.zip "https://raw.githubusercontent.com/Jesanne87/backup/main/$NameUser-$MYIP/$NameUser.zip" &> /dev/null
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Getting your data..."
unzip -P $InputPass /root/backup/backup.zip &> /dev/null
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Starting to restore data..."
rm -f /root/backup/backup.zip &> /dev/null
sleep 1
cd /root/backup
sleep 1
cp /root/backup/passwd /etc/ &> /dev/null
cp /root/backup/group /etc/ &> /dev/null
cp /root/backup/shadow /etc/ &> /dev/null
cp /root/backup/gshadow /etc/ &> /dev/null
cp /root/backup/chap-secrets /etc/ppp/  &> /dev/null
cp /root/backup/passwd1 /etc/ipsec.d/  &> /dev/null
cp -r /root/backup/xray /usr/local/etc/ &> /dev/null
rm -rf /root/backup &> /dev/null
echo -e "$COLOR1│${NC}  [ ${green}INFO${NC} ] • Done... Successfully - Script By JsPhantom"
sleep 1
rm -f /root/backup/backup.zip &> /dev/null
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                •   JsPhantom   •              "
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
echo -e "${RED}Reboot now ? (Y/N)${NC} "
read answer
if [ "$answer" == "${answer#[Yy]}" ] ;then
exit 0
else
reboot
fi