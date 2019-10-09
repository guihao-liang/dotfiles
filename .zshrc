# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(autojump)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  if [ ! -z $(which vim) ]; then
      export EDITOR='vim'
  else
      export EDITOR='vi'
  fi
else
  if [ ! -z $(which nvim) ]; then
      export EDITOR='nvim'
  elif [ ! -z $(which vim) ]; then
      export EDITOR='vim'
  else
      export EDITOR='vi'
  fi
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

############### syntax-highlighters #################
# load auto-suggestion and syntax-highlighting will lead to crash
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main root brackets) 
#
# To define styles for nested brackets up to level 4
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=white,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=red,bold'
#
# Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[function]='fg=white,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=white,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=red,bold'
# To disable highlighting of globbing expressions
ZSH_HIGHLIGHT_STYLES[globbing]='none'
# To differentiate aliases from other command types
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'

################## personal config ##################
# alias
# displays directory entries that begin with a dot.
alias l.='ls -d .*'
alias ls="ls -F"
# git
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git add"
alias gm="git commit -m"
alias gc="git checkout"
alias gpo="git push origin"
alias gpom="git push -u origin master"
alias gp="git push"
#
# show dirs in current stack.
#
alias dirs='dirs -v '
# activate virtualenv for python development under mkvirtualenv dir.
# alias activate='source ./bin/activate'
# show all virsions of certain executable.
alias which='which -a '

if [[ $(command -v nvim) ]]; then
    alias vim=nvim
elif [[ $OSTYPE =~ "darwin.*" ]]; then
    # use vim that installed by homebrew
    if [[ ! -x '/usr/local/bin/vim' ]]; then
        brew install vim
    fi
    alias vim='/usr/local/bin/vim '
fi
   
# add vertical list for brew
alias brews='brew list -1'
# grep
alias grep='grep --color'
# change to dotfiles
alias dot='cd ~/dotfiles'
# edit .zshrc
alias zshrc="$EDITOR $HOME/.zshrc"
# edit .vimrc
alias vimrc="$EDITOR $HOME/.vimrc"
alias nvimrc='nvim $HOME/.config/nvim/init.vim'
# edit .bashrc
alias bashrc="$EDITOR $HOME/.bashrc"
# fix the problem that in tmux mode, vim can't find the colorscheme
alias tm="tmux -2"
alias tmat='tmux attach -t'

# emacs no window server
alias em="emcas -nw"
# short for make, mk is already taken
alias m='make'
alias m2='make 2> /dev/null'
alias mc='make clean'
alias mr='make run'
alias mt='make test'
# check background jobs
alias j="jobs"
# neo vim
alias vi='nvim'
# vim
alias vr='vi -m' 
alias ve='vi -x'
# ssh
alias sg='ssh gui2'
# g++
alias g11='g++ -std=c++11'
alias g14='g++ -std=c++14'
alias g17='g++ -std=c++17'

################## FUNTIONS #############

function tmns()
{
    if [ $# -ne 1 ]; then
        echo "only one argument is accepted"
    else
        tmux new -s "$1" -n "$1"
    fi
}

# leet code
function leet()
{
    if [ $# -ne 1 ]; then
        echo "only one argument is accepted"
    else
        echo '#include "commonHeader.hpp"\n' >> "$1"
        code "$1"
    fi
}

function geet()
{
    if [ $# -ne 1 ]; then
        echo "only one argument is accepted"
    else
        echo '#include "commonHeader.hpp"\n' >> "$1"
        git add "$1"
        code "$1"
    fi
}

################## ZSH FUNTIONALITY #############
# Disable ! extension on history number or !! for previous cmd.
set -K

ulimit -c unlimited

################## ENVIRONMENT ################## 
# Homebrew required, brew doctor to see more info
export PATH="/usr/local/sbin:$PATH"

# virtualenv settings
export WORKON_HOME=$HOME/.virtualenvs

# pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# rust settings
export PATH="$HOME/.cargo/bin:$PATH"

################ os spefic settings #############
if [[ $OSTYPE =~ "darwin.*" ]]; then
elif [[ $OSTYPE =~ "linux.*" ]]; then
fi

############# host spefic settings ##############
# MY_HOST_ID is exported through .zprofile
if [[ $MY_HOST_ID == "home-mbp-0" ]]; then
    export ML_PATH="$HOME/ml"
    # gtest
    export GTEST_ROOT="$HOME/3rd_party/gtest"
    export GMOCK_INCLUDE="$GTEST_ROOT/googlemock"
    export GTEST_INCLUDE="$GTEST_ROOT/googletest"
    export GMOCK_LINK="$GTEST_ROOT/build/googlemock"
    export GTEST_LINK="$GTEST_ROOT/build/googlemock/gtest"
    export GLOG_ROOT="$HOME/3rd_party/glog"
    # boost
    export BOOST_ROOT="$HOME/3rd_party/boost-current"
    export BOOST_VERSION="1.67.0"
	# go lang home dir
	export GOPATH=$HOME/goToWork
	# homebrew home dir
	export HOMEBREW=/usr/local/Cellar/
	# java installation dir
	export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home
	# java leet code location
	export JAVA_LEET=$HOME/IdeaProjects/leetcode.java/src/com/company
	# Set up python version.
	export VIRTUALENV_PYTHON=/usr/local/bin/python3
	export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
	export PROJECT_HOME=$HOME/playground
    source $HOME/.pyenv/versions/3.6.2/bin/virtualenvwrapper.sh

	# OPAM configuration
	. /Users/guihaoliang/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

	# virtualenvwrapper
	# source virtualenvwrapper.sh
	# export PROJECT_HOME=~/ENV
	# export WORKON_HOME=~/ENV
	export CPP=~/playground/Gui++
	export PV=~/playground/vim

elif [[ $MY_HOST_ID == "work-linux-0" ]]; then
	# # check whether ssh-agent is started
	# if [ -z "$ssh_auth_sock" ] ; then
	# 	eval `ssh-agent -s`
	# 	ssh-add $home/.ssh/guihaol2_rsa
	# fi
	# reuse the same socket
	# find SSH_AGENT_PID by ps -aux | grep ssh-agent
	# "ssh-agent -s" is what you want for the socket 
	if [[ ! -S ~/.ssh/ssh_auth_sock ]]; then
		eval `ssh-agent -s`
		ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
	fi
	export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
	ssh-add -l > /dev/null || ssh-add ~/.ssh/guihaol2_rsa
	export JAVA_HOME='/usr/lib/jvm/jdk-8-oracle-x64'
	export PROJECT_HOME=$HOME/hotpot
	export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python3"
	source /usr/local/bin/virtualenvwrapper.sh
elif [[ $MY_HOST_ID == "work-mbp-0" ]]; then
elif [[ $MY_HOST_ID == 'home-mac-mini-0' ]]; then
fi

##################  antigen  ###################
# [[ and [ are different.
if [[ $OSTYPE =~ "linux.*" ]]; then
	source /usr/share/zsh-antigen/antigen.zsh 
elif [[ $OSTYPE =~ "darwin.*" ]]; then
	source /usr/local/share/antigen/antigen.zsh
fi
# Load the oh-my-zsh's library.
antigen use oh-my-zsh
# bundles under oh-my-zsh
antigen bundle git
# antigen bundle tmux
# antigen bundle tmuxinator
antigen bundle autojump
antigen bundle zsh_reload
antigen bundle command-not-found
antigen bundle gradle
antigen bundle colored-man-pages
antigen bundle fancy-ctrl-z
antigen bundle docker
antigen bundle docker-compose
# antigen bundle common-aliases # https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/common-aliases/common-aliases.plugin.zsh
# third party
antigen bundle rupa/z
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
#
if [[ $OSTYPE =~ "darwin.*" ]]; then
	antigen bundle osx
fi
#
antigen theme robbyrussell
# Tell antigen that you're done.
antigen apply

# load .bashrc is there's any. Failed due to incompatibility.
# [[ -e ~/.bashrc ]] && emulate sh -c 'source ~/.bashrc'

# append pyenv script at last
if [[ $(uname -s) == 'Linux' ]]; then
    if [[ ! -x $PYENV_ROOT/bin/pyenv ]]; then
        git clone https://github.com/yyuu/pyenv.git ~/.pyenv
        git clone https://github.com/yyuu/pyenv-virtualenvwrapper.git ~/.pyenv/plugins/pyenv-virtualenvwrapper
    fi
    eval "$(pyenv init -)";
    pyenv virtualenvwrapper
elif [[ $(which pyenv) > /dev/null ]]; then
    eval "$(pyenv init -)";
    if [[ $(which pyenv-virtualenv-init) > /dev/null ]]; then
      eval "$(pyenv virtualenv-init -)";
    fi
fi
