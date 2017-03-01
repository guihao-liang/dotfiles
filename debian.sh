#!/bin/bash
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
sudo apt-get update
sudo apt-get upgrade
sudo apt-get upgrade sudo

# install git
echo installing git
sudo apt-get install git

# zsh pkg manager
echo installing zsh-antigen
sudo apt-get install zsh-antigen

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# copy all coniiguration files from my repo
git clone https://github.com/Jarvi-Izana/dotfiles.git 
shopt -s dotglob
cd $HOME/dotfiles
echo "change to $HOME/dotfiles/"
for f in *
do 
	if [[ -f $f && $f =~ ^\..* ]]; then
		echo "link $f? [Y/N]"
		read ans
		if [[ $ans == "Y" || $ans == "y" ]]; then
			ln -s $HOME/dotfiles/$f $HOME/$f
		fi
	fi
done
cd -

# tmux
echo "Installing tmux"
echo "Adding jessie backports first[Y/N]"
read ans
if [[ $ans == "n" || $ans == "N" ]]; then
	echo "Tmux installation terminated."
	exit
fi
sudo apt-get -t jessie-backports install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Enter tmux and <prefix>+I to install plugins."
