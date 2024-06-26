autoload -Uz compinit
compinit

# Emacs keybindings, necessary after setting EDITOR=vim, needs to be close to the top
# or fzf will fail
bindkey -e

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Base16 Shell
# Requires git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Source zsh plugins, requires installing antibody
# curl -sfL git.io/antibody | sh -s - -b /usr/local/bin, brew install antibody or AUR
# Order of loading plugins is important
source <(antibody init)
antibody bundle romkatv/powerlevel10k
antibody bundle Aloxaf/fzf-tab
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions

# Aliases and variables
alias vi="vim"
alias pacman="pacman --color auto"
alias grep='grep --color=auto'
alias rsync='rsync --info=progress2'
alias top="htop"
alias weather='curl v2.wttr.in'
alias sway='source ~/.config/sway/envvars.conf && sway'

export EDITOR="vim"

OS="$(uname -a)"

if [[ "$OS" == *WSL2* ]]; then
  fzf_base_dir="/usr/share/doc/fzf/examples"
  source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
elif [[ "$OS" == Darwin* ]]; then
  alias ls="ls -G"
  # Set LS_COLORS for fzf (requires brew install coreutils)
  eval $(gdircolors -b)
  fzf_base_dir="/opt/homebrew/var/homebrew/linked/fzf/shell"
elif [[ "$OS" == *arch* ]]; then
  alias pkill='pkill -i -e'
  alias pgrep='pgrep -i'
  alias ip="ip -c"
  alias ls="ls --color=auto --quoting-style=literal"
  # Set LS_COLORS for fzf
  eval $(dircolors -b)
  fzf_base_dir="/usr/share/fzf"
  export WORKON_HOME=~/.virtualenvs
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
  source /usr/bin/virtualenvwrapper.sh
fi

# Additional paths
addtopath=(
	"$HOME/git/bin"
	"$HOME/git/bin/${HOST}"
  "/usr/local/opt/python/libexec/bin"
)

# Discard duplicates from $PATH and $path
typeset -U PATH path

# Add all paths from addtopath array
for i in "$addtopath[@]"; do
  if [[ -e "$i" ]]; then
    path+=("$i")
  fi
done

# Export $PATH
export PATH

# Source fzf
# Requires fzf to be installed, brew install fzf och MacOS
[[ $- == *i* ]] && source "${fzf_base_dir}/completion.zsh" 2> /dev/null
source "${fzf_base_dir}/key-bindings.zsh"

# Modules
# Allows for e.g ztcp example.com 80
zmodload zsh/net/tcp

# For autocompletion of command line switches for aliases
setopt COMPLETE_ALIASES

# The file where the history is stored
HISTFILE="$HOME/.zsh_history"
# Number of events loaded into memory
HISTSIZE=10000
# Number of events stored in the zsh history file
SAVEHIST=10000
# Enable timestamps for zsh history
setopt EXTENDED_HISTORY
# Make ZSH behave like bash with globbing
setopt nonomatch
# Disable warning
POWERLEVEL9K_INSTANT_PROMPT=quiet

# Cache zsh completion results
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Try to complete with sudo
zstyle ':completion::complete:*' gain-privileges 1

# set list-colors to enable filename colorizing
# run build-fzf-tab-module in the shell once to enable
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Automatically rehash
zstyle ':completion:*' rehash true

# Load 24-bit color if terminal allows it
[[ "$COLORTERM" == (24bit|truecolor) || "${terminfo[colors]}" -eq '16777216' ]] || zmodload zsh/nearcolor

