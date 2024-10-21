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
cent=$W$R
bord=$N
excr=$W

T="$bord [${cent}+${W}${bord}]$excr"
F="$bord [${cent}-${W}${bord}]$excr"

A="${W}$bord [${bol}${Y}!${W}${bord}]$excr"
E="${W}$bord [${bol}${R}✘${W}${bord}]$excr"
S="${W}$bord [${bol}${G}✓${W}${bord}]$excr"
I="$bord [${cent}\$${bord}]${cent}❯$excr"
U="$bord [${cent}${bord}]${cent}❯$excr"

autor="${bol}$bord [${bol}${cent}𝙹𝚜𝚘𝚗 𝚂𝚎𝚌𝚞𝚛𝚒𝚝𝚢${bord}]"
ruta="/data/data/com.termux/files/home/.termux/termux.properties"

verify() {
	if [ $(command -v  bat | wc -l) == 0 ];then
	    printf "\n$A Instalando$G bat\n"
	    pkg install bat -y > /dev/null 2>&1

		if [ $(echo $?) != 0 ];then
			printf "\n$E Error al instalar\n"
			exit 1
		fi
	fi
}

setkey() {
	log=$(cat keys | grep $skey | awk '{print $2}' FS=":::")
	
	if [[ -n $log ]];then
		echo $log > $ruta
		echo -e "\n$T extra-keys$G 1.0 $autor\n"
		termux-reload-settings
		echo -e "$S Key configurado:$G $skey"
	else
		echo -e "\n$A No encontrado"
	fi
}

help() {
	echo -e "\n[!] extra-keys Json Security;;\n\n[*] Usage:\n    ./extra-keys.sh <namekey>\n\n[+] Keys:" | bat -l java -pp
	cat keys | awk '{print $1}' FS=":::" | bat -l java -pp
}

if [[ $1 ]];then
	skey=$1
	setkey
else
	verify
	help
fi
