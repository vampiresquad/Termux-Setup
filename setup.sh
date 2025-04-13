#!/bin/bash

# Colors
R='\033[1;31m' # Red
G='\033[1;32m' # Green
Y='\033[1;33m' # Yellow
B='\033[1;34m' # Blue
C='\033[1;36m' # Cyan
W='\033[1;37m' # White
NC='\033[0m'   # Reset

# Banner Setup Function
function set_banner() {
    echo -e "${G}[+] Choose Banner Type:"
    echo -e "${Y}1. Default Vampire Squad Banner"
    echo -e "2. Custom Banner"
    read -p $'\n'"${C}[?] Enter choice (1 or 2): ${NC}" banner_choice

    BANNER_FILE="$PREFIX/etc/motd"

    if [[ $banner_choice == "1" ]]; then
        cat << EOF > $BANNER_FILE
${R}╔════════════════════════════════════╗
${R}║${Y}        VAMPIRE SQUAD TERMINAL        ${R}║
${R}║${C}   Coded by: Muhammad Shourov (VAMPIRE) ${R}║
${R}╚════════════════════════════════════╝${NC}
EOF

    elif [[ $banner_choice == "2" ]]; then
        read -p "Enter your custom banner text: " custom_banner
        cat << EOF > $BANNER_FILE
${G}$custom_banner
${C}Coded by: Muhammad Shourov (VAMPIRE)${NC}
EOF

    else
        echo -e "${R}[!] Invalid option. Using default banner.${NC}"
        sleep 1
        set_banner
    fi
}

# Main Setup
clear
echo -e "${G}[+] Updating and Installing All Essential Packages..."
pkg update -y && pkg upgrade -y
pkg install -y git curl wget proot tar unzip zip \
python python2 ruby php nodejs \
clang make nano vim htop neofetch \
openssl termux-api openssh tsu net-tools \
zsh dnsutils nmap perl cowsay toilet figlet \
ncurses-utils lolcat

termux-setup-storage

# Set banner
set_banner

# Finish
echo -e "${Y}[*] Setup Complete!"
echo -e "${G}[*] Restart Termux to see your banner.${NC}"
