#!/bin/bash                              

tmp="\e[38;2;0;255;94m"
exa=
W="\e[0m"
cc="\e[38;2;255;0;64m"

banner() {
	echo -e """$cc
             _____     _______      _________ .___           
            /  _  \    \      \    /   _____/ |   |          
   ______  /  /_\  \   /   |   \   \_____  \  |   |   ______ 
  /_____/ /    |    \ /    |    \  /        \ |   |  /_____/ 
          \____|__  / \____|__  / /_______  / |___|          
                  \/          \/          \/                                                    
                   $W [$cc Json Security$W ] ${W}
"""
}

hex_to_ansi() {
    local hex="$1"
    local red=$((16#${hex:0:2}))
    local green=$((16#${hex:2:2}))
    local blue=$((16#${hex:4:2}))

    echo -e "\e[38;2;${red};${green};${blue}m  e[38;2;${red};${green};${blue}m"
}

banner

if [[ ! $1 ]];then
	echo -e "\n [!] $0 <HEX>\n"
	exit 1
fi

echo -e $(hex_to_ansi "$1")
