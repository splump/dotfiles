#
# ~/.bashrc
#

# Source additional files

sourceme=(
	"$HOME/.ssh_aliases"
	"$HOME/.bash_aliases"
	"$HOME/.env_$(hostname)"
	#Requires bash-completion to be installed
	"/usr/share/bash-completion/bash_completion"
	# Requires command-not-found to be installed
	"/etc/profile.d/cnf.sh"
)

for i in ${sourceme[@]}; do
  if [[ -e "$i" ]]; then
    source "$i"
  fi
done

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export SUDO_EDITOR=vim
export PATH="$HOME/.bin:$PATH:/usr/bin/core_perl"
export EDITOR=vim
export HISTCONTROL=ignoredups
export HISTFILE=$HOME/.bash_history
export HISTFILESIZE=5000
export HISTIGNORE=
export HISTSIZE=2000
export HISTTIMEFORMAT="%a %b %Y %T %z "

shopt -s checkwinsize

# Git stuff
bashgitprompt='$(__git_ps1)'
source /usr/share/git/completion/git-prompt.sh

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
