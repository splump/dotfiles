#
# ~/.bashrc
#

#export TERM=xterm-256color

# Import ssh aliases
source ~/.ssh_aliases
source ~/.bash_aliases

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export SUDO_EDITOR=vim
export PATH="$PATH:$HOME/.bin:/usr/bin/core_perl"
export EDITOR=vim
export HISTCONTROL=ignoredups
export HISTFILE=$HOME/.bash_history
export HISTFILESIZE=5000
export HISTIGNORE=
export HISTSIZE=2000
export HISTTIMEFORMAT="%a %b %Y %T %z "

complete -cf sudo
[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh
shopt -s checkwinsize

# Git stuff
bashgitprompt='$(__git_ps1)'
source /usr/share/git/completion/git-prompt.sh

if [[ ${EUID} == 0 ]] ; then
  PS1="\[\033[38;5;1m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;69m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;1m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
else
  PS1="\[\033[38;5;249m\]\u\[$(tput sgr0)\]\[\033[38;5;245m\]@\[$(tput sgr0)\]\[\033[38;5;240m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;12m\]\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]"$bashgitprompt" \[$(tput sgr0)\]\[\033[38;5;5m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
fi

#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
