#!/bin/bash

if [[ ! $1 ]];then
	echo -e "\n[+] $0 <texto>\n"
	exit 1
fi

W="\e[0;1m"
R="\e[38;2;145;62;210m"
G="\e[38;2;189;255;0m"

banner() {
	echo -e """$R
	 __      __           ___.           ___ ___                     .__                        
	/  \    /  \   ____   \_ |__        /   |   \  _____      ______ |  |__     ____   _______  
	\   \/\/   / _/ __ \   | __ \      /    ~    \ \__  \    /  ___/ |  |  \  _/ __ \  \_  __ \ 
	 \        /  \  ___/   | \_\ \     \    Y    /  / __ \_  \___ \  |   Y  \ \  ___/   |  | \/ 
	  \__/\  /    \___  >  |___  /      \___|_  /  (____  / /____  > |___|  /  \___  >  |__|    
	       \/         \/       \/             \/        \/       \/       \/       \/           
	                                  [$W Json Security$R ] $W"""
}

webHasher() {
	echo -e "\n [+] WebHasher$R\n"

	echo -e "$W [+] Starting$R php$W server...$G\n"
	php -S 0.0.0.0:80 2>/dev/null &
	sleep 3
	
	ip=$(ifconfig | grep "192.168." | awk '{print $2}')

	curl "http://$ip/hasher.php?pass=$1"

	echo -e "$W\n [!] Finishing...\n"
	sleep 1
	killall -9 php
}

banner
webHasher
