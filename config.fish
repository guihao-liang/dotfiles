# created by guihaol on July 28 2018
#
####################### ALIASES #######################
# functions
# displays directory entries that begin with a dot.
alias l.="ls -d .*"
# git
alias gs='git status'
alias gd="git diff"
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
# use vim that installed by homebrew
# alias vim='/usr/local/bin/vim '
# add vertical list for brew
alias brews='brew list -1'
# grep
alias grep='grep --color'
# change to dotfiles
alias dot='cd ~/dotfiles'
# edit .zshrc
alias zshrc='vim $HOME/.zshrc'
# edit .vimrc
alias vimrc='vim $HOME/.vimrc'
alias nvimrc='nvim $HOME/.config/nvim/init.vim'
# edit .bashrc
alias bashrc='vim $HOME/.bashrc'
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

################## UTILITIES #######################

# cpp core dump settings
ulimit -c unlimited

#################### FUNCTIONS #####################

function tmns
    if [ (count $argv) -ne 1 ]
        echo "only one argument is accepted"
    else
        tmux new -s "$argv[1]" -n "$argv[1]"
    end
end

################## ENVIRONMENT ################## 
# Homebrew required, brew doctor to see more info
# fish list syntax; echo $PATH[1] or $PATH[1..2]
set PATH "/usr/local/sbin" $PATH
set -x ML_PATH "$HOME/ml"
set -x GTEST_ROOT "$HOME/3rd_party/gtest"
set -x GMOCK_INCLUDE "$GTEST_ROOT/googlemock"
set -x GTEST_INCLUDE "$GTEST_ROOT/googletest"
set -x GMOCK_LINK "$GTEST_ROOT/build/googlemock"
set -x GTEST_LINK "$GTEST_ROOT/build/googlemock/gtest"
set -x GLOG_ROOT "$HOME/3rd_party/glog"
set -x BOOST_ROOT "$HOME/3rd_party/boost-current"

##################### HOST SPECIFIC SETTINGS #####################
if test $USER = "GuihaoLiang"

    alias ls="ls -GF"
	# go lang home dir
    set -gx BOOST_VERSION "1.67.0"
	set -gx GOPATH "$HOME/goToWork"
	# homebrew home dir
	set -gx HOMEBREW "/usr/local/Cellar/"
	# java installation dir
	set -gx JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home"
	# java leet code location
	set -gx JAVA_LEET "$HOME/IdeaProjects/leetcode.java/src/com/company"
	set -gx WORKON_HOME "$HOME/.virtualenvs"
	# Set up python version.
	set -gx VIRTUALENV_PYTHON "/usr/local/bin/python3"
	set -gx VIRTUALENVWRAPPER_PYTHON "/usr/local/bin/python3"
	set -gx PROJECT_HOME "$HOME/playground"

    # virtualenvwrapper for fish
    # eval (python3 -m virtualfish)

	# TODO: OPAM configuration
	# . /Users/guihaoliang/.opam/opam-init/init.zsh > /dev/null 2> /dev/null or true

	# virtualenvwrapper
	# source virtualenvwrapper.sh
	# export PROJECT_HOME=~/ENV
	# export WORKON_HOME=~/ENV
	set -gx PCPP "~/playground/Gui++"
	set -gx PVIM "~/playground/vim"

else if test (hostname) = "guihaol2"
	# # check whether ssh-agent is started
	# if [ -z "$ssh_auth_sock" ] ; then
	# 	eval `ssh-agent -s`
	# 	ssh-add $home/.ssh/guihaol2_rsa
	# fi
	# reuse the same socket
	# find SSH_AGENT_PID by ps -aux | grep ssh-agent
	# "ssh-agent -s" is what you want for the socket 
	if test ! -S $HOME/.ssh/ssh_auth_sock
		eval (ssh-agent -c)
		ln -sf $SSH_AUTH_SOCK "$HOME/.ssh/ssh_auth_sock"
        ssh-add -l > /dev/null; or ssh-add $HOME/.ssh/guihaol2_rsa
	end
    set -gx SSH_AUTH_SOCK "$HOME/.ssh/ssh_auth_sock"
	set -gx JAVA_HOME '/usr/lib/jvm/jdk-8-oracle-x64'
	set -gx WORKON_HOME "$HOME/.virtualenvs"
	set -gx PROJECT_HOME "$HOME/hotpot"
	set -gx VIRTUALENVWRAPPER_PYTHON "/usr/bin/python3"
	# source /usr/local/bin/virtualenvwrapper.sh
    eval (python3 -m virtualfish)

else if test (hostname) = "guihaol1"
	set -gx WORKON_HOME "$HOME/.virtualenvs"
    set -gx ENV $WORKON_HOME

end

# load .bashrc is there's any. Failed due to incompatibility.
# [[ -e ~/.bashrc ]] && emulate sh -c 'source ~/.bashrc'
#
###################### PYENV ########################
# make sure system has pyton3 and pip3
# append pyenv script at last, which will add pyenv into path
set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx PATH "$PYENV_ROOT/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
