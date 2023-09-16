#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="Jesanne87"
if [ -f /etc/debian_version ]; then
	UIDN=1000
elif [ -f /etc/redhat-release ]; then
	UIDN=500
else
	UIDN=500
fi
echo " "
echo "-----------------------------------"
echo "        USER ACCOUNTS LIST         "
echo "-----------------------------------"
echo "[USERNAME]   -   [DATE EXPIRED]  "
echo " "
while read ceklist
do
        AKUN="$(echo $ceklist | cut -d: -f1)"
        ID="$(echo $ceklist | grep -v nobody | cut -d: -f3)"
        exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
        if [[ $ID -ge $UIDN ]]; then
        printf "%-17s %2s\n" "$AKUN" "$exp"
        fi
done < /etc/passwd
read -p "Username SSH to Delete : " Pengguna
if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel $Pengguna
        echo -e "User $Pengguna was removed."
else
        echo -e "Failure: User $Pengguna Not Exist."
fi
echo ""
read -n1 -r -p "Press any key to continue..."
    sleep 1
    ssh

