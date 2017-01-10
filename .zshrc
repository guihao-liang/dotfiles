# Path to your oh-my-zsh installation.
export ZSH=/Users/guihaoliang/.oh-my-zsh

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
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
plugins=(git osx zsh-autosuggestions)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
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



################## personal config ##################
# alias
# displays directory entries that begin with a dot.
alias l.='ls -d .*'
# show dirs in current stack.
alias dirs='dirs -v '
# activate virtualenv for python development under mkvirtualenv dir.
# alias activate='source ./bin/activate'
# show all virsions of certain executable.
alias which='which -a '
# use vim that installed by homebrew
# alias vim='/usr/local/bin/vim '
################## ZSH FUNTIONALITY #############
# Disable ! extension on history number or !! for previous cmd.
set -K


################## ENVIRONMENT ################## 
# go lang home dir
export GOPATH=$HOME/goToWork
# homebrew home dir
export HOMEBREW=/usr/local/Cellar/
# java installation dir
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home
# java leet code location
export JAVA_LEET=$HOME/IdeaProjects/leetcode.java/src/com/company
# export git=$git/usr/lcoal/Cellar/git/2.6.0/bin/git

# Postgres
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

# Set up python version.
export VIRTUALENV_PYTHON=/usr/local/bin/python3

# OPAM configuration
. /Users/guihaoliang/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# virtualenvwrapper
# source virtualenvwrapper.sh
# export PROJECT_HOME=~/ENV
# export WORKON_HOME=~/ENV
export CPP=~/Desktop/Gui++

# set up vim playground
export VP=~/Desktop/VIM_code
export PATH="/usr/local/sbin:$PATH"
