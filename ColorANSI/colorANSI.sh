#!/bin/bash                              
#colores
R="\e[31m"
G="\e[32;1m"
Y="\e[33;1m"
B="\e[34m"
P="\e[31;1m"
C="\e[1;34m"
W="\e[0m"
L="\e[10;1m"
N="\e[30;1m"
Or="\e[38;2;243;165;50m"

#salidas/entradas
b=$N
c=$Or
e=$W

#true
T="$b [${c}+${b}]$W"
T1="$L [${G}+${L}]$W"
T2="$N [${Y}+${N}]$W"
#false
F="$G [${W}-${G}]$W"
F1="$L [${R}-${L}]$W"
F2="$B [${R}-${B}]$W"
#err
alert="$b [${R}!${b}]$e"
#mas
Wa="$b [${R}...${b}]$e"
Ch="$b [${G}✓${b}]$e"
Qu="$b [${c}?${b}]$e"
Fail="$b [${R}✘${b}]$e"
A="$b •${c}❯❯$e "

hex_to_ansi() {
    local hex="$1"
    local red=$((16#${hex:0:2}))
    local green=$((16#${hex:2:2}))
    local blue=$((16#${hex:4:2}))
    
	#printf "$Ch e[38;2;${red};${green};${blue}m"
	#printf "\n"
    echo -e "${Ch}\e[38;2;${red};${green};${blue}m  e[38;2;${red};${green};${blue}m"
}

# Ejemplo de uso
printf "$T Hex:$e "
read hex_color
#hex_color="F3A532"
#ansi_code=$(hex_to_ansi "$hex_color")
echo -e $(hex_to_ansi "$hex_color")
#echo $ansi_code
#echo -e "${ansi_code}Hola, mundo!"
