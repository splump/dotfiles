#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export SUDO_EDITOR=vim
export PATH="$HOME/.bin:$PATH:/usr/bin/core_perl"
export EDITOR=vim
export HISTCONTROL=ignoredups
export HISTFILE="${HOME}/.bash_history"
export HISTFILESIZE=5000
export HISTIGNORE=
export HISTSIZE=2000
export HISTTIMEFORMAT="%a %b %Y %T %z "

# Check windowsize after each command
shopt -s checkwinsize

# Git stuff
bashgitprompt='$(__git_ps1 " (%s)")'

# SSH-agent stuff
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Source additional files if available

sourceme=(
  "$HOME/dotfiles/.ssh_aliases"
  "$HOME/dotfiles/.bash_aliases"
  "$HOME/dotfiles/.env_$(hostname)"
  "$HOME/dotfiles/git-prompt.sh"
  #Requires bash-completion to be installed
  "/usr/share/bash-completion/bash_completion"
  #Requires command-not-found to be installed
	"/etc/profile.d/cnf.sh"
)

for i in "${sourceme[@]}"; do
  if [[ -e "$i" ]]; then
    source "$i"
  fi
done

if [ -n "$SSH_CLIENT" ]; then
  ssh='\[$(tput bold)\]\[\e[1m\]\[\033[38;5;254m\]\h\[$(tput sgr0)\] '
fi

if [[ "$USER" != "$DEFAULT_USERNAME" ]]; then
  showuser='\[\033[38;5;199m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]\[$(tput bold)\] >\[$(tput sgr0)\] '
fi

if [ ${EUID} -eq 0 ]; then
  export PS1=''"$showuser"''"$ssh"'\[\033[38;5;74m\]\w\[$(tput sgr0)\]'"$bashgitprompt "'\[\033[38;5;1m\]✖ \[$(tput sgr0)\]'
else
  export PS1=''"$showuser"''"$ssh"'\[\033[38;5;74m\]\w\[$(tput sgr0)\]'"$bashgitprompt "'\[\033[38;5;255m\]∞ \[$(tput sgr0)\]'
fi
