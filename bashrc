# bash config file
# by: Cami Carballo
# LAST EDIT: 16 August 2019

# DEFAULT TEXT EDITOR
export EDITOR='vim'

# ZEPHYR SDK
export ZEPHYR_TOOLCHAIN_VARIANT='zephyr'
export ZEPHYR_SDK_INSTALL_DIR='/opt/zephyr-sdk'
export ZEPHYR_BASE='/home/camelot/zephyrproject/zephyr'

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#############
## HISTORY ##
#############

HISTCONTROL=ignoreboth #ignore duplicate lines & lines starting with spaces
shopt -s histappend #append to history file
HISTSIZE=1000
HISTFILESIZE=2000

#############
## WINDOWS ##
#############

shopt -s checkwinsize #check the windowsize after each command

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

set_title(){
  ORIG=$PS1
  TITLE="\e]2;$*\a"
}

############
## COLORS ##
############

# prompt
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u\[\033[01;00m\]@\[\033[01;35m\]\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#############
## ALIASES ##
#############

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -i'
alias vim='vim -S ~/.vimrc'
alias open='xdg-open'

alias zbase='cd /home/camelot/zephyrproject/zephyr' # zephyr alias
alias steven='camelot@10.0.0.23' #steven alias

alias armgdb='/opt/zephyr-sdk/arm-zephyr-eabi/bin/arm-zephyr-eabi-gdb'

# run virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
export WORKON_HOME=~/Environments

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
