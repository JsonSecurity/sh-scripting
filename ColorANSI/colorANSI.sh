#!/bin/bash                              

tmp="\e[38;2;0;255;94m"
exa=
W="\e[0m"

banner() {
	echo -e """
             _    _   _ ____ ___
            / \  | \ | / ___|_ _|
  _____    / _ \ |  \| \___ \| |   _____
 |_____|  / ___ \| |\  |___) | |  |_____|
         /_/   \_\_| \_|____/___|

           ${tmp}  - Json Security - ${W}"""
}

hex_to_ansi() {
    local hex="$1"
    local red=$((16#${hex:0:2}))
    local green=$((16#${hex:2:2}))
    local blue=$((16#${hex:4:2}))

    echo -e "\e[38;2;${red};${green};${blue}m  e[38;2;${red};${green};${blue}m"
}

banner
while true;do

echo -e "\n${W}[+] Example: FF5803"
printf "[?] HEX: "
read hex_color

echo ""
echo -e $(hex_to_ansi "$hex_color")

done
