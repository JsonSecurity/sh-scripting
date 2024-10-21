#!/bin/bash

#requiered
# html2text¹
#colores
N="\e[30;1m"
R="\e[31;1m"
G="\e[32;1m"
Y="\e[33;1m"
B="\e[34;1m"
C="\e[36;1m"
L="\e[37;1m"
W="\e[0;0m"

#true
T="$N [${G}+${N}]$W"
T1="$L [${G}+${L}]$W"
T2="$B [${R}+${B}]$W"
#false
F="$N [${R}-${N}]$W"
F1="$L [${R}-${L}]$W"
F2="$B [${R}-${B}]$W"
#err
Fa="$N [${R}!${N}]$W"
#mas
Wa="$B [${R}...${B}]$W"
Ch="$R [${W}✓${R}]$W"
Qu="$N [${R}?${N}]$W"

logo() {
	clear
	echo -e """ $R
 ▄   ▄
 █▀█▀█
 █▄█▄█     $N [${G}𝙹𝚜𝚘𝚗𝚂𝚎𝚌𝚞𝚛𝚒𝚝𝚢${N}]$R
  ███  ▄▄  $N [${G}𝚂𝚎𝚊𝚛𝚌𝚑 𝚆𝚘𝚛𝚍${N}]$R
  ████▐█ █
  ████   █
  ▀▀▀▀▀▀▀ 
			"""
}

verify() {
	if [[ ! $(command -v html2text) ]];then
		printf "\n$Wa Instalando:$G html2text\n"
		pkg install html2text > /dev/null 2>&1
	fi
}

maxlen() {
	max=0	
	for line in $palabras;do
		lenng=${#line}
		
		if [[ $lenng -ge $max ]];then
			max=$lenng
			palabra=$line
		fi
	done
	#echo "max:$max pal:$palabra"
	if [[ $dic == 0 ]];then
		echo $palabra >> dic.txt
	fi
	echo -e "$N [${G}✓${N}]$W $palabra$N [${B}$max Letras${N}]"
}
verdic() {
	coindic=$(cat dic.txt | grep "${letras}" | wc -l)
	if [[ $coindic > 0 ]];then
		echo -e "$T Diccionario"
		
		palabras=$(cat dic.txt | grep $letras)
		dic=1
		maxlen
	else
		dic=0
		search
	fi
}
search() {
	#consulta=$(curl -s -N "https://www.palabrascon.com/palabras-con.php?m=${letras}" > .todo.txt)
	#consulta=$(curl -s -N "https://www.palabrasde.com/palabras-con-${letras}" | html2text | tr ' ' '\n')
	#echo $consulta | tr ' ' '\n'
	#
	#consulta=$(curl -s -N "https://www.palabrasde.com/palabras-con-und" | html2text | tr ' ' '\n' | grep "und" | tail -n 5)
	#
	web=$(curl -s -N "https://www.diccionariodedudas.com/palabras-con-${letras}/" | html2text)
	n_result=$(echo "$web" | grep "Lista" | awk '{print $3}')

	let n_r=n_result-1
	if [[ $n_r > 1 ]];then
		echo -e "$T Search"
		palabras=$(echo "$web" | grep "$n_result" -A "$n_result" | tr -d '*| ' | tail -n $n_r)
		maxlen
	else
		echo -e "$Fa Sin coincidencias"
	fi
}
listar() {
	cont=1
	for line in $palabras;do
		echo -e "$G [${W}${cont}${G}]$W $line"
		let cont=cont+1
	done
}
start() {
	while true;do
		printf  "\n$Qu Palabras con:$G "
		read letras

		if [[ -n $letras ]];then
			verdic
		else
			echo -e "$F cadena bacia"
		fi
	done
}

logo
verify
start
