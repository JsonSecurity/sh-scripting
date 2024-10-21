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
autor="${bol}$bord [${bol}${info}𝙹𝚜𝚘𝚗 𝚂𝚎𝚌𝚞𝚛𝚒𝚝𝚢${bord}]"
script="${bol}$bord [${bol}${info}WhereLoc$bord -$info beta${bord}]"

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
