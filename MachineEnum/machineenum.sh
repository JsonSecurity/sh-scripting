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
F="$bord [${cent}-${W}${bord}]$excr"

A="${W}$bord [${bol}${Y}!${W}${bord}]$excr"
E="${W}$bord [${bol}${R}✘${W}${bord}]$excr"
S="${W}$bord [${bol}${G}✓${W}${bord}]$excr"

I="$bord [${cent}\$${bord}]${cent}❯$excr"

U="$bord [${cent}${bord}]${cent}❯$excr"

#info
autor="${bol}$bord [${bol}${cent}𝙹𝚜𝚘𝚗 𝚂𝚎𝚌𝚞𝚛𝚒𝚝𝚢${bord}]"
script="${bol}$bord [${bol}${cent}𝙽𝚐𝚛𝚘𝚔 𝚏𝚘𝚛 𝚝𝚎𝚛𝚖𝚞𝚡${bord}]"

trap ctrl_c INT

ctrl_c() {
	echo -e "\n$T Machines Uncovered:$C $uncv"
	exit 1
}

if [[ $1 ]];then
	printf "\n$T Enumeration Machines\n\n"
	uncv=0
	for i in {2..254};do
		timeout 1 ping -c 1 "${1}.$i" > /dev/null 2>&1 && echo -e "    $S Active:$C $1.$i" && let uncv+=1
	done
else
	echo "
[*] Use:

machineenum.sh <ip-address>"
fi
