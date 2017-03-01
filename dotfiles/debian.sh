#!/bin/bash

confirm_install () {
	read -p "Install $1? [y/n]: " $ans
	if [[ -z $ans || $ans == "y" || $ans == "Y" ]]; then
		sudo apt-get install $1
	elif [[ $ans != "N" && $ans != "n" ]]; then
		echo error input
		exit 35
	fi
}

apt_get_update_upgrade () {
	sudo apt-get update
	sudo apt-get upgrade
}
set +e

echo "preparation:
step 1: add to sudoers
su -
adduser guihaol2 sudo
logout 
groups | grep sudo

step 2: apt list
modify /etc/apt/source.list
comment the line that forces pkg from installation media
"

# step 3: install all necessary pkgs
apt_get_update_upgrade
sudo apt-get upgrade sudo

# install git
confirm_install "git"

# zsh
echo "chsh -s to change shell"
confirm_install "zsh"

# zsh pkg manager
confirm_install "zsh-antigen"

# vim Vundle
echo "Installing Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sleep 5

# copy & link all configuration files from my repo
echo adding configuration from my repo
git clone https://github.com/Jarvi-Izana/dotfiles.git 
shopt -s dotglob
cd $HOME/dotfiles
echo "change to $HOME/dotfiles/"
for f in *
do 
	if [[ -f $f && $f =~ ^\.+ ]]; then
		echo "link $f? [Y/N]"
		read ans
		if [[ -z $ans || $ans == "y" || $ans == "Y" ]]; then
			if [[ -e $HOME/$f ]]; then
				rm "$HOME/$f"
			fi
			ln -s "$HOME/dotfiles/$f"  "$HOME/$f"
		fi
	fi
done
cd -

# tmux
echo "Installing tmux"
echo "Adding jessie backports first [Y/N]"
apt_get_update_upgrade
read ans
if [[ $ans == "n" || $ans == "N" ]]; then
	echo "Tmux installation terminated."
	exit 35
fi
sudo apt-get -t jessie-backports install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Enter tmux and <prefix>+I to install plugins."
