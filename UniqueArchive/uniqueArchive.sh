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
script="${bol}$bord [${bol}${cent}Resent Backup${bord}]"

requirements() {
	if [[ ! $(command -v locate) ]];then
		printf "\n$E Instalando$G locate"
		pkg install mlocate > /dev/null 2>&1
	fi
}

uniqueAchive() {
	printf "\n$T Unique Archive\n\n"

	for arch in $(ls | xargs ls | sort | uniq -u | grep -v ':');do
		name=$(find . -name $arch | cut -c3-)
		if [[ $(echo $name | tr ' ' '\n' |  wc -l ) -eq 1 ]];then
			echo -e "$S $name"
		fi
	done
}

start() {
	requirements
	uniqueAchive
}

start
