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

#true
T="$G [${W}+${G}]$W"
T1="$L [${G}+${L}]$W"
T2="$B [${R}+${B}]$W"
#false
F="$G [${W}-${G}]$W"
F1="$L [${R}-${L}]$W"
F2="$B [${R}-${B}]$W"
#err
Fa="\n$L [${R}!${L}]$W"
#mas
Wa="$B [${R}...${B}]$W"
Ch="$G [${C}✓${G}]$W"
Qu="$G [${W}?${G}]$W"
#entradas
YN="$G [${W}Y${G}/${W}N${G}]\n$G [${W}?${G}]$W •❯❯$B "
Nu="$G [${W}#${G}]$W •❯❯$B"
In="$R •${R}❯${R}❯$C"
In1="$R •${G}❯${B}❯${N}❯${Y}"

opusTOmp3() {
	len_opus=$(ls | grep .opus | wc -l)
	audio_change="audio_"
	formato_change=".mp3"
	for i in $(seq 1 $len_opus);do
		top_opus=$(ls | grep .opus | head -n 1)
		printf "$Ch $top_opus\n"
		change_mp3=$(mv $top_opus "$audio_change${i}${formato_change}")
	done
}

opusTOmp3
