#!/bin/bash

#colors
R="\e[31;1m"
G="\e[32;1m"
Y="\e[33;1m"
W="\e[0;1m"

#use
V="$W [${G}+${W}]$Y "
banner="$Y [[[[[[[[[[${W}JsonSecurity${Y}]]]]]]]]]]"

pid=$(ps -all | awk '{print $4}' | tr -d 'PID')
cmd=$(ps -all | awk 'NF{print $NF}' | tr -dd 'CMD')

PSkill() {
	clear
	while true;do
		#printf "$banner\n\n"
		printf "$Y      [${R}PID${Y}]\t   [${R}CMD${Y}]\n"
		cont=2
		psnum=1
		for i in $pid;do
		c=$(ps -all | awk 'NF{print $NF}' | tr -dd 'CMD' | awk "NR==$cont")
		printf "$G [${W}${psnum}${G}]$Y [${W}$i${Y}]\t  [${W}$c${Y}]\n"
		let cont+=1
		let psnum+=1
		done
		printf "\n$V Command$Y [${R}#${Y}] [${R}Enter${Y}]\n$V "
		read op
		if [ ! -n "$op" ];then
			clear
			continue
			printf "\nContinue\n"
		else
			let op+=1
			fil=$(ps -all | awk '{print $4}' | tr -d 'PID' | awk "NR==$op")
			fil2=$(ps -all | awk 'NF{print $NF}' | tr -dd 'CMD' | awk "NR==$op")
			k=$(kill -9 "$fil" 2>/dev/null)
			clear
			printf "\n$V Killed$Y [${W}$fil${Y}]\t  [${W}$fil2${Y}]\n\n"
		fi
	done
}

PSkill
