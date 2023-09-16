#!/bin/bash
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
clear
_APISERVER=127.0.0.1:10085
_APISERVER2=127.0.0.1:10086
_APISERVER3=127.0.0.1:10087
_APISERVER4=127.0.0.1:10088
_APISERVER5=127.0.0.1:10089
_XRAY=/usr/local/bin/xray

apidata () {
    local ARGS=
    if [[ $1 == "reset" ]]; then
      ARGS="reset: true"
    fi
    $_XRAY api statsquery --server=$_APISERVER "${ARGS}" \
    | awk '{
        if (match($1, /"name":/)) {
            f=1; gsub(/^"|link"|,$/, "", $2);
            split($2, p,  ">>>");
         printf "%s:%s->%s\t", p[1],p[2],p[4];
        }
        else if (match($1, /"value":/) && f){
          f = 0;
          gsub(/"/, "", $2);
         printf "%.0f\n", $2;
        }
        else if (match($0, /}/) && f) { f = 0; print 0; }
    }'
}
apidata2 () {
    local ARGS=
    if [[ $1 == "reset" ]]; then
      ARGS="reset: true"
    fi
    $_XRAY api statsquery --server=$_APISERVER2 "${ARGS}" \
    | awk '{
        if (match($1, /"name":/)) {
            f=1; gsub(/^"|link"|,$/, "", $2);
            split($2, p,  ">>>");
         printf "%s:%s->%s\t", p[1],p[2],p[4];
        }
        else if (match($1, /"value":/) && f){
          f = 0;
          gsub(/"/, "", $2);
         printf "%.0f\n", $2;
        }
        else if (match($0, /}/) && f) { f = 0; print 0; }
    }'
}
apidata3 () {
    local ARGS=
    if [[ $1 == "reset" ]]; then
      ARGS="reset: true"
    fi
    $_XRAY api statsquery --server=$_APISERVER3 "${ARGS}" \
    | awk '{
        if (match($1, /"name":/)) {
            f=1; gsub(/^"|link"|,$/, "", $2);
            split($2, p,  ">>>");
         printf "%s:%s->%s\t", p[1],p[2],p[4];
        }
        else if (match($1, /"value":/) && f){
          f = 0;
          gsub(/"/, "", $2);
         printf "%.0f\n", $2;
        }
        else if (match($0, /}/) && f) { f = 0; print 0; }
    }'
}
apidata4 () {
    local ARGS=
    if [[ $1 == "reset" ]]; then
      ARGS="reset: true"
    fi
    $_XRAY api statsquery --server=$_APISERVER4 "${ARGS}" \
    | awk '{
        if (match($1, /"name":/)) {
            f=1; gsub(/^"|link"|,$/, "", $2);
            split($2, p,  ">>>");
         printf "%s:%s->%s\t", p[1],p[2],p[4];
        }
        else if (match($1, /"value":/) && f){
          f = 0;
          gsub(/"/, "", $2);
         printf "%.0f\n", $2;
        }
        else if (match($0, /}/) && f) { f = 0; print 0; }
    }'
}
apidata5 () {
    local ARGS=
    if [[ $1 == "reset" ]]; then
      ARGS="reset: true"
    fi
    $_XRAY api statsquery --server=$_APISERVER5 "${ARGS}" \
    | awk '{
        if (match($1, /"name":/)) {
            f=1; gsub(/^"|link"|,$/, "", $2);
            split($2, p,  ">>>");
         printf "%s:%s->%s\t", p[1],p[2],p[4];
        }
        else if (match($1, /"value":/) && f){
          f = 0;
          gsub(/"/, "", $2);
         printf "%.0f\n", $2;
        }
        else if (match($0, /}/) && f) { f = 0; print 0; }
    }'
}
print_sum() {
    local DATA="$1"
    local PREFIX="$2"
    local SORTED=$(echo "$DATA" | grep "^${PREFIX}" | sort )
    local SUM=$(echo "$SORTED" | awk '
        /->up/{us+=$2}
        /->down/{ds+=$2}
        END{
            printf "\n\033[0;33mTOTAL\033[0m\nSUM->>>>>>\033[0;34mup\033[0m\t%.0f\nSUM->>>>>>\033[0;32mdown\033[0m\t%.0f\nSUM->>>>>>Total\t%.0f\n", us, ds, us+ds;
        }')
    echo -e "${SORTED}\n${SUM}" \
    | numfmt --field=2 --suffix=B --to=iec \
    | column -t
}

DATA=$(apidata $1)
DATA2=$(apidata2 $1)
DATA3=$(apidata3 $1)
DATA4=$(apidata4 $1)
DATA5=$(apidata5 $1)
clear;
echo
echo -e "\033[0;36m═══════════════[ \033[0;33mVLESS XTLS \033[0;36m]═══════════════\033[0m"
echo -e "  USER                           QUOTA USE"
echo -e ""
print_sum "$DATA" "user"
echo -e ""
echo -e "\033[0;36m═══════════[ \033[0;33mVLESS WS TLS/NTLS \033[0;36m]════════════\033[0m"
echo -e "  USER                           QUOTA USE"
echo -e ""
print_sum "$DATA2" "user"
echo -e ""
echo -e "\033[0;36m═════════════════[ \033[0;33mVMESS \033[0;36m]══════════════════\033[0m"
echo -e "  USER                           QUOTA USE"
echo -e ""
print_sum "$DATA3" "user"
echo -e ""
echo -e "\033[0;36m═════════════════[ \033[0;33mTROJAN \033[0;36m]══════════════════\033[0m"
echo -e "  USER                           QUOTA USE"
echo -e ""
print_sum "$DATA4" "user"
echo -e ""
echo -e "\033[0;36m═══════════════[ \033[0;33mTROJAN TCP\033[0;36m]═════════════════\033[0m"
echo -e "  USER                           QUOTA USE"
echo -e ""
print_sum "$DATA5" "user"
echo -e "\033[0;36m═════════════════════════════════════════════\033[0m"
echo ""
read -n1 -r -p " Press any key to continue..."
    sleep 1
    menu
