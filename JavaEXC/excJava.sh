#!/bin/bash

#colores
N="\e[30;1m"
R="\e[31;1m"
G="\e[32;1m"
Y="\e[33;1m"
B="\e[34;1m"
C="\e[36;1m"
L="\e[2;0m"
U="\e[9;1m"
LL="\e[37;0m"
W="\e[0;0m"

#true
T="$G [${W}+${G}]$W"
T1="$L [${G}+${L}]$W"
T2="$B [${R}+${B}]$W"
#false
F="$G [${W}-${G}]$W"
F1="$L [${R}-${L}]$W"
F2="$B [${R}-${B}]$W"
#err
Fa="\n$W [${R}!${W}]$W"
#flechas
FB="${C}❯$W"
FR="${R}❯$W"
FG="${G}❯$W"
#check
wait="$W [$C $W ]"
exito="$W [$G ✓$W ]"
error="$W [$R ✘$W ]"
Qu="$G [${W}?${G}]$W"

excJava() {
	clear
	echo -e  "\n$FB Compilando $wait"
	javac "${file}.java"

	if [[ $? -eq 0 ]];then
		#clase=$(echo ${file%%.*})
		echo -e "$FG Ejecutando $exito"
		result=$(java $file)
		echo -e "$G \n$result"
	else
		echo -e "\n$FR Error al compilar $error"
	fi
}

while getopts ":f:" arg;do
	case $arg in
		f) file=$OPTARG;excJava;;
	esac
done 
