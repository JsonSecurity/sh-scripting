#!/bin/bash

#colores
W="\e[0m"
N="\e[30;1m"
n="\e[30m"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
P="\e[35m"
C="\e[36m"
L="\e[37;2m"

#resaltado
rW="\e[48m"
rN="\e[40;1m"
rG="\e[42m"
rY="\e[43m"
rB="\e[44m"
rP="\e[45m"
rC="\e[46m"
rL="\e[47m"

#mas
bol="${W}\033[1m"
cur="\033[3m"
sub="\033[4m"

#salidas/entradas
cent=$C
bord=$N
excr=$W

T="$bord [${cent}+${W}${bord}]$excr"
M="$bord [${cent}*${W}${bord}]$excr"
F="$bord [${cent}-${W}${bord}]$excr"

A="${W}$bord [${bol}${Y}!${W}${bord}]$excr"


if [[ $1 ]];then
	printf "\n$M Port Scan\n\n"
	for port in {1..65535};do
		timeout 1 bash -c "echo '' > /dev/tcp/$1/$port" 2>/dev/null && echo -e "  $T $port -$G OPEN" &
	done;wait
else
	echo -e "\n$A Usage:$G portScan.sh <ip>"
	exit 1
fi
