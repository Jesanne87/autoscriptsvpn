#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="Jesanne87"
#Colour
white='\e[0;37m'
green='\e[0;32m'
red='\e[0;31m'
blue='\e[0;34m'
cyan='\e[0;36m'
yellow='\e[0;33m'
NC='\e[0m'
clear
# // TEXT ON BOX COLOUR
export box=$(cat /etc/box)
# NUMBER COLOUR
number=$(cat /etc/number)
# // LINE COLOUR
export line=$(cat /etc/line)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# // BACKGROUND TEXT COLOUR
export back_text=$(cat /etc/back)
clear
echo -e ""
echo -e "   \e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "   \e[$line│                 \e[$box RESTART VPN SERVICE\e[30m                 \e[$line│\e[m"
echo -e "   \e[$line└──────────────────────────────────────────────────────┘\e[m"
echo -e "      [\e[$number 01${NC}]\e[$below • Restart All Services$NC"
echo -e "      [\e[$number 02${NC}]\e[$below • Restart OpenSSH$NC"
echo -e "      [\e[$number 03${NC}]\e[$below • Restart Dropbear$NC"
echo -e "      [\e[$number 04${NC}]\e[$below • Restart Stunnel4$NC"
echo -e "      [\e[$number 05${NC}]\e[$below • Restart OpenVPN$NC"
echo -e "      [\e[$number 06${NC}]\e[$below • Restart Squid$NC"
echo -e "      [\e[$number 07${NC}]\e[$below • Restart Restart Nginx$NC"
echo -e "      [\e[$number 08${NC}]\e[$below • Restart Xray Core$NC"
echo -e "      [\e[$number 09${NC}]\e[$below • Restart Trojan Ws & Tcp Tls$NC"
echo -e "      [\e[$number 10${NC}]\e[$below • Restart Badvpn$NC"
echo -e "      [\e[$number 11${NC}]\e[$below • Restart OHP $NC"
#echo -e "      [\e[$number 12${NC}]\e[$below • Restart WebSocket$NC"
echo -e ""
echo -e "              Press [ x ] To Go Main Menu "
echo -e ""
read -p "    Select From Options [1-12 or x] :" Restart
echo -e ""
case $Restart in
                1)
                clear
                /etc/init.d/ssh restart
                /etc/init.d/dropbear restart
                /etc/init.d/stunnel4 restart
                /etc/init.d/openvpn restart
                systemctl restart --now openvpn-server@server-tcp-1194
                systemctl restart --now openvpn-server@server-udp-2200
                /etc/init.d/fail2ban restart
                /etc/init.d/cron restart
                /etc/init.d/nginx restart
                /etc/init.d/squid restart
				systemctl restart xray
				systemctl restart xray@none
				systemctl restart xray@tcp
				systemctl restart xray@vless
				systemctl restart xray@vlessnone
				systemctl restart xray@vmess
				systemctl restart xray@vmessnone
				systemctl restart xray@trojan
				systemctl restart xray@trojannone
				systemctl restart ws-http
				systemctl restart ws-https
				systemctl restart ohp
				systemctl restart ohpd
				systemctl restart ohps
        #systemctl restart cdn-dropbear
				#systemctl restart cdn-ovpn
				#systemctl restart cdn-ssl
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
                echo -e ""
                echo -e "          \e[0;32mALL Service Restarted\e[0m         "
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
				echo ""
				read -n 1 -s -r -p "Press any key to back on menu"
				ssh
                ;;
                2)
                clear
                /etc/init.d/ssh restart
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
                echo -e ""
                echo -e "        \e[0;32mSSH Service Restarted\e[0m       "
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
				echo ""
				read -n 1 -s -r -p "Press any key to back on menu"
				ssh
                ;;
                3)
                clear
                /etc/init.d/dropbear restart
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
                echo -e ""
                echo -e "       \e[0;32mDropbear Service Restarted\e[0m     "
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
				echo ""
				read -n 1 -s -r -p "Press any key to back on menu"
				ssh
                ;;
                4)
                clear
                /etc/init.d/stunnel4 restart
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
                echo -e ""
                echo -e "        \e[0;32mStunnel4 Service Restarted\e[0m    "
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
				echo ""
				read -n 1 -s -r -p "Press any key to back on menu"
				ssh
                ;;
                5)
                clear
                /etc/init.d/openvpn restart
                systemctl restart --now openvpn-server@server-tcp-1194
                systemctl restart --now openvpn-server@server-udp-2200
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
                echo -e ""
                echo -e "       \e[0;32mOpenVPN Service Restarted\e[0m      "
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
				echo ""
				read -n 1 -s -r -p "Press any key to back on menu"
				ssh
                ;;
                6)
                clear
                /etc/init.d/squid restart
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
                echo -e ""
                echo -e "        \e[0;32mSquid3 Service Restarted\e[0m      "
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
				echo ""
				read -n 1 -s -r -p "Press any key to back on menu"
				ssh
                ;;
                7)
                clear
                /etc/init.d/nginx restart
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
                echo -e ""
                echo -e "         \e[0;32mNginx Service Restarted\e[0m      "
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
				echo ""
				read -n 1 -s -r -p "Press any key to back on menu"
				ssh
                ;;
		8)
                clear
				systemctl restart xray
				systemctl restart xray@none
				systemctl restart xray@vless
				systemctl enable xray@vlessnone
				systemctl restart xray@vmess
				systemctl restart xray@vmessnone
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
                echo -e ""
                echo -e "         \e[0;32mXray Service Restart\e[0m         "
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
				echo ""
				read -n 1 -s -r -p "Press any key to back on menu"
				ssh
                ;;
		9)
				clear
				systemctl restart xray@tcp
				systemctl restart xray@trojan
				systemctl restart xray@trojannone
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
                echo -e ""
                echo -e "      \e[0;32mAll Trojan Service Restart\e[0m      "
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
				echo ""
				read -n 1 -s -r -p "Press any key to back on menu"
				ssh
                ;;
                10)
                clear
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
                echo -e ""
                echo -e "       \e[0;32mBadvpn Service Restarted\e[0m     "
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
				echo ""
				read -n 1 -s -r -p "Press any key to back on menu"
				ssh
                ;;
		11)
				clear
                systemctl restart ohp
				systemctl restart ohpd
				systemctl restart ohps
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
                echo -e ""
                echo -e "         \e[0;32mOHP Service Restarted\e[0m     "
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
				echo ""
				read -n 1 -s -r -p "Press any key to back on menu"
				ssh
		;;
		12)
				clear
				systemctl restart ws-http
				systemctl restart ws-https
        systemctl restart cdn-dropbear
				systemctl restart cdn-ovpn
				#systemctl restart cdn-ssl
                echo -e ""
                echo -e "\e[$line•──────────────────────────────────────•\e[m"
                echo -e ""
                echo -e "      \e[0;32mWebSocket Service Restarted\e[0m     "
                echo -e ""
	            echo -e "\e[$line•──────────────────────────────────────•\e[m"
				echo ""
				read -n 1 -s -r -p "Press any key to back on menu"
				ssh
                ;;      
                x)
                clear
                ssh
                ;;
*)
echo "Please enter an correct number"
sleep 1
ssh
esac  
