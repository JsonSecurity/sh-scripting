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
#parrot
pa="${R}•${G}•${Y}•"
#name
nick="${W}[${G}Json Security${W}]"
#opciones #
uno="$G [${W}1${G}]$W"
dos="$G [${W}2${G}]$W"
tres="$G [${W}3${G}]$W"

printf "$T ----\n$T1 ----\n$T2 ----\n"
printf "$F ----\n$F1 ----\n$F2 ----\n"

