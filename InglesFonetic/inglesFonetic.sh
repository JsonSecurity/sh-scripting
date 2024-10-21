#!/bin/bash

#colores
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

m=$C
b=$N

#use
V="$b [${m}+${b}]$W"
E="$b [${m}+${b}]$W"
F="$b [${Y}!${b}]$W"
result="$N [${R}*${N}]$W"
#var global
palabra=""

banner() {
	echo -e "$N$C
   ▀▀▌───────▐▀▀
   ▄▀░◌░░░░░░░▀▄
  ▐░░◌░▄▀██▄█░░░▌ $b[$m Ingles Fonetic$b ]$C
  ▐░░░▀████▀▄░░░▌
   ▀▄▄▄▄▄▄▄▄▄▄▄▀ 
"	
}

usage() {
	echo -e "
 [*] Ingles Fonetic - Json Security
 [+] Usage:

   $0 -p	# palabra
" | bat -l java -pp
}

fonetic() {
	banner
	touch dic.txt
	buscar=$(cat dic.txt | grep "^${palabra}$" -A 2)
	if [[ -n $buscar ]];then
		printf "\n$V Dicionario\n"
		printf "\n [*] $buscar\n" | bat -l java -pp
		exit 0
	else
		printf "\n$E Buscando...\n"
		peticion=$(curl -s -N "https://easypronunciation.com/es/english/word/${palabra}" > palabra.txt);sleep 1
		if [ $(cat palabra.txt | wc -w) != "0" ];then
			americano=$(cat palabra.txt | tr '<|>' '\n' | grep h4 -A 1 | grep "\[" | awk 'NR==1')
			britanico=$(cat palabra.txt | tr '<|>' '\n' | grep h4 -A 1 | grep "\[" | awk 'NR==2')
			if [[ -n $americano || -n $britanico ]];then
				printf "\n$result Americano:$m $americano\n$result Britanico:$m $britanico\n";sleep 1
				printf "\n$E Guardando...\n"
				echo "$palabra" >> dic.txt
				echo "	Americano: $americano" >> dic.txt
				echo "	Britanico: $britanico" >> dic.txt
				echo " " >> dic.txt
				rm palabra.txt
				exit 0
			else
				printf "\n$F No pudimos encontrar la palabra$m $palabra\n"
				rm palabra.txt
			fi
		else
			printf "$F A ocurrido un error\n"
			rm palabra.txt
			exit 1
		fi
	fi
}

if [ ! $1 ];then
	usage
fi

while getopts p: arg ; do
    case $arg in
    	p) palabra=$OPTARG;fonetic;;
    	*) usage;;
    esac
done
