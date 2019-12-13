#!/bin/bash

apt-get update && apt-get upgrade

# install zsh
apt-get install -y zsh curl git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

apt-get install -y vim

# install blog deps
apt-get install -y ruby-full build-essential zlib1g-dev
echo '# Install Ruby Gems to ~/gems' >> ~/.zshrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.zshrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

gem install jekyll bundler
