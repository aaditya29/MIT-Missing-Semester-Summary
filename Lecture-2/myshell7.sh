!/bin/zsh

# checking if a directory exists and if it exists updating the directory

if [ -d /etc/pacman.d ]
then
    sudo pacman -Syu
fi

if [ -d /etc/apt ]
then
    sudo apt update
    sudo apt dist-upgrade
fi