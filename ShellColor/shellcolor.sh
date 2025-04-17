#!/bin/bash

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

#colores
W="\e[38;2;255;255;255m"
N="\e[38;2;86;101;115m"
R="\e[38;2;232;24;10m"
G="\e[38;2;232;24;10m"
Y="\e[38;2;255;167;2m"
B="\e[38;2;2;75;255m"
P="\e[38;2;251;17;187m"
C="\e[38;2;17;251;248m"
L="\e[38;2;255;167;2m"
M="\e[38;2;178;151;240m"

#salidas/entradas
cent=$C
bord=$N
excr=$W
info=$cent

T="$bord [${cent}+${W}${bord}]$excr"
F="$bord [${cent}-${W}${bord}]$excr"

A="${W}$bord [${bol}${Y}!${W}${bord}]$excr"
E="${W}$bord [${bol}${R}✘${W}${bord}]$excr"
S="${W}$bord [${bol}${G}✓${W}${bord}]$excr"

I="$bord [${cent}\$${bord}]${cent}❯$excr"
U="$bord [${cent}${bord}]${cent}❯$excr"

YN="$bord[${cent}Y${bord}/${cent}N${bord}]${excr}"

#info
autor="${bol}$bord [$W ${info}Json Security${bord} ]"
script="${bol}$bord [$W ${info}Gemini${bord} ]"

clear

shellcolor() {
echo -e "$N N$W ${rN} res ${W}$N ${sub}sub$W"
echo -e "$R R$W ${rR} res ${W}$R ${sub}sub$W"
echo -e "$G G$n ${rG} res ${W}$G ${cur}sub$W"
echo -e "$Y Y$n ${rY} res ${W}$Y ${bol}sub$W"
echo -e "$B B$n ${rB} res $W "
echo -e "$P P$n ${rP} res $W "
echo -e "$C C$n ${rC} res $W "
echo -e "$L L$n ${rL} res $W "
echo -e "$W W$W ${rW} res $W \n"

echo -e "$T $F $A $E $S $I $U"
echo -e "$autor $script"
}

clear
shellcolor
