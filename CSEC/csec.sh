#!/bin/bash

#colores
R="\e[31;1m"
G="\e[32;1m"
Y="\e[33;1m"
C="\e[36;1m"
W="\e[0;1m"
#use
V="$G [${W}+${G}]$W"
P="$V ${C}•${G}❯❯❯$W"
N="$G [${W}#${G}]$W"
CD="$G [${W}CD${G}]$W"
#add
pa="${R}•${G}•${Y}•"
nick="${pa}${W}[${G}Json Security${W}]$pa"
#opciones #
uno="$G [${W}1${G}]$W"
dos="$G [${W}2${G}]$W"
tres="$G [${W}3${G}]$W"
#var global
ruta=""
carpeta=""
#rutas
raiz=$(pwd | tr '/' '\n' | grep home -B 100 | tr '\n' '/')
finC=$(find "$raiz" -name copias | grep Copia_De)
#finC="${rauz}storage/downloads"
copia="storage/downloads/copias"
finC="${raiz}$copia"
rutaA="$raiz"
#banner
banner='''
 
	  █████╗         ██████╗███████╗ █████╗
	 ██╔══██╗       ██╔════╝██╔════╝██╔══██╗
	 ██║  ╚═╝ █████╗╚█████╗ █████╗  ██║  ╚═╝
	 ██║  ██╗ ╚════╝ ╚═══██╗██╔══╝  ██║  ██╗
	 ╚█████╔╝       ██████╔╝███████╗╚█████╔╝
	  ╚════╝        ╚═════╝ ╚══════╝ ╚════╝ 
'''
lista() {
	printf "\n"
	num=1
	for i in $(ls "$rutaA");do
		printf "$G [${W}${num}${G}]$Y $i\n"
		#sleep .001
		let num+=1
	done
}
copias() {
	printf "\n$V Hacer una copia\n$P "
	read numCar
	if [ -n "$numCar" ];then
		carpeta=$(ls "$rutaA" | awk "NR==$numCar")
		printf "\n$V Ruta:${G} $copia\n\n"
		
		if [ $(ls "$finC" | grep "$carpeta") ];then
			rm -rf "${finC}/$carpeta"
			printf "$V ${G}Actualizando:${R} $carpeta\n"
			sleep 2
			cp -rf "${rutaA}/$carpeta" "${finC}/"
		else
			printf "$V ${G}Copiando:${R} $carpeta\n"
			cp -rf "${rutaA}/$carpeta" "${finC}/"
			sleep 2
		fi		
	else
		printf "$V Invalid\n"
		exit 1
	fi
}
car() {
	printf "\n\n$N Carpeta: "
	read carp
	if [ -n "$carp" ];then
		numC=$(ls "$rutaA" | awk "NR==$carp")
		cd "${rutaA}/$numC"
		rutaA=$(find $raiz -name "$numC")
		sleep 1
	fi
}
start() {
	printf "$G $banner\n\t  $nick\n\n"
	printf "$uno Entrar a una carpeta\t$dos Hacer una copia\n$P "
	read op
	if [ "$op" == "1" ];then
		lista
		car
		clear
		printf "$C $banner\n\t\t    $nick\n\n"
		lista
		copias
	elif [ "$op" == "2" ];then
		while true;do
			lista
			copias
			clear
		done
	fi
}

mkdir "$finC" > /dev/null 2>&1

start
