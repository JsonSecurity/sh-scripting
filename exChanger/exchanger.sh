#!/bin/bash

#colores
N="\e[30;1m"
R="\e[31;1m"
G="\e[32;1m"
Y="\e[33;1m"
B="\e[34;1m"
C="\e[36;1m"
L="\e[37;1m"
W="\e[0;1m"

T="$N [${C}✓${N}]$W"
I="$N [${R}+${N}]$W"

name="changed_"

exChanger() {
	EXT=$1;NEX=$2
	echo -e "\n$I $1 To $2\n"
	for i in $(ls | grep $EXT);do
		echo -e "$T $i"
		rand=$(< /dev/urandom tr -dc 'a-z' | head -c 3)
		mv $i "$name${rand}${NEX}"
	done
}
help() {
	echo -e """
 [!] Usage: $0 <ext> <new ext>

     $0 .opus .mp3
	"""	
}

if [[ ! $1 ]] || [[ ! $2 ]];then
	help
	exit 1
fi

exChanger $1 $2
