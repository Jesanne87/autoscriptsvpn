#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="Jesanne87"
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
echo ""
version=$(cat /home/ver)
ver=$( curl https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/version.conf )
clear
#Style
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "\033[0;33mDowloading Scripts \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "\033[0;33mPlease Wait \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32mDownload Complete !\033[1;37m"
    tput cnorm
    }
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
# CEK UPDATE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info1="${Green_font_prefix}($version)${Font_color_suffix}"
Info2="${Green_font_prefix}(LATEST VERSION)${Font_color_suffix}"
Error="Version ${Green_font_prefix}[$ver]${Font_color_suffix} available${Red_font_prefix}[Please Update]${Font_color_suffix}"
#Status Version
if [[ $version < $ver ]]; then
sts="${Error}"
else
sts="${Info2}"
fi
clear
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│                 \e[$box CHECK NEW UPDATE\e[30m                    \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘\e[m"
echo -e "\e[$below VERSION NOW >> $Info1"
echo -e "\e[$below STATUS UPDATE >> $sts"
echo -e ""
echo -e "       \e[1;31mWould you like to proceed?\e[0m"
echo ""
echo -e "            \e[0;32m[ Select Option ]\033[0m"
echo -e "[\e[$number 01${NC}]\e[$below • Check Script Update Now\e[m"
echo -e "[\e[$number 02${NC}]\e[$below • Back To Update Menu\e[m"
echo -e "[\e[$number 03${NC}]\e[$below • Back To Main Menu\e[m"
echo -e ""
echo -e "\e[$line--------------------------------------------------------\e[m"
echo -e "\e[$line"
read -p "Please Choose 1-3 : " option2
case $option2 in
1)
version=$(cat /home/ver)
new_version=$( curl https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/version.conf | grep $version )
if [ $version = $new_version ]; then
clear
echo -e "\e[1;31mChecking New Version, Please Wait...!\e[m"
sleep 3
clear
echo -e "\e[1;31mUpdate Not Available\e[m"
clear
sleep 1
echo -e "\e[1;36mYou Have The Latest Version\e[m"
echo -e "\e[1;31mThankyou.\e[0m"
sleep 2
update
fi
clear
echo -e "\e[1;31mUpdate Available Now..\e[m"
sleep 2
echo -e "\e[1;36mStart Update For New Version, Please Wait..\e[m"
sleep 2
clear
echo -e "\e[0;32mGetting New Version Script..\e[0m"
sleep 1
# RUN UPDATE
clear
echo -e "\e[0;32mPlease Wait...!\e[0m"
sleep 6
clear
echo -e "\e[0;32mNew Version Downloading started!\e[0m"
sleep 2
cd /usr/bin
rm -f update
rm -f run-update
rm -f change-port
rm -f system
rm -f menu
rm -f check-sc
rm -f certv2ray
rm -f trojaan
rm -f xray-menu
rm -f vless-menu
rm -f vmess-menu
rm -f xp
rm -f port-xray
rm -f themes
rm -f backup
rm -f restore
rm -f add-host
rm -f about
rm -f add-ssh
rm -f trial
rm -f del-ssh
rm -f member
rm -f delete
rm -f cek-ssh
rm -f restart
rm -f speedtest
rm -f info
rm -f renew-ssh
rm -f autokill
rm -f ceklim
rm -f tendang
rm -f clean-ram
rm -f port-ovpn
rm -f port-ssl
rm -f port-squid
rm -f port-websocket
rm -f user-list
rm -f user-lock
rm -f user-unlock
rm -f user-password
rm -f antitorrent
rm -f cfa
rm -f cfd
rm -f cfp
rm -f check-sc
rm -f ssh
rm -f autoreboot
rm -f port-ohp
rm -f dns
rm -f nf
rm -f traffic
rm -f log-cleaner
rm -f xrayacc
rm -f limit-speed
# // download script
echo -e "${GB}[ INFO ]${NC} ${YB}Downloading Scripts${NC}"
install_scripts () {
wget -q -O add-host "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/add-host.sh"
wget -q -O about "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/about.sh"
wget -q -O menu "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/menu/menu.sh"
wget -q -O add-ssh "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/add-ssh.sh"
wget -q -O trial "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/trial.sh"
wget -q -O del-ssh "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/del-ssh.sh"
wget -q -O member "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/member.sh"
wget -q -O delete "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/delete.sh"
wget -q -O cek-ssh "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/cek-ssh.sh"
wget -q -O restart "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/restart.sh"
wget -q -O speedtest "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/speedtest_cli.py"
wget -q -O info "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/info.sh"
wget -q -O renew-ssh "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/renew-ssh.sh"
wget -q -O autokill "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/autokill.sh"
wget -q -O ceklim "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/ceklim.sh"
wget -q -O tendang "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/tendang.sh"
wget -q -O clean-ram "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/clean-ram.sh"
wget -q -O change-port "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/menu/change.sh"
wget -q -O port-ovpn "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/change-port/port-ovpn.sh"
wget -q -O port-ssl "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/change-port/port-ssl.sh"
wget -q -O port-squid "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/change-port/port-squid.sh"
wget -q -O port-websocket "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/change-port/port-websocket.sh"
wget -q -O xp "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/xp.sh"
wget -q -O user-list "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/user-list.sh"
wget -q -O user-lock "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/user-lock.sh"
wget -q -O user-unlock "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/user-unlock.sh"
wget -q -O user-password "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/user-password.sh"
wget -q -O cfa "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/cloud/cfa.sh"
wget -q -O cfd "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/cloud/cfd.sh"
wget -q -O cfp "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/cloud/cfp.sh"
wget -q -O check-sc "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/running.sh"
wget -q -O ssh "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/menu/ssh.sh"
wget -q -O autoreboot "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/autoreboot.sh"
wget -q -O port-ohp "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/change-port/port-ohp.sh"
wget -q -O port-xray "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/change-port/port-xray.sh"
wget -q -O system "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/menu/system.sh"
wget -q -O update "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/update/update.sh"
wget -q -O run-update "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/update/run-update.sh"
wget -q -O dns "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/dns.sh"
wget -q -O nf "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/nf.sh"
wget -q -O traffic "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/menu/traffic.sh"
wget -q -O log-cleaner "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/clear-log.sh"
wget -q -O xrayacc "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/xrayacc.sh"
wget -q -O limit-speed "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/limit-speed.sh"
wget -q -O backup "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/backup.sh"
wget -q -O restore "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/restore.sh"
wget -q -O certv2ray "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/cloud/cert.sh"
wget -q -O trojaan "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/menu/trojaan.sh"
wget -q -O xray-menu "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/menu/xray-menu.sh"
wget -q -O vless-menu "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/menu/vless-menu.sh"
wget -q -O vmess-menu "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/menu/vmess-menu.sh"
}
fun_bar 'install_scripts'
echo -e "${GB}[ INFO ]${NC} ${YB}Download All Scripts Done${NC}"
sleep 1
clear
chmod +x add-host
chmod +x menu
chmod +x add-ssh
chmod +x trial
chmod +x del-ssh
chmod +x member
chmod +x delete
chmod +x cek-ssh
chmod +x restart
chmod +x speedtest
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x renew-ssh
chmod +x clean-ram
chmod +x change-port
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-squid
chmod +x port-websocket
chmod +x xp
chmod +x user-list
chmod +x user-lock
chmod +x user-unlock
chmod +x user-password
chmod +x cfa
chmod +x cfd
chmod +x cfp
chmod +x check-sc
chmod +x ssh
chmod +x autoreboot
chmod +x port-ohp
chmod +x port-xray
chmod +x system
chmod +x themes
chmod +x update
chmod +x run-update
chmod +x dns
chmod +x nf
chmod +x traffic
chmod +x log-cleaner
chmod +x xrayacc
chmod +x limit-speed
chmod +x backup
chmod +x restore
chmod +x certv2ray
chmod +x trojaan
chmod +x xray-menu
chmod +x vless-menu
chmod +x vmess-menu
clear
echo -e ""
echo -e "\e[0;32mDownloaded successfully!\e[0m"
echo ""
ver=$( curl https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/version.conf )
sleep 1
echo -e "\e[0;32mPatching New Update, Please Wait...\e[0m"
echo ""
sleep 2
echo -e "\e[0;32mPatching... OK!\e[0m"
sleep 1
echo ""
echo -e "\e[0;32mSucces Update Script For New Version\e[0m"
cd
echo "$ver" > /home/ver
clear
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│                   \e[$box SCRIPT UPDATED\e[30m                    \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘\e[m"
echo ""
read -n 1 -s -r -p "            Press any key to back on menu"
menu
;;
2)
clear
update
;;
3)
clear
system
;;
*)
clear
echo -e "\e[1;31mPlease Enter Option 1-2 or x & y Only..,Try again, Thank You..\e[0m"
sleep 1
run-update
;;
esac
