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

if [[ $(hostname) == "ash" ]]; then
	source ~/.env_ash
fi

if [[ $(hostname) == "bishop" ]]; then
	source ~/.env_bishop
fi

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
