#!/bin/bash

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

banner() {
	echo -e """$W
          _
         | | _____ _   _ ___
  _____  | |/ / _ \ | | / __|  _____
 |_____| |   <  __/ |_| \__ \ |_____|
         |_|\_\___|\__, |___/     
                    |___/

            Json Security
	"""
}

setkey() {
	log=$(cat keys | grep $skey | awk '{print $2}' FS=":::")
	
	if [[ -n $log ]];then
		echo $log > $ruta
		#echo -e "\n$T extra-keys$G 1.0 $autor\n"
		banner
		termux-reload-settings
		echo -e "[+] key configurated: $skey" | bat -l java -pp
	else
		echo -e "\n[!] key not found"
	fi
}

help() {
	banner
	echo -e "[*] Usage:\n    ./extra-keys.sh <namekey>\n\n[+] Keys:" | bat -l java -pp
	cat keys | awk '{print $1}' FS=":::" | bat -l java -pp
}

if [[ $1 ]];then
	skey=$1
	setkey
else
	verify
	help
fi
