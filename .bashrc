#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Check which OS we're running
OSTYPE=$(uname -s)

export SUDO_EDITOR=vim
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
BASHGITPROMPT='$(__git_ps1 " (%s)")'

# Do mac stuff
if [[ "$OSTYPE" == "Darwin" ]]; then
  if which brew >/dev/null 2>&1; then
    if [[ -f "$(brew --prefix)/etc/bash_completion" ]]; then
      source "$(brew --prefix)/etc/bash_completion"
    else
      echo "bash_completion not installed, not sourcing"
    fi
  fi
  export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
  export WORKON_HOME=~/.virtualenvs
  [[ -f "$(brew --prefix)/bin/virtualenvwrapper.sh" ]] && source "$(brew --prefix)/bin/virtualenvwrapper.sh"
fi

# SSH-agent stuff
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Set up PATH

addtopath=(
	"$HOME/git/bin"
	"$HOME/git/bin/${HOSTNAME}"
  "/usr/local/opt/python/libexec/bin"
)

for i in "${addtopath[@]}"; do
  if [[ -e "$i" ]]; then
    export PATH="${i}:${PATH}:/usr/bin/core_perl"
  fi
done

# Source additional files if available

sourceme=(
  "$HOME/git/dotfiles/.bash_aliases"
  "$HOME/git/dotfiles/.env_$(hostname)"
  "$HOME/git/dotfiles/git-prompt.sh"
  # Requires bash-completion to be installed
  "/usr/share/bash-completion/bash_completion"
  # Requires command-not-found to be installed
  "/etc/profile.d/cnf.sh"
  # Requires fzf to be installed
  "/usr/share/fzf/key-bindings.bash"
  "/usr/share/fzf/completion.bash"
)

for i in "${sourceme[@]}"; do
  if [[ -e "$i" ]]; then
    source "$i"
  fi
done

if [ -n "$SSH_CLIENT" ]; then
  SSH='\[$(tput bold)\]\[\e[1m\]\[\033[38;5;199m\]\h\[$(tput sgr0)\] '
fi

if [[ "$USER" != "$DEFAULT_USERNAME" ]]; then
  SHOWUSER='\[\033[38;5;254m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]\[$(tput bold)\] >\[$(tput sgr0)\] '
fi

if [ ${EUID} -eq 0 ]; then
  export PS1=''"$SHOWUSER"''"$SSH"'\[\033[38;5;74m\]\w\[$(tput sgr0)\]'"$BASHGITPROMPT "'\[\033[38;5;1m\]✖ \[$(tput sgr0)\]'
else
  export PS1=''"$SHOWUSER"''"$SSH"'\[\033[38;5;74m\]\w\[$(tput sgr0)\]'"$BASHGITPROMPT "'\[\033[38;5;255m\]∞ \[$(tput sgr0)\]'
fi
