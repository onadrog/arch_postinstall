#!/bin/bash
# Script Name   : Base sway
# Author        : Sébastien Gordano
# Date          : 08/2022
# Version       : 0.2
# Usage         : bash base_sway.sh
# Description   : Install the basics for the use of Swaywm on Arch linux
#===========================================================================
printf "Oi mate, Welcome to Onadrog's helper !\n\n"
echo 'Are you running a laptop ?'
PS3='Make a choice (e.g: 1, 2): '
options=("Yes" "No")

select opt in "${options[@]}"
do
  is_laptop="$opt"
  break;
done


#############################################
#               BASIC INSTALL               #
#############################################

sudo pacman -Syu --noconfirm && \
    sudo pacman -S --noconfirm \
    sway tlp bringhtnessctl mvp \
    playerctl neovim reflector \
    cups docker docker-compose fstrim \
    ufw keepassxc swaylock swayidle \
    base-devel zsh nodejs npm yarn \
    alacritty pcmanfm waybar swaybg \
    clipman otf-font-awesome gammastep \
    upower

#############################################
#             INSTALL AUR HELPER            #
#############################################

echo "Choose an AUR helper from the list: "
PS3='Make a choice: (e.g: 1, 2)'
options=("yay" "paru") 

select opt in "${options[@]}"
do
    echo "Installing $opt helper"
    git clone https://aur.archlinux.org/${opt}.git
    cd $opt
    makepkg -si;;
    cd
    $opt -Y --gendb
    $choice -Syu --devel
    $choice -S --noconfirm brave ly bemenu-dmenu nerd-fonts-fira-code greetd gtkgreet
    echo "$opt installed"
    break ;
done

#############################################
#               SYSTEMD SERVICES            #
#############################################

echo "Enabling systemd services..."

systemctl enable reflector.timer cups.service fstrim.service docker.service ufw.service NetworkManager.service

if [ $is_laptop == "Yes" ];
then
  systemctl enable tlp upower
fi
#############################################
#                CONF SHELL                 #
#############################################

echo "alias clean='sudo pacman -Qtdq | sudo pacman -Rns -'\nexport EDITOR='nvim'" > ~/.zshrc

chsh -s /usr/bin/zsh
autoload -Uz zsh-newuser-install
zsh-newuser-install -f

echo "Zsh configured"

#############################################
#                DOWNLOAD NvChad            #
#############################################

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

#############################################
#            COPY CONF FILES                #
#############################################

ln -rs * .config
ln -rs custom .config/nvim/lua

#############################################
#            REBOOT SYSTEM                  #
#############################################

echo "Base Sway Installation done system will now reboot..."
reboot
